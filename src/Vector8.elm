module Vector8 exposing
    ( Vector8 
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
    , from8
    )


{-| A vector of length 8

# Vector8

@docs Vector8

# Creation

@docs fromList, repeat, from8, fromListWithDefault, initializeFromInt, initializeFromIndex

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


import Vector8.Internal exposing (Vector(..), VectorModel)
import Vector9.Internal as Vector9
import Vector7.Internal as Vector7
import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)


type alias Vector8 a = 
    Vector8.Internal.Vector a


type Index
    = Index0
    | Index1
    | Index2
    | Index3
    | Index4
    | Index5
    | Index6
    | Index7


get : Index -> Vector8 a -> a
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

        Index5 ->
            vector.n5

        Index6 ->
            vector.n6

        Index7 ->
            vector.n7


map : (a -> b) -> Vector8 a -> Vector8 b
map f (Vector vector) =
    { n0 = f vector.n0
    , n1 = f vector.n1
    , n2 = f vector.n2
    , n3 = f vector.n3
    , n4 = f vector.n4
    , n5 = f vector.n5
    , n6 = f vector.n6
    , n7 = f vector.n7
    }
        |> Vector


{-| -}
map4 : (a -> b -> c -> d -> e) -> Vector8 a -> Vector8 b -> Vector8 c -> Vector8 d -> Vector8 e
map4 f va vb vc vd =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1
    , n2 = f va.n2 vb.n2 vc.n2 vd.n2
    , n3 = f va.n3 vb.n3 vc.n3 vd.n3
    , n4 = f va.n4 vb.n4 vc.n4 vd.n4
    , n5 = f va.n5 vb.n5 vc.n5 vd.n5
    , n6 = f va.n6 vb.n6 vc.n6 vd.n6
    , n7 = f va.n7 vb.n7 vc.n7 vd.n7
    }
        |> Vector


{-| -}
map5 : (a -> b -> c -> d -> e -> f) -> Vector8 a -> Vector8 b -> Vector8 c -> Vector8 d -> Vector8 e -> Vector8 f
map5 f va vb vc vd ve =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0 ve.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1 ve.n1
    , n2 = f va.n2 vb.n2 vc.n2 vd.n2 ve.n2
    , n3 = f va.n3 vb.n3 vc.n3 vd.n3 ve.n3
    , n4 = f va.n4 vb.n4 vc.n4 vd.n4 ve.n4
    , n5 = f va.n5 vb.n5 vc.n5 vd.n5 ve.n5
    , n6 = f va.n6 vb.n6 vc.n6 vd.n6 ve.n6
    , n7 = f va.n7 vb.n7 vc.n7 vd.n7 ve.n7
    }
        |> Vector


mapItem : Index -> (a -> a) -> Vector8 a -> Vector8 a
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

        Index4 ->
            Vector { vector | n4 = mapper vector.n4 }

        Index5 ->
            Vector { vector | n5 = mapper vector.n5 }

        Index6 ->
            Vector { vector | n6 = mapper vector.n6 }

        Index7 ->
            Vector { vector | n7 = mapper vector.n7 }


{-| Convert a `Vector8 a` into a `List a` of length 8-}
toList : Vector8 a -> List a
toList (Vector vector) =
    [ vector.n0
    , vector.n1
    , vector.n2
    , vector.n3
    , vector.n4
    , vector.n5
    , vector.n6
    , vector.n7
    ]


fromList : List a -> Maybe (List a, Vector8 a)
fromList items =
    Just (items, VectorModel)
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother

        |> Maybe.map (Tuple.mapSecond Vector)


fromListWithDefault : a -> List a -> ( List a,Vector8 a)
fromListWithDefault default items =
    (default, items, VectorModel)
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe

        |> finishOffAndAnotherSafe
        |> Tuple.mapSecond Vector


toIndexedList : Vector8 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    , ( Index1, vector.n1)
    , ( Index2, vector.n2)
    , ( Index3, vector.n3)
    , ( Index4, vector.n4)
    , ( Index5, vector.n5)
    , ( Index6, vector.n6)
    , ( Index7, vector.n7)
    ]


initializeFromInt : (Int -> a) -> Vector8 a
initializeFromInt f =
    { n0 = f 0
    , n1 = f 1
    , n2 = f 2
    , n3 = f 3
    , n4 = f 4
    , n5 = f 5
    , n6 = f 6
    , n7 = f 7
    }
        |> Vector


initializeFromIndex : (Index -> a) -> Vector8 a
initializeFromIndex f =
    { n0 = f Index0
    , n1 = f Index1
    , n2 = f Index2
    , n3 = f Index3
    , n4 = f Index4
    , n5 = f Index5
    , n6 = f Index6
    , n7 = f Index7
    }
        |> Vector


repeat : a -> Vector8 a
repeat a =
    { n0 = a
    , n1 = a
    , n2 = a
    , n3 = a
    , n4 = a
    , n5 = a
    , n6 = a
    , n7 = a
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

        Index4 ->
            4

        Index5 ->
            5

        Index6 ->
            6

        Index7 ->
            7


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

        4 ->
            Just Index4

        5 ->
            Just Index5

        6 ->
            Just Index6

        7 ->
            Just Index7

        _ ->
            Nothing


from8 : a -> a -> a -> a -> a -> a -> a -> a -> Vector8 a
from8 a0 a1 a2 a3 a4 a5 a6 a7 =
    { n0 = a0
    , n1 = a1
    , n2 = a2
    , n3 = a3
    , n4 = a4
    , n5 = a5
    , n6 = a6
    , n7 = a7
    }
        |> Vector


{-| See if a Vector8 a contains a value-}
member : a -> Vector8 a -> Bool
member a (Vector vector) =
    a == vector.n0
    ||     a == vector.n1
    ||     a == vector.n2
    ||     a == vector.n3
    ||     a == vector.n4
    ||     a == vector.n5
    ||     a == vector.n6
    ||     a == vector.n7


push : a -> Vector8 a -> Vector9.Vector a
push a (Vector vector) =
    { n0 = vector.n0
    , n1 = vector.n1
    , n2 = vector.n2
    , n3 = vector.n3
    , n4 = vector.n4
    , n5 = vector.n5
    , n6 = vector.n6
    , n7 = vector.n7
    , n8 = a
    }
        |> Vector9.Vector


pop : Vector8 a -> ( Vector7.Vector a, a )
pop (Vector vector) =
    (
    { n0 = vector.n0
    , n1 = vector.n1
    , n2 = vector.n2
    , n3 = vector.n3
    , n4 = vector.n4
    , n5 = vector.n5
    , n6 = vector.n6
    }
        |> Vector7.Vector
    , vector.n7
    )


{-| Split a `Vector8 a` into its first element and the rest-}
uncons : Vector8 a -> ( a, Vector7.Vector a )
uncons (Vector vector) =
    (vector.n0
    ,    { n0 = vector.n1
    , n1 = vector.n2
    , n2 = vector.n3
    , n3 = vector.n4
    , n4 = vector.n5
    , n5 = vector.n6
    , n6 = vector.n7
    }
        |> Vector7.Vector    )


{-| Add an element to the front of a vector, incrementing the vector size by 1-}
cons : a -> Vector8 a -> Vector9.Vector a
cons a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    , n2 = vector.n1
    , n3 = vector.n2
    , n4 = vector.n3
    , n5 = vector.n4
    , n6 = vector.n5
    , n7 = vector.n6
    , n8 = vector.n7
    }
        |> Vector9.Vector