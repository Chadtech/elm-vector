module Vector25 exposing
    ( Vector25
    , fromList, repeat, from25, fromListWithDefault, initializeFromInt, initializeFromIndex
    , Index(..), get, set, indices, indexToInt, intToIndex, nextIndex, previousIndex
    , map, mapItem, indexedMap, foldr, foldl, map2, map3, map4, map5
    , toList, toIndexedList
    , pop, uncons, push, cons
    , length, reverse, member, group
    )

{-| A vector of length 25


# Vector25

@docs Vector25


# Creation

@docs fromList, repeat, from25, fromListWithDefault, initializeFromInt, initializeFromIndex


# Index

@docs Index, get, set, indices, indexToInt, intToIndex, nextIndex, previousIndex


# Transform

@docs map, mapItem, indexedMap, foldr, foldl, map2, map3, map4, map5


# Lists

@docs toList, toIndexedList


# Methods

@docs pop, uncons, push, cons


# Util

@docs length, reverse, member, group

-}

import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)
import Vector24.Internal as Vector24
import Vector25.Internal exposing (Vector25(..), VectorModel)
import Vector26.Internal as Vector26


{-| A vector that contains exactly 25 elements
-}
type alias Vector25 a =
    Vector25.Internal.Vector25 a


{-| All the indices to a `Vector25 a`. There are exactly 25 of them. Its kind of like an `Int` except there is a finite amount of them.
-}
type Index
    = Index0
    | Index1
    | Index2
    | Index3
    | Index4
    | Index5
    | Index6
    | Index7
    | Index8
    | Index9
    | Index10
    | Index11
    | Index12
    | Index13
    | Index14
    | Index15
    | Index16
    | Index17
    | Index18
    | Index19
    | Index20
    | Index21
    | Index22
    | Index23
    | Index24


{-| Given an index, get the next one. Unless its the last index in which case there is no next index (`Nothing`)
-}
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
            Just Index5

        Index5 ->
            Just Index6

        Index6 ->
            Just Index7

        Index7 ->
            Just Index8

        Index8 ->
            Just Index9

        Index9 ->
            Just Index10

        Index10 ->
            Just Index11

        Index11 ->
            Just Index12

        Index12 ->
            Just Index13

        Index13 ->
            Just Index14

        Index14 ->
            Just Index15

        Index15 ->
            Just Index16

        Index16 ->
            Just Index17

        Index17 ->
            Just Index18

        Index18 ->
            Just Index19

        Index19 ->
            Just Index20

        Index20 ->
            Just Index21

        Index21 ->
            Just Index22

        Index22 ->
            Just Index23

        Index23 ->
            Just Index24

        Index24 ->
            Nothing


{-| Given an index, get the previous one. Unless its the `0` index in which case there is no previous index (`Nothing`)
-}
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

        Index5 ->
            Just Index4

        Index6 ->
            Just Index5

        Index7 ->
            Just Index6

        Index8 ->
            Just Index7

        Index9 ->
            Just Index8

        Index10 ->
            Just Index9

        Index11 ->
            Just Index10

        Index12 ->
            Just Index11

        Index13 ->
            Just Index12

        Index14 ->
            Just Index13

        Index15 ->
            Just Index14

        Index16 ->
            Just Index15

        Index17 ->
            Just Index16

        Index18 ->
            Just Index17

        Index19 ->
            Just Index18

        Index20 ->
            Just Index19

        Index21 ->
            Just Index20

        Index22 ->
            Just Index21

        Index23 ->
            Just Index22

        Index24 ->
            Just Index23


{-| Get the item at that `Index` in a `Vector25 a`
-}
get : Index -> Vector25 a -> a
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

        Index8 ->
            vector.n8

        Index9 ->
            vector.n9

        Index10 ->
            vector.n10

        Index11 ->
            vector.n11

        Index12 ->
            vector.n12

        Index13 ->
            vector.n13

        Index14 ->
            vector.n14

        Index15 ->
            vector.n15

        Index16 ->
            vector.n16

        Index17 ->
            vector.n17

        Index18 ->
            vector.n18

        Index19 ->
            vector.n19

        Index20 ->
            vector.n20

        Index21 ->
            vector.n21

        Index22 ->
            vector.n22

        Index23 ->
            vector.n23

        Index24 ->
            vector.n24


{-| Set the item at a specific index in a `Vector25 a`
-}
set : Index -> a -> Vector25 a -> Vector25 a
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

        Index5 ->
            Vector { vector | n5 = a }

        Index6 ->
            Vector { vector | n6 = a }

        Index7 ->
            Vector { vector | n7 = a }

        Index8 ->
            Vector { vector | n8 = a }

        Index9 ->
            Vector { vector | n9 = a }

        Index10 ->
            Vector { vector | n10 = a }

        Index11 ->
            Vector { vector | n11 = a }

        Index12 ->
            Vector { vector | n12 = a }

        Index13 ->
            Vector { vector | n13 = a }

        Index14 ->
            Vector { vector | n14 = a }

        Index15 ->
            Vector { vector | n15 = a }

        Index16 ->
            Vector { vector | n16 = a }

        Index17 ->
            Vector { vector | n17 = a }

        Index18 ->
            Vector { vector | n18 = a }

        Index19 ->
            Vector { vector | n19 = a }

        Index20 ->
            Vector { vector | n20 = a }

        Index21 ->
            Vector { vector | n21 = a }

        Index22 ->
            Vector { vector | n22 = a }

        Index23 ->
            Vector { vector | n23 = a }

        Index24 ->
            Vector { vector | n24 = a }


{-| Reduce a `Vector25 a` from the right
-}
foldr : (a -> b -> b) -> b -> Vector25 a -> b
foldr f start vector =
    List.foldr f start <| toList vector


{-| Reduce a `Vector25 a` from the left
-}
foldl : (a -> b -> b) -> b -> Vector25 a -> b
foldl f start vector =
    List.foldl f start <| toList vector


{-| Apply a function to every element in a \`Vector25 a
-}
map : (a -> b) -> Vector25 a -> Vector25 b
map f (Vector vector) =
    { n0 = f vector.n0
    , n1 = f vector.n1
    , n2 = f vector.n2
    , n3 = f vector.n3
    , n4 = f vector.n4
    , n5 = f vector.n5
    , n6 = f vector.n6
    , n7 = f vector.n7
    , n8 = f vector.n8
    , n9 = f vector.n9
    , n10 = f vector.n10
    , n11 = f vector.n11
    , n12 = f vector.n12
    , n13 = f vector.n13
    , n14 = f vector.n14
    , n15 = f vector.n15
    , n16 = f vector.n16
    , n17 = f vector.n17
    , n18 = f vector.n18
    , n19 = f vector.n19
    , n20 = f vector.n20
    , n21 = f vector.n21
    , n22 = f vector.n22
    , n23 = f vector.n23
    , n24 = f vector.n24
    }
        |> Vector


{-| Apply a function on every element with its index as first argument
-}
indexedMap : (Index -> a -> b) -> Vector25 a -> Vector25 b
indexedMap f (Vector vector) =
    { n0 = f Index0 vector.n0
    , n1 = f Index1 vector.n1
    , n2 = f Index2 vector.n2
    , n3 = f Index3 vector.n3
    , n4 = f Index4 vector.n4
    , n5 = f Index5 vector.n5
    , n6 = f Index6 vector.n6
    , n7 = f Index7 vector.n7
    , n8 = f Index8 vector.n8
    , n9 = f Index9 vector.n9
    , n10 = f Index10 vector.n10
    , n11 = f Index11 vector.n11
    , n12 = f Index12 vector.n12
    , n13 = f Index13 vector.n13
    , n14 = f Index14 vector.n14
    , n15 = f Index15 vector.n15
    , n16 = f Index16 vector.n16
    , n17 = f Index17 vector.n17
    , n18 = f Index18 vector.n18
    , n19 = f Index19 vector.n19
    , n20 = f Index20 vector.n20
    , n21 = f Index21 vector.n21
    , n22 = f Index22 vector.n22
    , n23 = f Index23 vector.n23
    , n24 = f Index24 vector.n24
    }
        |> Vector


{-| -}
map2 : (a -> b -> c) -> Vector25 a -> Vector25 b -> Vector25 c
map2 f (Vector va) (Vector vb) =
    { n0 = f va.n0 vb.n0
    , n1 = f va.n1 vb.n1
    , n2 = f va.n2 vb.n2
    , n3 = f va.n3 vb.n3
    , n4 = f va.n4 vb.n4
    , n5 = f va.n5 vb.n5
    , n6 = f va.n6 vb.n6
    , n7 = f va.n7 vb.n7
    , n8 = f va.n8 vb.n8
    , n9 = f va.n9 vb.n9
    , n10 = f va.n10 vb.n10
    , n11 = f va.n11 vb.n11
    , n12 = f va.n12 vb.n12
    , n13 = f va.n13 vb.n13
    , n14 = f va.n14 vb.n14
    , n15 = f va.n15 vb.n15
    , n16 = f va.n16 vb.n16
    , n17 = f va.n17 vb.n17
    , n18 = f va.n18 vb.n18
    , n19 = f va.n19 vb.n19
    , n20 = f va.n20 vb.n20
    , n21 = f va.n21 vb.n21
    , n22 = f va.n22 vb.n22
    , n23 = f va.n23 vb.n23
    , n24 = f va.n24 vb.n24
    }
        |> Vector


{-| -}
map3 : (a -> b -> c -> d) -> Vector25 a -> Vector25 b -> Vector25 c -> Vector25 d
map3 f (Vector va) (Vector vb) (Vector vc) =
    { n0 = f va.n0 vb.n0 vc.n0
    , n1 = f va.n1 vb.n1 vc.n1
    , n2 = f va.n2 vb.n2 vc.n2
    , n3 = f va.n3 vb.n3 vc.n3
    , n4 = f va.n4 vb.n4 vc.n4
    , n5 = f va.n5 vb.n5 vc.n5
    , n6 = f va.n6 vb.n6 vc.n6
    , n7 = f va.n7 vb.n7 vc.n7
    , n8 = f va.n8 vb.n8 vc.n8
    , n9 = f va.n9 vb.n9 vc.n9
    , n10 = f va.n10 vb.n10 vc.n10
    , n11 = f va.n11 vb.n11 vc.n11
    , n12 = f va.n12 vb.n12 vc.n12
    , n13 = f va.n13 vb.n13 vc.n13
    , n14 = f va.n14 vb.n14 vc.n14
    , n15 = f va.n15 vb.n15 vc.n15
    , n16 = f va.n16 vb.n16 vc.n16
    , n17 = f va.n17 vb.n17 vc.n17
    , n18 = f va.n18 vb.n18 vc.n18
    , n19 = f va.n19 vb.n19 vc.n19
    , n20 = f va.n20 vb.n20 vc.n20
    , n21 = f va.n21 vb.n21 vc.n21
    , n22 = f va.n22 vb.n22 vc.n22
    , n23 = f va.n23 vb.n23 vc.n23
    , n24 = f va.n24 vb.n24 vc.n24
    }
        |> Vector


{-| -}
map4 : (a -> b -> c -> d -> e) -> Vector25 a -> Vector25 b -> Vector25 c -> Vector25 d -> Vector25 e
map4 f (Vector va) (Vector vb) (Vector vc) (Vector vd) =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1
    , n2 = f va.n2 vb.n2 vc.n2 vd.n2
    , n3 = f va.n3 vb.n3 vc.n3 vd.n3
    , n4 = f va.n4 vb.n4 vc.n4 vd.n4
    , n5 = f va.n5 vb.n5 vc.n5 vd.n5
    , n6 = f va.n6 vb.n6 vc.n6 vd.n6
    , n7 = f va.n7 vb.n7 vc.n7 vd.n7
    , n8 = f va.n8 vb.n8 vc.n8 vd.n8
    , n9 = f va.n9 vb.n9 vc.n9 vd.n9
    , n10 = f va.n10 vb.n10 vc.n10 vd.n10
    , n11 = f va.n11 vb.n11 vc.n11 vd.n11
    , n12 = f va.n12 vb.n12 vc.n12 vd.n12
    , n13 = f va.n13 vb.n13 vc.n13 vd.n13
    , n14 = f va.n14 vb.n14 vc.n14 vd.n14
    , n15 = f va.n15 vb.n15 vc.n15 vd.n15
    , n16 = f va.n16 vb.n16 vc.n16 vd.n16
    , n17 = f va.n17 vb.n17 vc.n17 vd.n17
    , n18 = f va.n18 vb.n18 vc.n18 vd.n18
    , n19 = f va.n19 vb.n19 vc.n19 vd.n19
    , n20 = f va.n20 vb.n20 vc.n20 vd.n20
    , n21 = f va.n21 vb.n21 vc.n21 vd.n21
    , n22 = f va.n22 vb.n22 vc.n22 vd.n22
    , n23 = f va.n23 vb.n23 vc.n23 vd.n23
    , n24 = f va.n24 vb.n24 vc.n24 vd.n24
    }
        |> Vector


{-| -}
map5 : (a -> b -> c -> d -> e -> f) -> Vector25 a -> Vector25 b -> Vector25 c -> Vector25 d -> Vector25 e -> Vector25 f
map5 f (Vector va) (Vector vb) (Vector vc) (Vector vd) (Vector ve) =
    { n0 = f va.n0 vb.n0 vc.n0 vd.n0 ve.n0
    , n1 = f va.n1 vb.n1 vc.n1 vd.n1 ve.n1
    , n2 = f va.n2 vb.n2 vc.n2 vd.n2 ve.n2
    , n3 = f va.n3 vb.n3 vc.n3 vd.n3 ve.n3
    , n4 = f va.n4 vb.n4 vc.n4 vd.n4 ve.n4
    , n5 = f va.n5 vb.n5 vc.n5 vd.n5 ve.n5
    , n6 = f va.n6 vb.n6 vc.n6 vd.n6 ve.n6
    , n7 = f va.n7 vb.n7 vc.n7 vd.n7 ve.n7
    , n8 = f va.n8 vb.n8 vc.n8 vd.n8 ve.n8
    , n9 = f va.n9 vb.n9 vc.n9 vd.n9 ve.n9
    , n10 = f va.n10 vb.n10 vc.n10 vd.n10 ve.n10
    , n11 = f va.n11 vb.n11 vc.n11 vd.n11 ve.n11
    , n12 = f va.n12 vb.n12 vc.n12 vd.n12 ve.n12
    , n13 = f va.n13 vb.n13 vc.n13 vd.n13 ve.n13
    , n14 = f va.n14 vb.n14 vc.n14 vd.n14 ve.n14
    , n15 = f va.n15 vb.n15 vc.n15 vd.n15 ve.n15
    , n16 = f va.n16 vb.n16 vc.n16 vd.n16 ve.n16
    , n17 = f va.n17 vb.n17 vc.n17 vd.n17 ve.n17
    , n18 = f va.n18 vb.n18 vc.n18 vd.n18 ve.n18
    , n19 = f va.n19 vb.n19 vc.n19 vd.n19 ve.n19
    , n20 = f va.n20 vb.n20 vc.n20 vd.n20 ve.n20
    , n21 = f va.n21 vb.n21 vc.n21 vd.n21 ve.n21
    , n22 = f va.n22 vb.n22 vc.n22 vd.n22 ve.n22
    , n23 = f va.n23 vb.n23 vc.n23 vd.n23 ve.n23
    , n24 = f va.n24 vb.n24 vc.n24 vd.n24 ve.n24
    }
        |> Vector


{-| Transform just one particular item at a particular `Index`
-}
mapItem : Index -> (a -> a) -> Vector25 a -> Vector25 a
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

        Index8 ->
            Vector { vector | n8 = mapper vector.n8 }

        Index9 ->
            Vector { vector | n9 = mapper vector.n9 }

        Index10 ->
            Vector { vector | n10 = mapper vector.n10 }

        Index11 ->
            Vector { vector | n11 = mapper vector.n11 }

        Index12 ->
            Vector { vector | n12 = mapper vector.n12 }

        Index13 ->
            Vector { vector | n13 = mapper vector.n13 }

        Index14 ->
            Vector { vector | n14 = mapper vector.n14 }

        Index15 ->
            Vector { vector | n15 = mapper vector.n15 }

        Index16 ->
            Vector { vector | n16 = mapper vector.n16 }

        Index17 ->
            Vector { vector | n17 = mapper vector.n17 }

        Index18 ->
            Vector { vector | n18 = mapper vector.n18 }

        Index19 ->
            Vector { vector | n19 = mapper vector.n19 }

        Index20 ->
            Vector { vector | n20 = mapper vector.n20 }

        Index21 ->
            Vector { vector | n21 = mapper vector.n21 }

        Index22 ->
            Vector { vector | n22 = mapper vector.n22 }

        Index23 ->
            Vector { vector | n23 = mapper vector.n23 }

        Index24 ->
            Vector { vector | n24 = mapper vector.n24 }


{-| Convert a `Vector25 a` into a `List a` of length 25
-}
toList : Vector25 a -> List a
toList (Vector vector) =
    [ vector.n0
    , vector.n1
    , vector.n2
    , vector.n3
    , vector.n4
    , vector.n5
    , vector.n6
    , vector.n7
    , vector.n8
    , vector.n9
    , vector.n10
    , vector.n11
    , vector.n12
    , vector.n13
    , vector.n14
    , vector.n15
    , vector.n16
    , vector.n17
    , vector.n18
    , vector.n19
    , vector.n20
    , vector.n21
    , vector.n22
    , vector.n23
    , vector.n24
    ]


{-| Turn a `List a` into a `Vector25 a`. If there are not enough items in the `List a`, then this function returns `Nothing`. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromList []
    --> Nothing

    Vector3.fromList [ 1 ]
    --> Nothing

    Vector3.fromList [ 5, 6, 7, 8 ]
    --> Just ([ 8 ], Vector3.from3 5 6 7)

-}
fromList : List a -> Maybe ( List a, Vector25 a )
fromList items =
    Just ( items, VectorModel )
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> Maybe.map (Tuple.mapSecond Vector)


{-| Turn a `List a` into a `Vector25 a`. If there are not enough items in the `List a`, then fill in the remaining spots with a default value. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromListWithDefault 1 []
    --> ([] ,Vector3.from3 1 1 1)

    Vector3.fromListWithDefault 2 [ 1 ]
    --> ([], Vector3.from3 1 2 2)

    Vector3.fromListWithDefault 2 [ 5, 6, 7, 8 ]
    --> ([ 8 ], Vector3.from3 5 6 7)

-}
fromListWithDefault : a -> List a -> ( List a, Vector25 a )
fromListWithDefault default items =
    ( default, items, VectorModel )
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
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


{-| Turn a `Vector25 a` elm into a list, where each element is paired with its `Index`
-}
toIndexedList : Vector25 a -> List ( Index, a )
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0 )
    , ( Index1, vector.n1 )
    , ( Index2, vector.n2 )
    , ( Index3, vector.n3 )
    , ( Index4, vector.n4 )
    , ( Index5, vector.n5 )
    , ( Index6, vector.n6 )
    , ( Index7, vector.n7 )
    , ( Index8, vector.n8 )
    , ( Index9, vector.n9 )
    , ( Index10, vector.n10 )
    , ( Index11, vector.n11 )
    , ( Index12, vector.n12 )
    , ( Index13, vector.n13 )
    , ( Index14, vector.n14 )
    , ( Index15, vector.n15 )
    , ( Index16, vector.n16 )
    , ( Index17, vector.n17 )
    , ( Index18, vector.n18 )
    , ( Index19, vector.n19 )
    , ( Index20, vector.n20 )
    , ( Index21, vector.n21 )
    , ( Index22, vector.n22 )
    , ( Index23, vector.n23 )
    , ( Index24, vector.n24 )
    ]


{-| a `Vector25 a` using a function that takes an `Int`, representing the index
-}
initializeFromInt : (Int -> a) -> Vector25 a
initializeFromInt f =
    { n0 = f 0
    , n1 = f 1
    , n2 = f 2
    , n3 = f 3
    , n4 = f 4
    , n5 = f 5
    , n6 = f 6
    , n7 = f 7
    , n8 = f 8
    , n9 = f 9
    , n10 = f 10
    , n11 = f 11
    , n12 = f 12
    , n13 = f 13
    , n14 = f 14
    , n15 = f 15
    , n16 = f 16
    , n17 = f 17
    , n18 = f 18
    , n19 = f 19
    , n20 = f 20
    , n21 = f 21
    , n22 = f 22
    , n23 = f 23
    , n24 = f 24
    }
        |> Vector


{-| Make a `Vector25 a` using a function that takes an `Index`
-}
initializeFromIndex : (Index -> a) -> Vector25 a
initializeFromIndex f =
    { n0 = f Index0
    , n1 = f Index1
    , n2 = f Index2
    , n3 = f Index3
    , n4 = f Index4
    , n5 = f Index5
    , n6 = f Index6
    , n7 = f Index7
    , n8 = f Index8
    , n9 = f Index9
    , n10 = f Index10
    , n11 = f Index11
    , n12 = f Index12
    , n13 = f Index13
    , n14 = f Index14
    , n15 = f Index15
    , n16 = f Index16
    , n17 = f Index17
    , n18 = f Index18
    , n19 = f Index19
    , n20 = f Index20
    , n21 = f Index21
    , n22 = f Index22
    , n23 = f Index23
    , n24 = f Index24
    }
        |> Vector


{-| a `Vector25 a` filled with just one item repeated over and over again.
-}
repeat : a -> Vector25 a
repeat a =
    { n0 = a
    , n1 = a
    , n2 = a
    , n3 = a
    , n4 = a
    , n5 = a
    , n6 = a
    , n7 = a
    , n8 = a
    , n9 = a
    , n10 = a
    , n11 = a
    , n12 = a
    , n13 = a
    , n14 = a
    , n15 = a
    , n16 = a
    , n17 = a
    , n18 = a
    , n19 = a
    , n20 = a
    , n21 = a
    , n22 = a
    , n23 = a
    , n24 = a
    }
        |> Vector


{-| Turn the `Index` into an `Int`
-}
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

        Index8 ->
            8

        Index9 ->
            9

        Index10 ->
            10

        Index11 ->
            11

        Index12 ->
            12

        Index13 ->
            13

        Index14 ->
            14

        Index15 ->
            15

        Index16 ->
            16

        Index17 ->
            17

        Index18 ->
            18

        Index19 ->
            19

        Index20 ->
            20

        Index21 ->
            21

        Index22 ->
            22

        Index23 ->
            23

        Index24 ->
            24


{-| Try and turn an `Int` into an `Index`, returning `Nothing` if the `Int` is above the maximum index, or below the zero index, of this `Vector25 a`

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

        8 ->
            Just Index8

        9 ->
            Just Index9

        10 ->
            Just Index10

        11 ->
            Just Index11

        12 ->
            Just Index12

        13 ->
            Just Index13

        14 ->
            Just Index14

        15 ->
            Just Index15

        16 ->
            Just Index16

        17 ->
            Just Index17

        18 ->
            Just Index18

        19 ->
            Just Index19

        20 ->
            Just Index20

        21 ->
            Just Index21

        22 ->
            Just Index22

        23 ->
            Just Index23

        24 ->
            Just Index24

        _ ->
            Nothing


{-| a `Vector25 a` from 25 elements
-}
from25 : a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> Vector25 a
from25 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 =
    { n0 = a0
    , n1 = a1
    , n2 = a2
    , n3 = a3
    , n4 = a4
    , n5 = a5
    , n6 = a6
    , n7 = a7
    , n8 = a8
    , n9 = a9
    , n10 = a10
    , n11 = a11
    , n12 = a12
    , n13 = a13
    , n14 = a14
    , n15 = a15
    , n16 = a16
    , n17 = a17
    , n18 = a18
    , n19 = a19
    , n20 = a20
    , n21 = a21
    , n22 = a22
    , n23 = a23
    , n24 = a24
    }
        |> Vector


{-| See if a Vector25 a contains a value
-}
member : a -> Vector25 a -> Bool
member a (Vector vector) =
    a
        == vector.n0
        || a
        == vector.n1
        || a
        == vector.n2
        || a
        == vector.n3
        || a
        == vector.n4
        || a
        == vector.n5
        || a
        == vector.n6
        || a
        == vector.n7
        || a
        == vector.n8
        || a
        == vector.n9
        || a
        == vector.n10
        || a
        == vector.n11
        || a
        == vector.n12
        || a
        == vector.n13
        || a
        == vector.n14
        || a
        == vector.n15
        || a
        == vector.n16
        || a
        == vector.n17
        || a
        == vector.n18
        || a
        == vector.n19
        || a
        == vector.n20
        || a
        == vector.n21
        || a
        == vector.n22
        || a
        == vector.n23
        || a
        == vector.n24


{-| Reverse the order of the items in a `Vector25 a`
-}
reverse : Vector25 a -> Vector25 a
reverse (Vector vector) =
    { n0 = vector.n24
    , n1 = vector.n23
    , n2 = vector.n22
    , n3 = vector.n21
    , n4 = vector.n20
    , n5 = vector.n19
    , n6 = vector.n18
    , n7 = vector.n17
    , n8 = vector.n16
    , n9 = vector.n15
    , n10 = vector.n14
    , n11 = vector.n13
    , n12 = vector.n12
    , n13 = vector.n11
    , n14 = vector.n10
    , n15 = vector.n9
    , n16 = vector.n8
    , n17 = vector.n7
    , n18 = vector.n6
    , n19 = vector.n5
    , n20 = vector.n4
    , n21 = vector.n3
    , n22 = vector.n2
    , n23 = vector.n1
    , n24 = vector.n0
    }
        |> Vector


{-| The length of this vector type, which is 25
-}
length : Int
length =
    25


{-| Break a `List a` down into groups of `Vector25 a`. The output is a tuple, where the left side is a list of the remainder.

    Vector3.group [ 1, 2, 3 ]
    --> ([] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4 ]
    --> ([ 4 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5 ]
    --> ([ 4, 5 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5, 6 ]
    --> ([] , [ Vector3.from3 1 2 3, Vector3.from3 4 5 6 ])

-}
group : List a -> ( List a, List (Vector25 a) )
group items =
    groupHelp items []


groupHelp : List a -> List (Vector25 a) -> ( List a, List (Vector25 a) )
groupHelp remainingItems output =
    case remainingItems of
        i0 :: i1 :: i2 :: i3 :: i4 :: i5 :: i6 :: i7 :: i8 :: i9 :: i10 :: i11 :: i12 :: i13 :: i14 :: i15 :: i16 :: i17 :: i18 :: i19 :: i20 :: i21 :: i22 :: i23 :: i24 :: rest ->
            groupHelp rest (from25 i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 i11 i12 i13 i14 i15 i16 i17 i18 i19 i20 i21 i22 i23 i24 :: output)

        _ ->
            ( remainingItems, List.reverse output )


{-| A list of all the indices, from 0 to 24
-}
indices : Vector25 Index
indices =
    initializeFromIndex identity


{-| Add an element to the end of a `Vector25 a`, incrementing its size by 1

    Vector4.push 4 (Vector4.from4 0 1 2 3)
    --> Vector5.from5 0 1 2 3 4

-}
push : a -> Vector25 a -> Vector26.Vector26 a
push a (Vector vector) =
    { n0 = vector.n0
    , n1 = vector.n1
    , n2 = vector.n2
    , n3 = vector.n3
    , n4 = vector.n4
    , n5 = vector.n5
    , n6 = vector.n6
    , n7 = vector.n7
    , n8 = vector.n8
    , n9 = vector.n9
    , n10 = vector.n10
    , n11 = vector.n11
    , n12 = vector.n12
    , n13 = vector.n13
    , n14 = vector.n14
    , n15 = vector.n15
    , n16 = vector.n16
    , n17 = vector.n17
    , n18 = vector.n18
    , n19 = vector.n19
    , n20 = vector.n20
    , n21 = vector.n21
    , n22 = vector.n22
    , n23 = vector.n23
    , n24 = vector.n24
    , n25 = a
    }
        |> Vector26.Vector


{-| Separate a `Vector25 a` into its last element and everything else.

    Vector4.pop (Vector4.from4 0 1 2 3)
    --> (Vector3.from3 0 1 2, 3)

-}
pop : Vector25 a -> ( Vector24.Vector24 a, a )
pop (Vector vector) =
    ( { n0 = vector.n0
      , n1 = vector.n1
      , n2 = vector.n2
      , n3 = vector.n3
      , n4 = vector.n4
      , n5 = vector.n5
      , n6 = vector.n6
      , n7 = vector.n7
      , n8 = vector.n8
      , n9 = vector.n9
      , n10 = vector.n10
      , n11 = vector.n11
      , n12 = vector.n12
      , n13 = vector.n13
      , n14 = vector.n14
      , n15 = vector.n15
      , n16 = vector.n16
      , n17 = vector.n17
      , n18 = vector.n18
      , n19 = vector.n19
      , n20 = vector.n20
      , n21 = vector.n21
      , n22 = vector.n22
      , n23 = vector.n23
      }
        |> Vector24.Vector
    , vector.n24
    )


{-| Split a `Vector25 a` into its first element and the rest

    Vector4.uncons (Vector4.from4 0 1 2 3)
    --> (0, Vector3.from3 1 2 3)

-}
uncons : Vector25 a -> ( a, Vector24.Vector24 a )
uncons (Vector vector) =
    ( vector.n0
    , { n0 = vector.n1
      , n1 = vector.n2
      , n2 = vector.n3
      , n3 = vector.n4
      , n4 = vector.n5
      , n5 = vector.n6
      , n6 = vector.n7
      , n7 = vector.n8
      , n8 = vector.n9
      , n9 = vector.n10
      , n10 = vector.n11
      , n11 = vector.n12
      , n12 = vector.n13
      , n13 = vector.n14
      , n14 = vector.n15
      , n15 = vector.n16
      , n16 = vector.n17
      , n17 = vector.n18
      , n18 = vector.n19
      , n19 = vector.n20
      , n20 = vector.n21
      , n21 = vector.n22
      , n22 = vector.n23
      , n23 = vector.n24
      }
        |> Vector24.Vector
    )


{-| Add an element to the front of a vector, incrementing the vector size by 1

    Vector4.cons -1 (Vector4.from4 0 1 2 3)
    --> Vector5.from5 -1 0 1 2 3

-}
cons : a -> Vector25 a -> Vector26.Vector26 a
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
    , n9 = vector.n8
    , n10 = vector.n9
    , n11 = vector.n10
    , n12 = vector.n11
    , n13 = vector.n12
    , n14 = vector.n13
    , n15 = vector.n14
    , n16 = vector.n15
    , n17 = vector.n16
    , n18 = vector.n17
    , n19 = vector.n18
    , n20 = vector.n19
    , n21 = vector.n20
    , n22 = vector.n21
    , n23 = vector.n22
    , n24 = vector.n23
    , n25 = vector.n24
    }
        |> Vector26.Vector
