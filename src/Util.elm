module Util exposing
    ( andAnother
    , andAnotherSafe
    , finishOffAndAnotherSafe
    )


andAnother : Maybe ( List a, a -> b ) -> Maybe ( List a, b )
andAnother maybeItems =
    case maybeItems of
        Just ( remainingItems, f ) ->
            case remainingItems of
                next :: rest ->
                    Just ( rest, f next )

                [] ->
                    Nothing

        Nothing ->
            Nothing


andAnotherSafe : ( a, List a, a -> b ) -> ( a, List a, b )
andAnotherSafe ( default, items, f ) =
    case items of
        next :: rest ->
            ( default, rest, f next )

        [] ->
            ( default, [], f default )


finishOffAndAnotherSafe : ( a, List a, b ) -> ( List a, b )
finishOffAndAnotherSafe ( _, second, third ) =
    ( second, third )
