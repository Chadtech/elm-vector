module Vector3 exposing
    ( Vector3 
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
    , from3
    )


{-| A vector of length 3

# Vector3

@docs Vector3

# Creation

@docs fromList, repeat, from3, fromListWithDefault, initializeFromInt, initializeFromIndex

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


import Vector3.Internal exposing (Vector(..), VectorModel)
import Vector4.Internal as Vector4
import Vector2.Internal as Vector2
import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)


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
        |> Vector


{-| -}
map4 : (a -> b -> c -> d -> e) -> Vector3 a -> Vector3 b -> Vector3 c -> Vector3 d -> Vector3 e
map4 f va vb vc vd =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1
    , n2 = f va.n2 vb.n2 vc.n2 vd.n2
    }
        |> Vector


{-| -}
map5 : (a -> b -> c -> d -> e -> f) -> Vector3 a -> Vector3 b -> Vector3 c -> Vector3 d -> Vector3 e -> Vector3 f
map5 f va vb vc vd ve =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0 ve.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1 ve.n1
    , n2 = f va.n2 vb.n2 vc.n2 vd.n2 ve.n2
    }
        |> Vector


mapItem : Index -> (a -> a) -> Vector3 a -> Vector3 a
mapItem index mapper (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = mapper vector.n0 }

        Index1 ->
            Vector { vector | n1 = mapper vector.n1 }

        Index2 ->
            Vector { vector | n2 = mapper vector.n2 }


{-| Convert a `Vector3 a` into a `List a` of length 3-}
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
        |> andAnother

        |> Maybe.map (Tuple.mapSecond Vector)


fromListWithDefault : a -> List a -> ( List a,Vector3 a)
fromListWithDefault default items =
    (default, items, VectorModel)
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe

        |> finishOffAndAnotherSafe
        |> Tuple.mapSecond Vector


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
        |> Vector


initializeFromIndex : (Index -> a) -> Vector3 a
initializeFromIndex f =
    { n0 = f Index0
    , n1 = f Index1
    , n2 = f Index2
    }
        |> Vector


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


intToIndex : Int -> Maybe Index
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


from3 : a -> a -> a -> Vector3 a
from3 a0 a1 a2 =
    { n0 = a0
    , n1 = a1
    , n2 = a2
    }
        |> Vector


{-| See if a Vector3 a contains a value-}
member : a -> Vector3 a -> Bool
member a (Vector vector) =
    a == vector.n0
    ||     a == vector.n1
    ||     a == vector.n2


push : a -> Vector3 a -> Vector4.Vector a
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


{-| Split a `Vector3 a` into its first element and the rest-}
uncons : Vector3 a -> ( a, Vector2.Vector a )
uncons (Vector vector) =
    (vector.n0
    ,    { n0 = vector.n1
    , n1 = vector.n2
    }
        |> Vector2.Vector    )


{-| Add an element to the front of a vector, incrementing the vector size by 1-}
cons : a -> Vector3 a -> Vector4.Vector a
cons a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    , n2 = vector.n1
    , n3 = vector.n2
    }
        |> Vector4.Vector