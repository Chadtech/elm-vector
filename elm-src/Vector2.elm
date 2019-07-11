module Vector2 exposing
    ( Vector2 
    , Index(..)
    , get
    , map
    , toList
    , toIndexedList
    , repeat
    )


import Vector2.Internal exposing (Vector(..))


type alias Vector2 a = 
    Vector2.Internal.Vector a


type Index
    = Index0
    | Index1


get : Index -> Vector2 a -> a
get index (Vector vector) =
    case index of
        Index0 ->
            vector.n0

        Index1 ->
            vector.n1


map : Index -> (a -> b) -> Vector2 a -> Vector2 b
map index mapper (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = mapper vector.n0 }

        Index1 ->
            Vector { vector | n1 = mapper vector.n1 }


toList : Vector2 a -> List a
toList (Vector vector) =
    [ vector.n0
    , vector.n1
    ]


toIndexedList : Vector2 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    , ( Index1, vector.n1)
    ]


repeat : a -> Vector2 a
repeat a =
    { n0 = a
    , n1 = a
    }