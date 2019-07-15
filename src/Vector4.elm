module Vector4 exposing
    ( Vector4 
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
    , from4
    )


{-| A vector of length 4

# Vector4

@docs Vector4

# Creation

@docs fromList, repeat, from4, fromListWithDefault, initializeFromInt, initializeFromIndex

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


import Vector4.Internal exposing (Vector(..), VectorModel)
import Vector5.Internal as Vector5
import Vector3.Internal as Vector3
import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)


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
        |> Vector


{-| -}
map4 : (a -> b -> c -> d -> e) -> Vector4 a -> Vector4 b -> Vector4 c -> Vector4 d -> Vector4 e
map4 f va vb vc vd =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1
    , n2 = f va.n2 vb.n2 vc.n2 vd.n2
    , n3 = f va.n3 vb.n3 vc.n3 vd.n3
    }
        |> Vector


{-| -}
map5 : (a -> b -> c -> d -> e -> f) -> Vector4 a -> Vector4 b -> Vector4 c -> Vector4 d -> Vector4 e -> Vector4 f
map5 f va vb vc vd ve =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0 ve.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1 ve.n1
    , n2 = f va.n2 vb.n2 vc.n2 vd.n2 ve.n2
    , n3 = f va.n3 vb.n3 vc.n3 vd.n3 ve.n3
    }
        |> Vector


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


{-| Convert a `Vector4 a` into a `List a` of length 4-}
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
        |> andAnother

        |> Maybe.map (Tuple.mapSecond Vector)


fromListWithDefault : a -> List a -> ( List a,Vector4 a)
fromListWithDefault default items =
    (default, items, VectorModel)
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe

        |> finishOffAndAnotherSafe
        |> Tuple.mapSecond Vector


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
        |> Vector


initializeFromIndex : (Index -> a) -> Vector4 a
initializeFromIndex f =
    { n0 = f Index0
    , n1 = f Index1
    , n2 = f Index2
    , n3 = f Index3
    }
        |> Vector


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


intToIndex : Int -> Maybe Index
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


from4 : a -> a -> a -> a -> Vector4 a
from4 a0 a1 a2 a3 =
    { n0 = a0
    , n1 = a1
    , n2 = a2
    , n3 = a3
    }
        |> Vector


{-| See if a Vector4 a contains a value-}
member : a -> Vector4 a -> Bool
member a (Vector vector) =
    a == vector.n0
    ||     a == vector.n1
    ||     a == vector.n2
    ||     a == vector.n3


push : a -> Vector4 a -> Vector5.Vector a
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


{-| Split a `Vector4 a` into its first element and the rest-}
uncons : Vector4 a -> ( a, Vector3.Vector a )
uncons (Vector vector) =
    (vector.n0
    ,    { n0 = vector.n1
    , n1 = vector.n2
    , n2 = vector.n3
    }
        |> Vector3.Vector    )


{-| Add an element to the front of a vector, incrementing the vector size by 1-}
cons : a -> Vector4 a -> Vector5.Vector a
cons a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    , n2 = vector.n1
    , n3 = vector.n2
    , n4 = vector.n3
    }
        |> Vector5.Vector