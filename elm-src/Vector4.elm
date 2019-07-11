module Vector4 exposing
    ( Vector4 
    , Index(..)
    , get
    , map
    , toList
    , toIndexedList
    , repeat
    )


import Vector4.Internal exposing (Vector(..))


type alias Vector4 a = 
    Vector4.Internal.Vector a


type Index
    = Index0
    | Index1
    | Index2
    | Index3


get : Index -> Vector4 a -> a
get index (Vector vector) =
    case index of
        Index0 ->
            vector.n0

        Index1 ->
            vector.n1

        Index2 ->
            vector.n2

        Index3 ->
            vector.n3


map : Index -> (a -> b) -> Vector4 a -> Vector4 b
map index mapper (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = mapper vector.n0 }

        Index1 ->
            Vector { vector | n1 = mapper vector.n1 }

        Index2 ->
            Vector { vector | n2 = mapper vector.n2 }

        Index3 ->
            Vector { vector | n3 = mapper vector.n3 }


toList : Vector4 a -> List a
toList (Vector vector) =
    [ vector.n0
    , vector.n1
    , vector.n2
    , vector.n3
    ]


toIndexedList : Vector4 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    , ( Index1, vector.n1)
    , ( Index2, vector.n2)
    , ( Index3, vector.n3)
    ]


repeat : a -> Vector4 a
repeat a =
    { n0 = a
    , n1 = a
    , n2 = a
    , n3 = a
    }