module Main exposing (main)

import Browser
import Css exposing (..)
import Html.Grid as Grid
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attrs
import Html.Styled.Events as Events
import Vector3 exposing (Vector3)


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


initialModel : Model
initialModel =
    { board = Vector3.repeat (Vector3.repeat Empty)
    , turn = X
    , winner = Nothing
    }


mapBoard : (Vector3 (Vector3 Spot) -> Vector3 (Vector3 Spot)) -> Model -> Model
mapBoard f model =
    { model | board = f model.board }


setSquareToSpot :
    Player
    -> { row : Vector3.Index, column : Vector3.Index }
    -> Vector3 (Vector3 Spot)
    -> Vector3 (Vector3 Spot)
setSquareToSpot player { row, column } board =
    Vector3.mapItem row (Vector3.set column (Taken player)) board


checkForWinConditions : Model -> Model
checkForWinConditions model =
    { model
        | winner =
            [ checkForHorizontalWin model.board 
            , checkForVerticalWin model.board
            , checkForFirstDiagonalWin model.board
            ]
                |> firstJust
    }


checkForFirstDiagonalWin : Vector3 (Vector3 Spot) -> Maybe Player
checkForFirstDiagonalWin board =
    let
        getAt : Vector3.Index -> Spot
        getAt index =
            Vector3.get index (Vector3.get index board)

        diagonal : Vector3 Spot
        diagonal =
            Vector.initializeFromIndex getAt

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

            else rowIsAll O then
                Just O

            else
                winnerState
    in
    Vector3.foldr isThreeInARow Nothing


checkForVerticalWin : Vector3 (Vector3 Spot) -> Maybe Player
checkForVerticalWin board =
    let
        isThreeInAColumn : Vector3.Index -> Maybe Player -> Maybe Player
        isThreeInAColumn columnIndex winnerState =
            let
                getFirstColumnOfRow : Vector3.Index -> Spot
                getFirstColumnOfRow rowIndex =
                    Vector3.get columnIndex <| Vector3.get rowIndex board

                columnIsAll : Player -> Bool
                columnIsAll player =
                    Vector3.initializeFromIndex getFirstColumnOfRow
                        == Vector3.repeat (Taken player)
            in
            if columnIsAll X then
                Just X

            else if columnIsAll O then
                Just Y

            else
                winnerState
    in
    Vector3.foldr isThreeInAColumn Nothing (Vector.initializeFromIndex identity)


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


type Msg
    = SquareClicked { row : Vector3.Index, column : Vector3.Index }


update : Msg -> Model -> Model
update msg model =
    case msg of
        SquareClicked coords ->
            model
                |> toggleTurn
                |> mapBoard (setSquareToSpot model.turn coords)
                |> checkForWinConditions


view : Model -> Html Msg
view model =
    Grid.box
        [ borderTop3 (px 1) solid (hex "#000000")
        , display block
        , width (px 300)
        ]
        (List.map rowView <| Vector3.toIndexedList model.board)


rowView : ( Vector3.Index, Vector3 Spot ) -> Html Msg
rowView ( rowIndex, column ) =
    Grid.row
        [ borderRight3 (px 1) solid (hex "#000000")
        , borderBottom3 (px 1) solid (hex "#000000")
        , height (px 100)
        ]
        (List.map (columnView rowIndex) <| Vector3.toIndexedList column)


columnView : Vector3.Index -> ( Vector3.Index, Spot ) -> Grid.Column Msg
columnView rowIndex ( columnIndex, spot ) =
    Grid.column
        [ borderLeft3 (px 1) solid (hex "#000000")
        , Grid.exactWidthColumn (px 100)
        , position relative
        ]
        [ cellContent { row = rowIndex, column = columnIndex } spot ]


cellContent : { row : Vector3.Index, column : Vector3.Index } -> Spot -> Html Msg
cellContent coords spot =
    case spot of
        Empty ->
            Html.div
                [ Events.onClick <| SquareClicked coords
                , Attrs.css
                    [ width (pct 100)
                    , height (pct 100)
                    ]
                ]
                []

        Taken player  ->
            Grid.box
                [ lineHeight (pct 100)
                , width (pct 100)
                , height (pct 100)
                , fontSize (px 100)
                , displayFlex
                , justifyContent center
                ]
                [ Html.text <| playerToString player }



main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = Html.toUnstyled << view
        , update = update
        }
