module Vector3 exposing
    ( Vector3 
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


import Vector3.Internal exposing (Vector(..), VectorModel)
import Vector4.Internal as Vector4
import Vector2.Internal as Vector2
import Util exposing (andAnother, andAnotherSafe)


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


map : (a -> b) -> Vector3 a -> Vector3 b
map f (Vector vector) =
    { n0 = f vector.n0
    , n1 = f vector.n1
    , n2 = f vector.n2
    }


mapItem : Index -> (a -> a) -> Vector3 a -> Vector3 a
mapItem index mapper (Vector vector) =
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


fromList : List a -> Maybe (List a, Vector3 a)
fromList items =
    Just (items, VectorModel)
        |> andAnother
        |> andAnother



fromListWithDefault : a -> List a -> Vector3 a
fromListWithDefault default items =
    (default, items, VectorModel)
        |> andAnotherSafe
        |> andAnotherSafe



toIndexedList : Vector3 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    , ( Index1, vector.n1)
    , ( Index2, vector.n2)
    ]


initializeFromInt : (Int -> a) -> Vector3 a
initializeFromInt f =
    { n0 = f 0
    , n1 = f 1
    , n2 = f 2
    }


initializeFromIndex : (Index -> a) -> Vector3 a
initializeFromIndex f =
    { n0 = f Index0
    , n1 = f Index1
    , n2 = f Index2
    }


repeat : a -> Vector3 a
repeat a =
    { n0 = a
    , n1 = a
    , n2 = a
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


intToIndex : Int -> Int
intToIndex int =
    case int of
        0 ->
            Just Index0

        1 ->
            Just Index1

        2 ->
            Just Index2

        _ ->
            Nothing


push : a -> Vector3 a -> Vector4 a
push a (Vector vector) =
    { n0 = vector.n0
    , n1 = vector.n1
    , n2 = vector.n2
    , n3 = a
    }
        |> Vector4.Vector


pop : Vector3 a -> ( Vector2.Vector a, a )
pop (Vector vector) =
    (
    { n0 = vector.n0
    , n1 = vector.n1
    }
        |> Vector2.Vector
    , vector.n2
    )


shift : Vector3 a -> ( a, Vector2.Vector a )
shift (Vector vector) =
    (vector.n0
    ,    { n0 = vector.n1
    , n1 = vector.n2
    }
        |> Vector2.Vector    )


unshift : a -> Vector3 a -> Vector4 a
unshift a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    , n2 = vector.n1
    , n3 = vector.n2
    }
        |> Vector4.Vector