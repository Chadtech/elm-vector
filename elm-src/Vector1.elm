module Vector1 exposing
    ( Vector1 
    , Index(..)
    , get
    , map
    , toList
    , toIndexedList
    , repeat
    )


import Vector1.Internal exposing (Vector(..))


type alias Vector1 a = 
    Vector1.Internal.Vector a


type Index
    = Index0



get : Index -> Vector1 a -> a
get index (Vector vector) =
    case index of
        Index0 ->
            vector.n0


map : Index -> (a -> b) -> Vector1 a -> Vector1 b
map index mapper (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = mapper vector.n0 }


toList : Vector1 a -> List a
toList (Vector vector) =
    [ vector.n0
    ]


toIndexedList : Vector1 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    ]


repeat : a -> Vector1 a
repeat a =
    { n0 = a
    }