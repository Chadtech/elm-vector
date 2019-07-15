module Vector2 exposing
    ( Vector2 
    , Index(..)
    , get
    , push
    , pop
    , uncons
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
    , from2
    )


{-| A vector of length 2

# Vector2

@docs Vector2

# Creation

@docs fromList, repeat, from2, fromListWithDefault, initializeFromInt, initializeFromIndex

# Index

@docs Index, get, indexToInt, intToIndex

# Transform

@docs map, mapItem, indexedMap, foldr, foldl, map2, map3, map4, map5

# Lists

@docs toList, toIndexedList

# Methods

@docs pop, uncons,  push, cons

# Util

@docs length, reverse, member, group

-}


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


{-| -}
map4 : (a -> b -> c -> d -> e) -> Vector2 a -> Vector2 b -> Vector2 c -> Vector2 d -> Vector2 e
map4 f va vb vc vd =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1
    }
        |> Vector


{-| -}
map5 : (a -> b -> c -> d -> e -> f) -> Vector2 a -> Vector2 b -> Vector2 c -> Vector2 d -> Vector2 e -> Vector2 f
map5 f va vb vc vd ve =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0 ve.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1 ve.n1
    }
        |> Vector


mapItem : Index -> (a -> a) -> Vector2 a -> Vector2 a
mapItem index mapper (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = mapper vector.n0 }

        Index1 ->
            Vector { vector | n1 = mapper vector.n1 }


{-| Convert a `Vector2 a` into a `List a` of length 2-}
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

        |> Maybe.map (Tuple.mapSecond Vector)


fromListWithDefault : a -> List a -> ( List a,Vector2 a)
fromListWithDefault default items =
    (default, items, VectorModel)
        |> andAnotherSafe
        |> andAnotherSafe

        |> finishOffAndAnotherSafe
        |> Tuple.mapSecond Vector


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


from2 : a -> a -> Vector2 a
from2 a0 a1 =
    { n0 = a0
    , n1 = a1
    }
        |> Vector


{-| See if a Vector2 a contains a value-}
member : a -> Vector2 a -> Bool
member a (Vector vector) =
    a == vector.n0
    ||     a == vector.n1


push : a -> Vector2 a -> Vector3.Vector a
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


{-| Split a `Vector2 a` into its first element and the rest-}
uncons : Vector2 a -> ( a, Vector1.Vector a )
uncons (Vector vector) =
    (vector.n0
    ,    { n0 = vector.n1
    }
        |> Vector1.Vector    )


{-| Add an element to the front of a vector, incrementing the vector size by 1-}
cons : a -> Vector2 a -> Vector3.Vector a
cons a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    , n2 = vector.n1
    }
        |> Vector3.Vector