module Vector1 exposing
    ( Vector1 
    , Index(..)
    , get
    , push
    , cons
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
    , reverse
    , member
    , map5
    , map4
    , from1
    )


{-| A vector of length 1

# Vector1

@docs Vector1

# Creation

@docs fromList, repeat, from1, fromListWithDefault, initializeFromInt, initializeFromIndex

# Index

@docs Index, get, indexToInt, intToIndex

# Transform

@docs map, mapItem, indexedMap, foldr, foldl, map2, map3, map4, map5

# Lists

@docs toList, toIndexedList

# Methods

@docs push, cons

# Util

@docs length, reverse, member, group

-}


import Vector1.Internal exposing (Vector(..), VectorModel)
import Vector2.Internal as Vector2
import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)


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
        |> Vector


{-| -}
map4 : (a -> b -> c -> d -> e) -> Vector1 a -> Vector1 b -> Vector1 c -> Vector1 d -> Vector1 e
map4 f va vb vc vd =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0
    }
        |> Vector


{-| -}
map5 : (a -> b -> c -> d -> e -> f) -> Vector1 a -> Vector1 b -> Vector1 c -> Vector1 d -> Vector1 e -> Vector1 f
map5 f va vb vc vd ve =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0 ve.n0
    }
        |> Vector


mapItem : Index -> (a -> a) -> Vector1 a -> Vector1 a
mapItem index mapper (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = mapper vector.n0 }


{-| Convert a `Vector1 a` into a `List a` of length 1-}
toList : Vector1 a -> List a
toList (Vector vector) =
    [ vector.n0
    ]


fromList : List a -> Maybe (List a, Vector1 a)
fromList items =
    Just (items, VectorModel)
        |> andAnother

        |> Maybe.map (Tuple.mapSecond Vector)


fromListWithDefault : a -> List a -> ( List a,Vector1 a)
fromListWithDefault default items =
    (default, items, VectorModel)
        |> andAnotherSafe

        |> finishOffAndAnotherSafe
        |> Tuple.mapSecond Vector


toIndexedList : Vector1 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    ]


initializeFromInt : (Int -> a) -> Vector1 a
initializeFromInt f =
    { n0 = f 0
    }
        |> Vector


initializeFromIndex : (Index -> a) -> Vector1 a
initializeFromIndex f =
    { n0 = f Index0
    }
        |> Vector


repeat : a -> Vector1 a
repeat a =
    { n0 = a
    }
        |> Vector


indexToInt : Index -> Int
indexToInt index =
    case index of
        Index0 ->
            0


intToIndex : Int -> Maybe Index
intToIndex int =
    case int of
        0 ->
            Just Index0

        _ ->
            Nothing


from1 : a -> Vector1 a
from1 a0 =
    { n0 = a0
    }
        |> Vector


{-| See if a Vector1 a contains a value-}
member : a -> Vector1 a -> Bool
member a (Vector vector) =
    a == vector.n0


push : a -> Vector1 a -> Vector2.Vector a
push a (Vector vector) =
    { n0 = vector.n0
    , n1 = a
    }
        |> Vector2.Vector


{-| Add an element to the front of a vector, incrementing the vector size by 1-}
cons : a -> Vector1 a -> Vector2.Vector a
cons a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    }
        |> Vector2.Vector