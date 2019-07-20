module Vector1 exposing
    ( Vector1
    , fromList, repeat, from1, fromListWithDefault, initializeFromInt, initializeFromIndex
    , Index(..), get, set, indices, indexToInt, intToIndex, nextIndex, previousIndex
    , map, mapItem, indexedMap, foldr, foldl, map2, map3, map4, map5
    , toList, toIndexedList
    , push, cons
    , length, reverse, member, group
    )

{-| A vector of length 1


# Vector1

@docs Vector1


# Creation

@docs fromList, repeat, from1, fromListWithDefault, initializeFromInt, initializeFromIndex


# Index

@docs Index, get, set, indices, indexToInt, intToIndex, nextIndex, previousIndex


# Transform

@docs map, mapItem, indexedMap, foldr, foldl, map2, map3, map4, map5


# Lists

@docs toList, toIndexedList


# Methods

@docs push, cons


# Util

@docs length, reverse, member, group

-}

import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)
import Vector1.Internal exposing (Vector1(..), VectorModel)
import Vector2.Internal as Vector2


{-| A vector that contains exactly 1 elements
-}
type alias Vector1 a =
    Vector1.Internal.Vector1 a


{-| All the indices to a `Vector1 a`. There are exactly 1 of them. Its kind of like an `Int` except there is a finite amount of them.
-}
type Index
    = Index0


{-| Given an index, get the next one. Unless its the last index in which case there is no next index (`Nothing`)
-}
nextIndex : Index -> Maybe Index
nextIndex index =
    case index of
        Index0 ->
            Nothing


{-| Given an index, get the previous one. Unless its the `0` index in which case there is no previous index (`Nothing`)
-}
previousIndex : Index -> Maybe Index
previousIndex index =
    case index of
        Index0 ->
            Nothing


{-| Get the item at that `Index` in a `Vector1 a`
-}
get : Index -> Vector1 a -> a
get index (Vector vector) =
    case index of
        Index0 ->
            vector.n0


{-| Set the item at a specific index in a `Vector1 a`
-}
set : Index -> a -> Vector1 a -> Vector1 a
set index a (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = a }


{-| Reduce a `Vector1 a` from the right
-}
foldr : (a -> b -> b) -> b -> Vector1 a -> b
foldr f start vector =
    List.foldr f start <| toList vector


{-| Reduce a `Vector1 a` from the left
-}
foldl : (a -> b -> b) -> b -> Vector1 a -> b
foldl f start vector =
    List.foldl f start <| toList vector


{-| Apply a function to every element in a \`Vector1 a
-}
map : (a -> b) -> Vector1 a -> Vector1 b
map f (Vector vector) =
    { n0 = f vector.n0
    }
        |> Vector


{-| Apply a function on every element with its index as first argument
-}
indexedMap : (Index -> a -> b) -> Vector1 a -> Vector1 b
indexedMap f (Vector vector) =
    { n0 = f Index0 vector.n0
    }
        |> Vector


{-| -}
map2 : (a -> b -> c) -> Vector1 a -> Vector1 b -> Vector1 c
map2 f (Vector va) (Vector vb) =
    { n0 = f va.n0 vb.n0
    }
        |> Vector


{-| -}
map3 : (a -> b -> c -> d) -> Vector1 a -> Vector1 b -> Vector1 c -> Vector1 d
map3 f (Vector va) (Vector vb) (Vector vc) =
    { n0 = f va.n0 vb.n0 vc.n0
    }
        |> Vector


{-| -}
map4 : (a -> b -> c -> d -> e) -> Vector1 a -> Vector1 b -> Vector1 c -> Vector1 d -> Vector1 e
map4 f (Vector va) (Vector vb) (Vector vc) (Vector vd) =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0
    }
        |> Vector


{-| -}
map5 : (a -> b -> c -> d -> e -> f) -> Vector1 a -> Vector1 b -> Vector1 c -> Vector1 d -> Vector1 e -> Vector1 f
map5 f (Vector va) (Vector vb) (Vector vc) (Vector vd) (Vector ve) =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0 ve.n0
    }
        |> Vector


{-| Transform just one particular item at a particular `Index`
-}
mapItem : Index -> (a -> a) -> Vector1 a -> Vector1 a
mapItem index mapper (Vector vector) =
    case index of
        Index0 ->
            Vector { vector | n0 = mapper vector.n0 }


{-| Convert a `Vector1 a` into a `List a` of length 1
-}
toList : Vector1 a -> List a
toList (Vector vector) =
    [ vector.n0
    ]


{-| Turn a `List a` into a `Vector1 a`. If there are not enough items in the `List a`, then this function returns `Nothing`. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromList []
    --> Nothing

    Vector3.fromList [ 1 ]
    --> Nothing

    Vector3.fromList [ 5, 6, 7, 8 ]
    --> Just ([ 8 ], Vector3.from3 5 6 7)

-}
fromList : List a -> Maybe ( List a, Vector1 a )
fromList items =
    Just ( items, VectorModel )
        |> andAnother
        |> Maybe.map (Tuple.mapSecond Vector)


{-| Turn a `List a` into a `Vector1 a`. If there are not enough items in the `List a`, then fill in the remaining spots with a default value. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromListWithDefault 1 []
    --> ([] ,Vector3.from3 1 1 1)

    Vector3.fromListWithDefault 2 [ 1 ]
    --> ([], Vector3.from3 1 2 2)

    Vector3.fromListWithDefault 2 [ 5, 6, 7, 8 ]
    --> ([ 8 ], Vector3.from3 5 6 7)

-}
fromListWithDefault : a -> List a -> ( List a, Vector1 a )
fromListWithDefault default items =
    ( default, items, VectorModel )
        |> andAnotherSafe
        |> finishOffAndAnotherSafe
        |> Tuple.mapSecond Vector


{-| Turn a `Vector1 a` elm into a list, where each element is paired with its `Index`
-}
toIndexedList : Vector1 a -> List ( Index, a )
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0 )
    ]


{-| a `Vector1 a` using a function that takes an `Int`, representing the index
-}
initializeFromInt : (Int -> a) -> Vector1 a
initializeFromInt f =
    { n0 = f 0
    }
        |> Vector


{-| Make a `Vector1 a` using a function that takes an `Index`
-}
initializeFromIndex : (Index -> a) -> Vector1 a
initializeFromIndex f =
    { n0 = f Index0
    }
        |> Vector


{-| a `Vector1 a` filled with just one item repeated over and over again.
-}
repeat : a -> Vector1 a
repeat a =
    { n0 = a
    }
        |> Vector


{-| Turn the `Index` into an `Int`
-}
indexToInt : Index -> Int
indexToInt index =
    case index of
        Index0 ->
            0


{-| Try and turn an `Int` into an `Index`, returning `Nothing` if the `Int` is above the maximum index, or below the zero index, of this `Vector1 a`

        Vector5.intToIndex 4
        --> Just Vector5.Index4

        Vector3.intToIndex 4
        --> Nothing

-}
intToIndex : Int -> Maybe Index
intToIndex int =
    case int of
        0 ->
            Just Index0

        _ ->
            Nothing


{-| a `Vector1 a` from 1 elements
-}
from1 : a -> Vector1 a
from1 a0 =
    { n0 = a0
    }
        |> Vector


{-| See if a Vector1 a contains a value
-}
member : a -> Vector1 a -> Bool
member a (Vector vector) =
    a == vector.n0


{-| Reverse the order of the items in a `Vector1 a`
-}
reverse : Vector1 a -> Vector1 a
reverse (Vector vector) =
    { n0 = vector.n0
    }
        |> Vector


{-| The length of this vector type, which is 1
-}
length : Int
length =
    1


{-| Break a `List a` down into groups of `Vector1 a`. The output is a tuple, where the left side is a list of the remainder.

    Vector3.group [ 1, 2, 3 ]
    --> ([] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4 ]
    --> ([ 4 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5 ]
    --> ([ 4, 5 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5, 6 ]
    --> ([] , [ Vector3.from3 1 2 3, Vector3.from3 4 5 6 ])

-}
group : List a -> ( List a, List (Vector1 a) )
group items =
    groupHelp items []


groupHelp : List a -> List (Vector1 a) -> ( List a, List (Vector1 a) )
groupHelp remainingItems output =
    case remainingItems of
        i0 :: rest ->
            groupHelp rest (from1 i0 :: output)

        _ ->
            ( remainingItems, List.reverse output )


{-| A list of all the indices, from 0 to 0
-}
indices : Vector1 Index
indices =
    initializeFromIndex identity


{-| Add an element to the end of a `Vector1 a`, incrementing its size by 1

    Vector4.push 4 (Vector4.from4 0 1 2 3)
    --> Vector5.from5 0 1 2 3 4

-}
push : a -> Vector1 a -> Vector2.Vector2 a
push a (Vector vector) =
    { n0 = vector.n0
    , n1 = a
    }
        |> Vector2.Vector


{-| Add an element to the front of a vector, incrementing the vector size by 1

    Vector4.cons -1 (Vector4.from4 0 1 2 3)
    --> Vector5.from5 -1 0 1 2 3

-}
cons : a -> Vector1 a -> Vector2.Vector2 a
cons a (Vector vector) =
    { n0 = a
    , n1 = vector.n0
    }
        |> Vector2.Vector
