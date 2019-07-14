module Util exposing
    ( andAnother
    , andAnotherSafe
    )


andAnother : Maybe (List a, a -> b) -> Maybe (List a, b)
andAnother maybeItems =
    case maybeItems of
        Just (remainingItems, f) ->
            case remainingItems of
                next :: rest ->
                    Just (rest, f next)

                [] ->
                    Nothing
        Nothing ->
            Nothing



andAnotherSafe : (a, List a, a -> b) -> b
andAnotherSafe (default, items, f) =
    case remainingItems of
        next :: rest ->
            (default, rest, f next)

        [] ->
            (default, [], f default)