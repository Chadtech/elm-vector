module Vector4 exposing
    ( Vector4 
    , Index(..)
    , get
    , push
    , pop
    , shift
    , unshift
    , map
    , mapItem
    , toList
    , fromList
    , fromListWithDefault
    , toIndexedList
    , repeat
    , initializeFromInt
    , initializeFromIndex
    , indexToInt
    , intToIndex
    )


import Vector4.Internal exposing (Vector(..), VectorModel)
import Vector5.Internal as Vector5
import Vector3.Internal as Vector3
import Util exposing (andAnother, andAnotherSafe)


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


map : (a -> b) -> Vector4 a -> Vector4 b
map f (Vector vector) =
    { n0 = f vector.n0
    , n1 = f vector.n1
    , n2 = f vector.n2
    , n3 = f vector.n3
    }


mapItem : Index -> (a -> a) -> Vector4 a -> Vector4 a
mapItem index mapper (Vector vector) =
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


fromList : List a -> Maybe (List a, Vector4 a)
fromList items =
    Just (items, VectorModel)
        |> andAnother
        |> andAnother
        |> andAnother



fromListWithDefault : a -> List a -> Vector4 a
fromListWithDefault default items =
    (default, items, VectorModel)
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe



toIndexedList : Vector4 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    , ( Index1, vector.n1)
    , ( Index2, vector.n2)
    , ( Index3, vector.n3)
    ]


initializeFromInt : (Int -> a) -> Vector4 a
initializeFromInt f =
    { n0 = f 0
    , n1 = f 1
    , n2 = f 2
    , n3 = f 3
    }


initializeFromIndex : (Index -> a) -> Vector4 a
initializeFromIndex f =
    { n0 = f Index0
    , n1 = f Index1
    , n2 = f Index2
    , n3 = f Index3
    }


repeat : a -> Vector4 a
repeat a =
    { n0 = a
    , n1 = a
    , n2 = a
    , n3 = a
    }
        |> Vector


indexToInt : Index -> Int
indexToInt index =
    case index of
        Index0 ->
            0

        Index1 ->
            1

        Index2 ->
            2

        Index3 ->
            3


intToIndex : Int -> Int
intToIndex int =
    case int of
        0 ->
            Just Index0

        1 ->
            Just Index1

        2 ->
            Just Index2

        3 ->
            Just Index3

        _ ->
            Nothing


push : a -> Vector4 a -> Vector5 a
push a (Vector vector) =
    { n0 = vector.n0
    , n1 = vector.n1
    , n2 = vector.n2
    , n3 = vector.n3
    , n4 = a
    }
        |> Vector5.Vector


pop : Vector4 a -> ( Vector3.Vector a, a )
pop (Vector vector) =
    (
    { n0 = vector.n0
    , n1 = vector.n1
    , n2 = vector.n2
    }
        |> Vector3.Vector
    , vector.n3
    )


shift : Vector4 a -> ( a, Vector3.Vector a )
shift (Vector vector) =
    (vector.n0
    ,    { n0 = vector.n1
    , n1 = vector.n2
    , n2 = vector.n3
    }
        |> Vector3.Vector    )


unshift : a -> Vector4 a -> Vector5 a
unshift a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    , n2 = vector.n1
    , n3 = vector.n2
    , n4 = vector.n3
    }
        |> Vector5.Vector