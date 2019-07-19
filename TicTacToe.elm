module Main exposing (main)

import Browser
import Css exposing (..)
import Html.Grid as Grid
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attrs
import Html.Styled.Events as Events
import Vector3 exposing (Index(..), Vector3)



-- MAIN --


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = Html.toUnstyled << view
        , update = update
        }



-- TYPES --


type alias Model =
    { board : Vector3 (Vector3 Spot)
    , turn : Player
    , winner : Maybe Player
    }


type Player
    = X
    | O


type Spot
    = Empty
    | Taken Player


type alias Coords =
    { row : Index
    , column : Index
    }


type Msg
    = SquareClicked Coords
    | PlayAgainClicked



-- HELPERS --


getAtCoords : Coords -> Vector3 (Vector3 Spot) -> Spot
getAtCoords { row, column } =
    Vector3.get column << Vector3.get row


initialModel : Model
initialModel =
    { board = Vector3.repeat (Vector3.repeat Empty)
    , turn = X
    , winner = Nothing
    }


mapBoard : (Vector3 (Vector3 Spot) -> Vector3 (Vector3 Spot)) -> Model -> Model
mapBoard f model =
    { model | board = f model.board }


setSquareToSpot : Player -> Coords -> Vector3 (Vector3 Spot) -> Vector3 (Vector3 Spot)
setSquareToSpot player { row, column } =
    Vector3.mapItem row (Vector3.set column (Taken player))


checkForWinConditions : Model -> Model
checkForWinConditions model =
    { model
        | winner =
            [ checkForHorizontalWin model.board
            , checkForVerticalWin model.board
            , checkForFirstDiagonalWin model.board
            , checkForSecondDiagonalWin model.board
            ]
                |> firstJust
    }


checkForSecondDiagonalWin : Vector3 (Vector3 Spot) -> Maybe Player
checkForSecondDiagonalWin board =
    let
        getAt : Index -> Index -> Spot
        getAt row column =
            getAtCoords { row = row, column = column } board

        diagonal : Vector3 Spot
        diagonal =
            Vector3.map2
                getAt
                Vector3.indices
                (Vector3.reverse Vector3.indices)

        isDiagonal : Player -> Bool
        isDiagonal player =
            diagonal == Vector3.repeat (Taken player)
    in
    if isDiagonal X then
        Just X

    else if isDiagonal O then
        Just O

    else
        Nothing


checkForFirstDiagonalWin : Vector3 (Vector3 Spot) -> Maybe Player
checkForFirstDiagonalWin board =
    let
        getAt : Index -> Spot
        getAt index =
            getAtCoords { row = index, column = index } board

        diagonal : Vector3 Spot
        diagonal =
            Vector3.initializeFromIndex getAt

        isDiagonal : Player -> Bool
        isDiagonal player =
            diagonal == Vector3.repeat (Taken player)
    in
    if isDiagonal X then
        Just X

    else if isDiagonal O then
        Just O

    else
        Nothing


checkForHorizontalWin : Vector3 (Vector3 Spot) -> Maybe Player
checkForHorizontalWin =
    let
        isThreeInARow : Vector3 Spot -> Maybe Player -> Maybe Player
        isThreeInARow row winnerState =
            let
                rowIsAll : Player -> Bool
                rowIsAll player =
                    row == Vector3.repeat (Taken player)
            in
            if rowIsAll X then
                Just X

            else if rowIsAll O then
                Just O

            else
                winnerState
    in
    Vector3.foldr isThreeInARow Nothing


checkForVerticalWin : Vector3 (Vector3 Spot) -> Maybe Player
checkForVerticalWin board =
    let
        isThreeInAColumn : Index -> Maybe Player -> Maybe Player
        isThreeInAColumn column winnerState =
            let
                getFirstColumnOfRow : Index -> Spot
                getFirstColumnOfRow row =
                    getAtCoords { row = row, column = column } board

                columnIsAll : Player -> Bool
                columnIsAll player =
                    Vector3.initializeFromIndex getFirstColumnOfRow
                        == Vector3.repeat (Taken player)
            in
            if columnIsAll X then
                Just X

            else if columnIsAll O then
                Just O

            else
                winnerState
    in
    Vector3.foldr isThreeInAColumn Nothing Vector3.indices


firstJust : List (Maybe a) -> Maybe a
firstJust maybes =
    case maybes of
        [] ->
            Nothing

        (Just value) :: _ ->
            Just value

        _ :: rest ->
            firstJust rest


toggleTurn : Model -> Model
toggleTurn model =
    { model
        | turn =
            case model.turn of
                X ->
                    O

                O ->
                    X
    }


playerToString : Player -> String
playerToString player =
    case player of
        X ->
            "X"

        O ->
            "O"



-- UPDATE --


update : Msg -> Model -> Model
update msg model =
    case msg of
        SquareClicked coords ->
            model
                |> toggleTurn
                |> mapBoard (setSquareToSpot model.turn coords)
                |> checkForWinConditions

        PlayAgainClicked ->
            initialModel



-- VIEW --


view : Model -> Html Msg
view model =
    let
        mainContent : List (Html Msg)
        mainContent =
            [ List.map rowView <| Vector3.toIndexedList model.board
            , winView model.winner
            ]
                |> List.concat
    in
    Grid.box
        [ borderTop3 (px 1) solid (hex "#000000")
        , display block
        , width (px 300)
        ]
        mainContent


winView : Maybe Player -> List (Html Msg)
winView maybeWinner =
    case maybeWinner of
        Just winner ->
            [ Grid.row
                []
                [ Grid.column
                    []
                    [ Html.text (playerToString winner ++ " wins!") ]
                ]
            , Grid.row
                []
                [ Grid.column
                    []
                    [ Html.button
                        [ Events.onClick PlayAgainClicked ]
                        [ Html.text "play again" ]
                    ]
                ]
            ]

        Nothing ->
            []


rowView : ( Index, Vector3 Spot ) -> Html Msg
rowView ( rowIndex, column ) =
    Grid.row
        [ borderRight3 (px 1) solid (hex "#000000")
        , borderBottom3 (px 1) solid (hex "#000000")
        , height (px 100)
        ]
        (List.map (columnView rowIndex) <| Vector3.toIndexedList column)


columnView : Index -> ( Index, Spot ) -> Grid.Column Msg
columnView row ( column, spot ) =
    Grid.column
        [ borderLeft3 (px 1) solid (hex "#000000")
        , Grid.exactWidthColumn (px 100)
        , position relative
        ]
        [ cellContent { row = row, column = column } spot ]


cellContent : Coords -> Spot -> Html Msg
cellContent coords spot =
    case spot of
        Empty ->
            Html.div
                [ Events.onClick <| SquareClicked coords
                , Attrs.css
                    [ width (pct 100)
                    , height (pct 100)
                    , cursor pointer
                    ]
                ]
                []

        Taken player ->
            Grid.box
                [ lineHeight (pct 100)
                , width (pct 100)
                , height (pct 100)
                , fontSize (px 100)
                , displayFlex
                , justifyContent center
                ]
                [ Html.text <| playerToString player ]
