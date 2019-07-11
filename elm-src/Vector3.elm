module Vector3 exposing
    ( Vector3 
    , Index(..)
    , get
    , map
    , toList
    , toIndexedList
    , repeat
    )


import Vector3.Internal exposing (Vector(..))


type alias Vector3 a = 
    Vector3.Internal.Vector a


type Index
    = Index0
    | Index1
    | Index2


get : Index -> Vector3 a -> a
get index (Vector vector) =
    case index of
        Index0 ->
            vector.n0

        Index1 ->
            vector.n1

        Index2 ->
            vector.n2


map : Index -> (a -> b) -> Vector3 a -> Vector3 b
map index mapper (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = mapper vector.n0 }

        Index1 ->
            Vector { vector | n1 = mapper vector.n1 }

        Index2 ->
            Vector { vector | n2 = mapper vector.n2 }


toList : Vector3 a -> List a
toList (Vector vector) =
    [ vector.n0
    , vector.n1
    , vector.n2
    ]


toIndexedList : Vector3 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    , ( Index1, vector.n1)
    , ( Index2, vector.n2)
    ]


repeat : a -> Vector3 a
repeat a =
    { n0 = a
    , n1 = a
    , n2 = a
    }