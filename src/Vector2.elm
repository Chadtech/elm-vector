module Vector2 exposing
    ( Vector2 
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


import Vector2.Internal exposing (Vector(..), VectorModel)
import Vector3.Internal as Vector3
import Vector1.Internal as Vector1
import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)


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


map : (a -> b) -> Vector2 a -> Vector2 b
map f (Vector vector) =
    { n0 = f vector.n0
    , n1 = f vector.n1
    }
        |> Vector


mapItem : Index -> (a -> a) -> Vector2 a -> Vector2 a
mapItem index mapper (Vector vector) =
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


fromList : List a -> Maybe (List a, Vector2 a)
fromList items =
    Just (items, VectorModel)
        |> andAnother
        |> andAnother



fromListWithDefault : a -> List a -> ( List a,Vector2 a)
fromListWithDefault default items =
    (default, items, VectorModel)
        |> andAnotherSafe
        |> andAnotherSafe

        |> finishOffAndAnotherSafe


toIndexedList : Vector2 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    , ( Index1, vector.n1)
    ]


initializeFromInt : (Int -> a) -> Vector2 a
initializeFromInt f =
    { n0 = f 0
    , n1 = f 1
    }
        |> Vector


initializeFromIndex : (Index -> a) -> Vector2 a
initializeFromIndex f =
    { n0 = f Index0
    , n1 = f Index1
    }
        |> Vector


repeat : a -> Vector2 a
repeat a =
    { n0 = a
    , n1 = a
    }
        |> Vector


indexToInt : Index -> Int
indexToInt index =
    case index of
        Index0 ->
            0

        Index1 ->
            1


intToIndex : Int -> Maybe Index
intToIndex int =
    case int of
        0 ->
            Just Index0

        1 ->
            Just Index1

        _ ->
            Nothing


push : a -> Vector2 a -> Vector3 a
push a (Vector vector) =
    { n0 = vector.n0
    , n1 = vector.n1
    , n2 = a
    }
        |> Vector3.Vector


pop : Vector2 a -> ( Vector1.Vector a, a )
pop (Vector vector) =
    (
    { n0 = vector.n0
    }
        |> Vector1.Vector
    , vector.n1
    )


shift : Vector2 a -> ( a, Vector1.Vector a )
shift (Vector vector) =
    (vector.n0
    ,    { n0 = vector.n1
    }
        |> Vector1.Vector    )


unshift : a -> Vector2 a -> Vector3 a
unshift a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    , n2 = vector.n1
    }
        |> Vector3.Vector