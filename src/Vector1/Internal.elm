module Vector1.Internal exposing
    ( Vector(..)
    , VectorModel
    )


type Vector
    = Vector (VectorModel a)


type alias VectorModel a  =
    { n0 : a
    }


module Vector1 exposing
    ( Vector1 
    , Index(..)
    , get
    , push
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


import Vector1.Internal exposing (Vector(..), VectorModel)
import Vector2.Internal as Vector2
import Util exposing (andAnother, andAnotherSafe)


type alias Vector1 a = 
    Vector1.Internal.Vector a


type Index
    = Index0



get : Index -> Vector1 a -> a
get index (Vector vector) =
    case index of
        Index0 ->
            vector.n0


map : (a -> b) -> Vector1 a -> Vector1 b
map f (Vector vector) =
    { n0 = f vector.n0
    }


mapItem : Index -> (a -> a) -> Vector1 a -> Vector1 a
mapItem index mapper (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = mapper vector.n0 }


toList : Vector1 a -> List a
toList (Vector vector) =
    [ vector.n0
    ]


fromList : List a -> Maybe (List a, Vector1 a)
fromList items =
    Just (items, VectorModel)



fromListWithDefault : a -> List a -> Vector1 a
fromListWithDefault default items =
    (default, items, VectorModel)



toIndexedList : Vector1 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    ]


initializeFromInt : (Int -> a) -> Vector1 a
initializeFromInt f =
    { n0 = f 0
    }


initializeFromIndex : (Index -> a) -> Vector1 a
initializeFromIndex f =
    { n0 = f Index0
    }


repeat : a -> Vector1 a
repeat a =
    { n0 = a
    }


indexToInt : Index -> Int
indexToInt index =
    case index of
        Index0 ->
            0


intToIndex : Int -> Int
intToIndex int =
    case int of
        0 ->
            Just Index0

        _ ->
            Nothing


push : a -> Vector1 a -> Vector2 a
push a (Vector vector) =
    { n0 = vector.n0
    , n1 = a
    }
        |> Vector2.Vector


unshift : a -> Vector1 a -> Vector2 a
unshift a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    }
        |> Vector2.Vector