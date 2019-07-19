module Vector2 exposing
    ( Vector2 
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
    , indices
    , from2
    )


{-| A vector of length 2

# Vector2

@docs Vector2

# Creation

@docs fromList, repeat, from2, fromListWithDefault, initializeFromInt, initializeFromIndex

# Index

@docs Index, get, set, indices, indexToInt, intToIndex, nextIndex, previousIndex

# Transform

@docs map, mapItem, indexedMap, foldr, foldl, map2, map3, map4, map5

# Lists

@docs toList, toIndexedList

# Methods

@docs pop, uncons,  push, cons

# Util

@docs length, reverse, member, group

-}


import Vector2.Internal exposing (Vector2(..), VectorModel)
import Vector3.Internal as Vector3
import Vector1.Internal as Vector1
import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)


{-| A vector that contains exactly 2 elements -}
type alias Vector2 a = 
    Vector2.Internal.Vector2 a


{-| All the indices to a `Vector2 a`. There are exactly 2 of them. Its kind of like an `Int` except there is a finite amount of them. -}
type Index
    = Index0
    | Index1


{-| Given an index, get the next one. Unless its the last index in which case there is no next index (`Nothing`) -}
nextIndex : Index -> Maybe Index
nextIndex index =
    case index of
        Index0 ->
            Just Index1

        Index1 ->
            Nothing


{-| Given an index, get the previous one. Unless its the `0` index in which case there is no previous index (`Nothing`) -}
previousIndex : Index -> Maybe Index
previousIndex index =
    case index of
        Index0 ->
            Nothing

        Index1 ->
            Just Index0


{-| Get the item at that `Index` in a `Vector2 a` -}
get : Index -> Vector2 a -> a
get index (Vector vector) =
    case index of
        Index0 ->
            vector.n0

        Index1 ->
            vector.n1


{-| Set the item at a specific index in a `Vector2 a` -}
set : Index -> a -> Vector2 a -> Vector2 a
set index a (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = a }

        Index1 ->
            Vector { vector | n1 = a }


{-| Reduce a `Vector2 a` from the right. -}
foldr : (a -> b -> b) -> b -> Vector2 a -> b
foldr f start vector =
    List.foldr f start <| toList vector


{-| Reduce a `Vector2 a` from the left. -}
foldl : (a -> b -> b) -> b -> Vector2 a -> b
foldl f start vector =
    List.foldl f start <| toList vector


{-| Apply a function to every element in a `Vector2 a`. -}
map : (a -> b) -> Vector2 a -> Vector2 b
map f (Vector vector) =
    { n0 = f vector.n0
    , n1 = f vector.n1
    }
        |> Vector


{-| Apply a function on every element with its index as first argument -}
indexedMap : (Index -> a -> b) -> Vector2 a -> Vector2 b
indexedMap f (Vector vector) =
    { n0 = f Index0 vector.n0
    , n1 = f Index1 vector.n1
    }
        |> Vector


{-|  -}
map2 : (a -> b -> c) -> Vector2 a -> Vector2 b -> Vector2 c
map2 f (Vector va ) (Vector vb ) =
    { n0 = f va.n0 vb.n0
    , n1 = f va.n1 vb.n1
    }
        |> Vector


{-|  -}
map3 : (a -> b -> c -> d) -> Vector2 a -> Vector2 b -> Vector2 c -> Vector2 d
map3 f (Vector va ) (Vector vb ) (Vector vc ) =
    { n0 = f va.n0 vb.n0 vc.n0
    , n1 = f va.n1 vb.n1 vc.n1
    }
        |> Vector


{-|  -}
map4 : (a -> b -> c -> d -> e) -> Vector2 a -> Vector2 b -> Vector2 c -> Vector2 d -> Vector2 e
map4 f (Vector va ) (Vector vb ) (Vector vc ) (Vector vd ) =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1
    }
        |> Vector


{-|  -}
map5 : (a -> b -> c -> d -> e -> f) -> Vector2 a -> Vector2 b -> Vector2 c -> Vector2 d -> Vector2 e -> Vector2 f
map5 f (Vector va ) (Vector vb ) (Vector vc ) (Vector vd ) (Vector ve ) =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0 ve.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1 ve.n1
    }
        |> Vector


{-| Transform just one particular item at a particular `Index` -}
mapItem : Index -> (a -> a) -> Vector2 a -> Vector2 a
mapItem index mapper (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = mapper vector.n0 }

        Index1 ->
            Vector { vector | n1 = mapper vector.n1 }


{-| Convert a `Vector2 a` into a `List a` of length 2 -}
toList : Vector2 a -> List a
toList (Vector vector) =
    [ vector.n0
    , vector.n1
    ]


{-| Turn a `List a` into a `Vector2 a`. If there are not enough items in the `List a`, then this function returns `Nothing`. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromList []
    --> Nothing

    Vector3.fromList [ 1 ]
    --> Nothing

    Vector3.fromList [ 5, 6, 7, 8 ]
    --> Just ([ 8 ], Vector3.from3 5 6 7)

 -}
fromList : List a -> Maybe (List a, Vector2 a)
fromList items =
    Just (items, VectorModel)
        |> andAnother
        |> andAnother

        |> Maybe.map (Tuple.mapSecond Vector)


{-| Turn a `List a` into a `Vector2 a`. If there are not enough items in the `List a`, then fill in the remaining spots with a default value. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromListWithDefault 1 []
    --> ([] ,Vector3.from3 1 1 1)

    Vector3.fromListWithDefault 2 [ 1 ]
    --> ([], Vector3.from3 1 2 2)

    Vector3.fromListWithDefault 2 [ 5, 6, 7, 8 ]
    --> ([ 8 ], Vector3.from3 5 6 7)

 -}
fromListWithDefault : a -> List a -> ( List a,Vector2 a)
fromListWithDefault default items =
    (default, items, VectorModel)
        |> andAnotherSafe
        |> andAnotherSafe

        |> finishOffAndAnotherSafe
        |> Tuple.mapSecond Vector


{-| Turn a `Vector2 a` elm into a list, where each element is paired with its `Index` -}
toIndexedList : Vector2 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    , ( Index1, vector.n1)
    ]


{-| Make a `Vector2 a` using a function that takes an `Int`, representing the index -}
initializeFromInt : (Int -> a) -> Vector2 a
initializeFromInt f =
    { n0 = f 0
    , n1 = f 1
    }
        |> Vector


{-| Make a `Vector2 a` using a function that takes an `Index` -}
initializeFromIndex : (Index -> a) -> Vector2 a
initializeFromIndex f =
    { n0 = f Index0
    , n1 = f Index1
    }
        |> Vector


{-| Make a `Vector2 a` filled with just one item repeated over and over again. -}
repeat : a -> Vector2 a
repeat a =
    { n0 = a
    , n1 = a
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


{-| Try and turn an `Int` into an `Index`, returning `Nothing` if the `Int` is above the maximum index, or below the zero index, of this `Vector2 a`

        Vector5.intToIndex 4
        --> Just Vector5.Index4

        Vector3.intToIndex 4
        --> Nothing -}
intToIndex : Int -> Maybe Index
intToIndex int =
    case int of
        0 ->
            Just Index0

        1 ->
            Just Index1

        _ ->
            Nothing


{-| Make a `Vector2 a` from 2 elements -}
from2 : a -> a -> Vector2 a
from2 a0 a1 =
    { n0 = a0
    , n1 = a1
    }
        |> Vector


{-| See if a Vector2 a contains a value -}
member : a -> Vector2 a -> Bool
member a (Vector vector) =
    a == vector.n0
    ||     a == vector.n1


{-| Reverse the order of the items in a `Vector2 a` -}
reverse : Vector2 a -> Vector2 a
reverse (Vector vector) =
    { n0 = vector.n1
    , n1 = vector.n0
    }
        |> Vector


{-| The length of this vector type, which is 2 -}
length : Int
length =
    2


{-| Break a `List a` down into groups of `Vector2 a`. The output is a tuple, where the left side is a list of the remainder.

    Vector3.group [ 1, 2, 3 ]
    --> ([] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4 ]
    --> ([ 4 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5 ]
    --> ([ 4, 5 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5, 6 ]
    --> ([] , [ Vector3.from3 1 2 3, Vector3.from3 4 5 6 ])
 -}
group : List a -> (List a, List ( Vector2 a ) )
group items =
    groupHelp items []


groupHelp : List a -> List ( Vector2 a ) -> (List a, List ( Vector2 a ) )
groupHelp remainingItems output =
    case remainingItems of
        i0 :: i1 :: rest ->
            groupHelp rest (from2 i0 i1 :: output)

        _ ->
            (remainingItems, List.reverse output)


{-| A list of all the indices, from 0 to 1 -}
indices : Vector2 Index
indices =
    initializeFromIndex identity


{-| Add an element to the end of a `Vector2 a`, incrementing its size by 1

    Vector4.push 4 (Vector4.from4 0 1 2 3)
    --> Vector5.from5 0 1 2 3 4 -}
push : a -> Vector2 a -> Vector3.Vector3 a
push a (Vector vector) =
    { n0 = vector.n0
    , n1 = vector.n1
    , n2 = a
    }
        |> Vector3.Vector


{-| Separate a `Vector2 a` into its last element and everything else.

    Vector4.pop (Vector4.from4 0 1 2 3)
    --> (Vector3.from3 0 1 2, 3) -}
pop : Vector2 a -> ( Vector1.Vector1 a, a )
pop (Vector vector) =
    (
    { n0 = vector.n0
    }
        |> Vector1.Vector
    , vector.n1
    )


{-| Split a `Vector2 a` into its first element and the rest

    Vector4.uncons (Vector4.from4 0 1 2 3)
    --> (0, Vector3.from3 1 2 3) -}
uncons : Vector2 a -> ( a, Vector1.Vector1 a )
uncons (Vector vector) =
    (vector.n0
    ,    { n0 = vector.n1
    }
        |> Vector1.Vector    )


{-| Add an element to the front of a vector, incrementing the vector size by 1

    Vector4.cons -1 (Vector4.from4 0 1 2 3)
    --> Vector5.from5 -1 0 1 2 3 -}
cons : a -> Vector2 a -> Vector3.Vector3 a
cons a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    , n2 = vector.n1
    }
        |> Vector3.Vector