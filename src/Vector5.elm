module Vector5 exposing
    ( Vector5 
    , Index(..)
    , get
    , push
    , pop
    , uncons
    , cons
    , foldr
    , foldl
    , map
    , indexedMap
    , set
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
    , nextIndex
    , previousIndex
    , map4
    , map3
    , map2
    , length
    , group
    , from5
    )


{-| A vector of length 5

# Vector5

@docs Vector5

# Creation

@docs fromList, repeat, from5, fromListWithDefault, initializeFromInt, initializeFromIndex

# Index

@docs Index, get, set, indexToInt, intToIndex, nextIndex, previousIndex

# Transform

@docs map, mapItem, indexedMap, foldr, foldl, map2, map3, map4, map5

# Lists

@docs toList, toIndexedList

# Methods

@docs pop, uncons,  push, cons

# Util

@docs length, reverse, member, group

-}


import Vector5.Internal exposing (Vector(..), VectorModel)
import Vector6.Internal as Vector6
import Vector4.Internal as Vector4
import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)


{-| A vector that contains exactly 5 elements -}
type alias Vector5 a = 
    Vector5.Internal.Vector a


{-| All the indices to a `Vector5 a`. There are exactly 5 of them. Its kind of like an `Int` except there is a finite amount of them. -}
type Index
    = Index0
    | Index1
    | Index2
    | Index3
    | Index4


{-| Given an index, get the next one. Unless its the last index in which case there is no next index (`Nothing`) -}
nextIndex : Index -> Maybe Index
nextIndex index =
    case index of
        Index0 ->
            Just Index1

        Index1 ->
            Just Index2

        Index2 ->
            Just Index3

        Index3 ->
            Just Index4

        Index4 ->
            Nothing


{-| Given an index, get the previous one. Unless its the `0` index in which case there is no previous index (`Nothing`) -}
previousIndex : Index -> Maybe Index
previousIndex index =
    case index of
        Index0 ->
            Nothing

        Index1 ->
            Just Index0

        Index2 ->
            Just Index1

        Index3 ->
            Just Index2

        Index4 ->
            Just Index3


{-| Get the item at that `Index` in a `Vector5 a` -}
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


{-| Set the item at a specific index in a `Vector5 a` -}
set : Index -> a -> Vector5 a -> Vector5 a
set index a (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = a }

        Index1 ->
            Vector { vector | n1 = a }

        Index2 ->
            Vector { vector | n2 = a }

        Index3 ->
            Vector { vector | n3 = a }

        Index4 ->
            Vector { vector | n4 = a }


{-| Reduce a `Vector5 a` from the right. -}
foldr : (a -> b -> b) -> b -> Vector5 a -> b
foldr f start vector =
    List.foldr f start <| toList vector


{-| Reduce a `Vector5 a` from the left. -}
foldl : (a -> b -> b) -> b -> Vector5 a -> b
foldl f start vector =
    List.foldl f start <| toList vector


{-| Apply a function to every element in a `Vector5 a`. -}
map : (a -> b) -> Vector5 a -> Vector5 b
map f (Vector vector) =
    { n0 = f vector.n0
    , n1 = f vector.n1
    , n2 = f vector.n2
    , n3 = f vector.n3
    , n4 = f vector.n4
    }
        |> Vector


{-| Apply a function on every element with its index as first argument -}
indexedMap : (Index -> a -> b) -> Vector5 a -> Vector5 b
indexedMap f (Vector vector) =
    { n0 = f Index0 vector.n0
    , n1 = f Index1 vector.n1
    , n2 = f Index2 vector.n2
    , n3 = f Index3 vector.n3
    , n4 = f Index4 vector.n4
    }
        |> Vector


{-|  -}
map2 : (a -> b -> c) -> Vector5 a -> Vector5 b -> Vector5 c
map2 f (Vector va ) (Vector vb ) =
    { n0 = f va.n0 vb.n0
    , n1 = f va.n1 vb.n1
    , n2 = f va.n2 vb.n2
    , n3 = f va.n3 vb.n3
    , n4 = f va.n4 vb.n4
    }
        |> Vector


{-|  -}
map3 : (a -> b -> c -> d) -> Vector5 a -> Vector5 b -> Vector5 c -> Vector5 d
map3 f (Vector va ) (Vector vb ) (Vector vc ) =
    { n0 = f va.n0 vb.n0 vc.n0
    , n1 = f va.n1 vb.n1 vc.n1
    , n2 = f va.n2 vb.n2 vc.n2
    , n3 = f va.n3 vb.n3 vc.n3
    , n4 = f va.n4 vb.n4 vc.n4
    }
        |> Vector


{-|  -}
map4 : (a -> b -> c -> d -> e) -> Vector5 a -> Vector5 b -> Vector5 c -> Vector5 d -> Vector5 e
map4 f (Vector va ) (Vector vb ) (Vector vc ) (Vector vd ) =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1
    , n2 = f va.n2 vb.n2 vc.n2 vd.n2
    , n3 = f va.n3 vb.n3 vc.n3 vd.n3
    , n4 = f va.n4 vb.n4 vc.n4 vd.n4
    }
        |> Vector


{-|  -}
map5 : (a -> b -> c -> d -> e -> f) -> Vector5 a -> Vector5 b -> Vector5 c -> Vector5 d -> Vector5 e -> Vector5 f
map5 f (Vector va ) (Vector vb ) (Vector vc ) (Vector vd ) (Vector ve ) =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0 ve.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1 ve.n1
    , n2 = f va.n2 vb.n2 vc.n2 vd.n2 ve.n2
    , n3 = f va.n3 vb.n3 vc.n3 vd.n3 ve.n3
    , n4 = f va.n4 vb.n4 vc.n4 vd.n4 ve.n4
    }
        |> Vector


{-| Transform just one particular item at a particular `Index` -}
mapItem : Index -> (a -> a) -> Vector5 a -> Vector5 a
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


{-| Convert a `Vector5 a` into a `List a` of length 5 -}
toList : Vector5 a -> List a
toList (Vector vector) =
    [ vector.n0
    , vector.n1
    , vector.n2
    , vector.n3
    , vector.n4
    ]


{-| Turn a `List a` into a `Vector5 a`. If there are not enough items in the `List a`, then this function returns `Nothing`. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromList []
    --> Nothing

    Vector3.fromList [ 1 ]
    --> Nothing

    Vector3.fromList [ 5, 6, 7, 8 ]
    --> Just ([ 8 ], Vector3.from3 5 6 7)

 -}
fromList : List a -> Maybe (List a, Vector5 a)
fromList items =
    Just (items, VectorModel)
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother

        |> Maybe.map (Tuple.mapSecond Vector)


{-| Turn a `List a` into a `Vector5 a`. If there are not enough items in the `List a`, then fill in the remaining spots with a default value. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromListWithDefault 1 []
    --> ([] ,Vector3.from3 1 1 1)

    Vector3.fromListWithDefault 2 [ 1 ]
    --> ([], Vector3.from3 1 2 2)

    Vector3.fromListWithDefault 2 [ 5, 6, 7, 8 ]
    --> ([ 8 ], Vector3.from3 5 6 7)

 -}
fromListWithDefault : a -> List a -> ( List a,Vector5 a)
fromListWithDefault default items =
    (default, items, VectorModel)
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe

        |> finishOffAndAnotherSafe
        |> Tuple.mapSecond Vector


{-| Turn a `Vector5 a` elm into a list, where each element is paired with its `Index` -}
toIndexedList : Vector5 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    , ( Index1, vector.n1)
    , ( Index2, vector.n2)
    , ( Index3, vector.n3)
    , ( Index4, vector.n4)
    ]


{-| Make a `Vector5 a` using a function that takes an `Int`, representing the index -}
initializeFromInt : (Int -> a) -> Vector5 a
initializeFromInt f =
    { n0 = f 0
    , n1 = f 1
    , n2 = f 2
    , n3 = f 3
    , n4 = f 4
    }
        |> Vector


{-| Make a `Vector5 a` using a function that takes an `Index` -}
initializeFromIndex : (Index -> a) -> Vector5 a
initializeFromIndex f =
    { n0 = f Index0
    , n1 = f Index1
    , n2 = f Index2
    , n3 = f Index3
    , n4 = f Index4
    }
        |> Vector


{-| Make a `Vector5 a` filled with just one item repeated over and over again. -}
repeat : a -> Vector5 a
repeat a =
    { n0 = a
    , n1 = a
    , n2 = a
    , n3 = a
    , n4 = a
    }
        |> Vector


{-| Turn the `Index` into an `Int` -}
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


{-| Try and turn an `Int` into an `Index`, returning `Nothing` if the `Int` is above the maximum index of this `Vector5 a` -}
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

        _ ->
            Nothing


{-| Make a `Vector5 a` from 5elements -}
from5 : a -> a -> a -> a -> a -> Vector5 a
from5 a0 a1 a2 a3 a4 =
    { n0 = a0
    , n1 = a1
    , n2 = a2
    , n3 = a3
    , n4 = a4
    }
        |> Vector


{-| See if a Vector5 a contains a value -}
member : a -> Vector5 a -> Bool
member a (Vector vector) =
    a == vector.n0
    ||     a == vector.n1
    ||     a == vector.n2
    ||     a == vector.n3
    ||     a == vector.n4


{-| Reverse the order of the items in a `Vector5 a` -}
reverse : Vector5 a -> Vector5 a
reverse (Vector vector) =
    { n0 = vector.n4
    , n1 = vector.n3
    , n2 = vector.n2
    , n3 = vector.n1
    , n4 = vector.n0
    }
        |> Vector


{-| The length of this vector type, which is 5 -}
length : Int
length =
    5


{-| Break a `List a` down into groups of `Vector5 a`. The output is a tuple, where the left side is a list of the remainder.

    Vector3.group [ 1, 2, 3 ]
    --> ([] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4 ]
    --> ([ 4 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5 ]
    --> ([ 4, 5 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5, 6 ]
    --> ([] , [ Vector3.from3 1 2 3, Vector3.from3 4 5 6 ])
 -}
group : List a -> (List a, List ( Vector5 a ) )
group items =
    groupHelp items []


groupHelp : List a -> List ( Vector5 a ) -> (List a, List ( Vector5 a ) )
groupHelp remainingItems output =
    case remainingItems of
        i0 :: i1 :: i2 :: i3 :: i4 :: rest ->
            groupHelp rest (from5 i0 i1 i2 i3 i4 :: output)

        _ ->
            (remainingItems, List.reverse output)


{-| Add an element to the end of a `Vector5 a`, incrementing its size by 1 -}
push : a -> Vector5 a -> Vector6.Vector a
push a (Vector vector) =
    { n0 = vector.n0
    , n1 = vector.n1
    , n2 = vector.n2
    , n3 = vector.n3
    , n4 = vector.n4
    , n5 = a
    }
        |> Vector6.Vector


{-| Separate a `Vector5 a` into its last element and everything else. -}
pop : Vector5 a -> ( Vector4.Vector a, a )
pop (Vector vector) =
    (
    { n0 = vector.n0
    , n1 = vector.n1
    , n2 = vector.n2
    , n3 = vector.n3
    }
        |> Vector4.Vector
    , vector.n4
    )


{-| Split a `Vector5 a` into its first element and the rest -}
uncons : Vector5 a -> ( a, Vector4.Vector a )
uncons (Vector vector) =
    (vector.n0
    ,    { n0 = vector.n1
    , n1 = vector.n2
    , n2 = vector.n3
    , n3 = vector.n4
    }
        |> Vector4.Vector    )


{-| Add an element to the front of a vector, incrementing the vector size by 1 -}
cons : a -> Vector5 a -> Vector6.Vector a
cons a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    , n2 = vector.n1
    , n3 = vector.n2
    , n4 = vector.n3
    , n5 = vector.n4
    }
        |> Vector6.Vector