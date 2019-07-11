module Vector5 exposing
    ( Vector5 
    , Index(..)
    , get
    , map
    , toList
    , toIndexedList
    , repeat
    )


import Vector5.Internal exposing (Vector(..))


type alias Vector5 a = 
    Vector5.Internal.Vector a


type Index
    = Index0
    | Index1
    | Index2
    | Index3
    | Index4


get : Index -> Vector5 a -> a
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

        Index4 ->
            vector.n4


map : Index -> (a -> b) -> Vector5 a -> Vector5 b
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

        Index4 ->
            Vector { vector | n4 = mapper vector.n4 }


toList : Vector5 a -> List a
toList (Vector vector) =
    [ vector.n0
    , vector.n1
    , vector.n2
    , vector.n3
    , vector.n4
    ]


toIndexedList : Vector5 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    , ( Index1, vector.n1)
    , ( Index2, vector.n2)
    , ( Index3, vector.n3)
    , ( Index4, vector.n4)
    ]


repeat : a -> Vector5 a
repeat a =
    { n0 = a
    , n1 = a
    , n2 = a
    , n3 = a
    , n4 = a
    }