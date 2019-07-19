module Vector34 exposing
    ( Vector34 
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
    , from34
    )


{-| A vector of length 34

# Vector34

@docs Vector34

# Creation

@docs fromList, repeat, from34, fromListWithDefault, initializeFromInt, initializeFromIndex

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


import Vector34.Internal exposing (Vector34(..), VectorModel)
import Vector35.Internal as Vector35
import Vector33.Internal as Vector33
import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)


{-| A vector that contains exactly 34 elements -}
type alias Vector34 a = 
    Vector34.Internal.Vector34 a


{-| All the indices to a `Vector34 a`. There are exactly 34 of them. Its kind of like an `Int` except there is a finite amount of them. -}
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
    | Index25
    | Index26
    | Index27
    | Index28
    | Index29
    | Index30
    | Index31
    | Index32
    | Index33


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
            Just Index25

        Index25 ->
            Just Index26

        Index26 ->
            Just Index27

        Index27 ->
            Just Index28

        Index28 ->
            Just Index29

        Index29 ->
            Just Index30

        Index30 ->
            Just Index31

        Index31 ->
            Just Index32

        Index32 ->
            Just Index33

        Index33 ->
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

        Index25 ->
            Just Index24

        Index26 ->
            Just Index25

        Index27 ->
            Just Index26

        Index28 ->
            Just Index27

        Index29 ->
            Just Index28

        Index30 ->
            Just Index29

        Index31 ->
            Just Index30

        Index32 ->
            Just Index31

        Index33 ->
            Just Index32


{-| Get the item at that `Index` in a `Vector34 a` -}
get : Index -> Vector34 a -> a
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

        Index25 ->
            vector.n25

        Index26 ->
            vector.n26

        Index27 ->
            vector.n27

        Index28 ->
            vector.n28

        Index29 ->
            vector.n29

        Index30 ->
            vector.n30

        Index31 ->
            vector.n31

        Index32 ->
            vector.n32

        Index33 ->
            vector.n33


{-| Set the item at a specific index in a `Vector34 a` -}
set : Index -> a -> Vector34 a -> Vector34 a
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

        Index25 ->
            Vector { vector | n25 = a }

        Index26 ->
            Vector { vector | n26 = a }

        Index27 ->
            Vector { vector | n27 = a }

        Index28 ->
            Vector { vector | n28 = a }

        Index29 ->
            Vector { vector | n29 = a }

        Index30 ->
            Vector { vector | n30 = a }

        Index31 ->
            Vector { vector | n31 = a }

        Index32 ->
            Vector { vector | n32 = a }

        Index33 ->
            Vector { vector | n33 = a }


{-| Reduce a `Vector34 a` from the right. -}
foldr : (a -> b -> b) -> b -> Vector34 a -> b
foldr f start vector =
    List.foldr f start <| toList vector


{-| Reduce a `Vector34 a` from the left. -}
foldl : (a -> b -> b) -> b -> Vector34 a -> b
foldl f start vector =
    List.foldl f start <| toList vector


{-| Apply a function to every element in a `Vector34 a`. -}
map : (a -> b) -> Vector34 a -> Vector34 b
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
    , n25 = f vector.n25
    , n26 = f vector.n26
    , n27 = f vector.n27
    , n28 = f vector.n28
    , n29 = f vector.n29
    , n30 = f vector.n30
    , n31 = f vector.n31
    , n32 = f vector.n32
    , n33 = f vector.n33
    }
        |> Vector


{-| Apply a function on every element with its index as first argument -}
indexedMap : (Index -> a -> b) -> Vector34 a -> Vector34 b
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
    , n25 = f Index25 vector.n25
    , n26 = f Index26 vector.n26
    , n27 = f Index27 vector.n27
    , n28 = f Index28 vector.n28
    , n29 = f Index29 vector.n29
    , n30 = f Index30 vector.n30
    , n31 = f Index31 vector.n31
    , n32 = f Index32 vector.n32
    , n33 = f Index33 vector.n33
    }
        |> Vector


{-|  -}
map2 : (a -> b -> c) -> Vector34 a -> Vector34 b -> Vector34 c
map2 f (Vector va ) (Vector vb ) =
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
    , n25 = f va.n25 vb.n25
    , n26 = f va.n26 vb.n26
    , n27 = f va.n27 vb.n27
    , n28 = f va.n28 vb.n28
    , n29 = f va.n29 vb.n29
    , n30 = f va.n30 vb.n30
    , n31 = f va.n31 vb.n31
    , n32 = f va.n32 vb.n32
    , n33 = f va.n33 vb.n33
    }
        |> Vector


{-|  -}
map3 : (a -> b -> c -> d) -> Vector34 a -> Vector34 b -> Vector34 c -> Vector34 d
map3 f (Vector va ) (Vector vb ) (Vector vc ) =
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
    , n25 = f va.n25 vb.n25 vc.n25
    , n26 = f va.n26 vb.n26 vc.n26
    , n27 = f va.n27 vb.n27 vc.n27
    , n28 = f va.n28 vb.n28 vc.n28
    , n29 = f va.n29 vb.n29 vc.n29
    , n30 = f va.n30 vb.n30 vc.n30
    , n31 = f va.n31 vb.n31 vc.n31
    , n32 = f va.n32 vb.n32 vc.n32
    , n33 = f va.n33 vb.n33 vc.n33
    }
        |> Vector


{-|  -}
map4 : (a -> b -> c -> d -> e) -> Vector34 a -> Vector34 b -> Vector34 c -> Vector34 d -> Vector34 e
map4 f (Vector va ) (Vector vb ) (Vector vc ) (Vector vd ) =
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
    , n25 = f va.n25 vb.n25 vc.n25 vd.n25
    , n26 = f va.n26 vb.n26 vc.n26 vd.n26
    , n27 = f va.n27 vb.n27 vc.n27 vd.n27
    , n28 = f va.n28 vb.n28 vc.n28 vd.n28
    , n29 = f va.n29 vb.n29 vc.n29 vd.n29
    , n30 = f va.n30 vb.n30 vc.n30 vd.n30
    , n31 = f va.n31 vb.n31 vc.n31 vd.n31
    , n32 = f va.n32 vb.n32 vc.n32 vd.n32
    , n33 = f va.n33 vb.n33 vc.n33 vd.n33
    }
        |> Vector


{-|  -}
map5 : (a -> b -> c -> d -> e -> f) -> Vector34 a -> Vector34 b -> Vector34 c -> Vector34 d -> Vector34 e -> Vector34 f
map5 f (Vector va ) (Vector vb ) (Vector vc ) (Vector vd ) (Vector ve ) =
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
    , n25 = f va.n25 vb.n25 vc.n25 vd.n25 ve.n25
    , n26 = f va.n26 vb.n26 vc.n26 vd.n26 ve.n26
    , n27 = f va.n27 vb.n27 vc.n27 vd.n27 ve.n27
    , n28 = f va.n28 vb.n28 vc.n28 vd.n28 ve.n28
    , n29 = f va.n29 vb.n29 vc.n29 vd.n29 ve.n29
    , n30 = f va.n30 vb.n30 vc.n30 vd.n30 ve.n30
    , n31 = f va.n31 vb.n31 vc.n31 vd.n31 ve.n31
    , n32 = f va.n32 vb.n32 vc.n32 vd.n32 ve.n32
    , n33 = f va.n33 vb.n33 vc.n33 vd.n33 ve.n33
    }
        |> Vector


{-| Transform just one particular item at a particular `Index` -}
mapItem : Index -> (a -> a) -> Vector34 a -> Vector34 a
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

        Index25 ->
            Vector { vector | n25 = mapper vector.n25 }

        Index26 ->
            Vector { vector | n26 = mapper vector.n26 }

        Index27 ->
            Vector { vector | n27 = mapper vector.n27 }

        Index28 ->
            Vector { vector | n28 = mapper vector.n28 }

        Index29 ->
            Vector { vector | n29 = mapper vector.n29 }

        Index30 ->
            Vector { vector | n30 = mapper vector.n30 }

        Index31 ->
            Vector { vector | n31 = mapper vector.n31 }

        Index32 ->
            Vector { vector | n32 = mapper vector.n32 }

        Index33 ->
            Vector { vector | n33 = mapper vector.n33 }


{-| Convert a `Vector34 a` into a `List a` of length 34 -}
toList : Vector34 a -> List a
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
    , vector.n25
    , vector.n26
    , vector.n27
    , vector.n28
    , vector.n29
    , vector.n30
    , vector.n31
    , vector.n32
    , vector.n33
    ]


{-| Turn a `List a` into a `Vector34 a`. If there are not enough items in the `List a`, then this function returns `Nothing`. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromList []
    --> Nothing

    Vector3.fromList [ 1 ]
    --> Nothing

    Vector3.fromList [ 5, 6, 7, 8 ]
    --> Just ([ 8 ], Vector3.from3 5 6 7)

 -}
fromList : List a -> Maybe (List a, Vector34 a)
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
        |> andAnother

        |> Maybe.map (Tuple.mapSecond Vector)


{-| Turn a `List a` into a `Vector34 a`. If there are not enough items in the `List a`, then fill in the remaining spots with a default value. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromListWithDefault 1 []
    --> ([] ,Vector3.from3 1 1 1)

    Vector3.fromListWithDefault 2 [ 1 ]
    --> ([], Vector3.from3 1 2 2)

    Vector3.fromListWithDefault 2 [ 5, 6, 7, 8 ]
    --> ([ 8 ], Vector3.from3 5 6 7)

 -}
fromListWithDefault : a -> List a -> ( List a,Vector34 a)
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
        |> andAnotherSafe

        |> finishOffAndAnotherSafe
        |> Tuple.mapSecond Vector


{-| Turn a `Vector34 a` elm into a list, where each element is paired with its `Index` -}
toIndexedList : Vector34 a -> List (Index, a)
toIndexedList (Vector vector) =
    [ ( Index0, vector.n0)
    , ( Index1, vector.n1)
    , ( Index2, vector.n2)
    , ( Index3, vector.n3)
    , ( Index4, vector.n4)
    , ( Index5, vector.n5)
    , ( Index6, vector.n6)
    , ( Index7, vector.n7)
    , ( Index8, vector.n8)
    , ( Index9, vector.n9)
    , ( Index10, vector.n10)
    , ( Index11, vector.n11)
    , ( Index12, vector.n12)
    , ( Index13, vector.n13)
    , ( Index14, vector.n14)
    , ( Index15, vector.n15)
    , ( Index16, vector.n16)
    , ( Index17, vector.n17)
    , ( Index18, vector.n18)
    , ( Index19, vector.n19)
    , ( Index20, vector.n20)
    , ( Index21, vector.n21)
    , ( Index22, vector.n22)
    , ( Index23, vector.n23)
    , ( Index24, vector.n24)
    , ( Index25, vector.n25)
    , ( Index26, vector.n26)
    , ( Index27, vector.n27)
    , ( Index28, vector.n28)
    , ( Index29, vector.n29)
    , ( Index30, vector.n30)
    , ( Index31, vector.n31)
    , ( Index32, vector.n32)
    , ( Index33, vector.n33)
    ]


{-| Make a `Vector34 a` using a function that takes an `Int`, representing the index -}
initializeFromInt : (Int -> a) -> Vector34 a
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
    , n25 = f 25
    , n26 = f 26
    , n27 = f 27
    , n28 = f 28
    , n29 = f 29
    , n30 = f 30
    , n31 = f 31
    , n32 = f 32
    , n33 = f 33
    }
        |> Vector


{-| Make a `Vector34 a` using a function that takes an `Index` -}
initializeFromIndex : (Index -> a) -> Vector34 a
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
    , n25 = f Index25
    , n26 = f Index26
    , n27 = f Index27
    , n28 = f Index28
    , n29 = f Index29
    , n30 = f Index30
    , n31 = f Index31
    , n32 = f Index32
    , n33 = f Index33
    }
        |> Vector


{-| Make a `Vector34 a` filled with just one item repeated over and over again. -}
repeat : a -> Vector34 a
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
    , n25 = a
    , n26 = a
    , n27 = a
    , n28 = a
    , n29 = a
    , n30 = a
    , n31 = a
    , n32 = a
    , n33 = a
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

        Index25 ->
            25

        Index26 ->
            26

        Index27 ->
            27

        Index28 ->
            28

        Index29 ->
            29

        Index30 ->
            30

        Index31 ->
            31

        Index32 ->
            32

        Index33 ->
            33


{-| Try and turn an `Int` into an `Index`, returning `Nothing` if the `Int` is above the maximum index, or below the zero index, of this `Vector34 a`

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

        25 ->
            Just Index25

        26 ->
            Just Index26

        27 ->
            Just Index27

        28 ->
            Just Index28

        29 ->
            Just Index29

        30 ->
            Just Index30

        31 ->
            Just Index31

        32 ->
            Just Index32

        33 ->
            Just Index33

        _ ->
            Nothing


{-| Make a `Vector34 a` from 34 elements -}
from34 : a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> Vector34 a
from34 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 =
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
    , n25 = a25
    , n26 = a26
    , n27 = a27
    , n28 = a28
    , n29 = a29
    , n30 = a30
    , n31 = a31
    , n32 = a32
    , n33 = a33
    }
        |> Vector


{-| See if a Vector34 a contains a value -}
member : a -> Vector34 a -> Bool
member a (Vector vector) =
    a == vector.n0
    ||     a == vector.n1
    ||     a == vector.n2
    ||     a == vector.n3
    ||     a == vector.n4
    ||     a == vector.n5
    ||     a == vector.n6
    ||     a == vector.n7
    ||     a == vector.n8
    ||     a == vector.n9
    ||     a == vector.n10
    ||     a == vector.n11
    ||     a == vector.n12
    ||     a == vector.n13
    ||     a == vector.n14
    ||     a == vector.n15
    ||     a == vector.n16
    ||     a == vector.n17
    ||     a == vector.n18
    ||     a == vector.n19
    ||     a == vector.n20
    ||     a == vector.n21
    ||     a == vector.n22
    ||     a == vector.n23
    ||     a == vector.n24
    ||     a == vector.n25
    ||     a == vector.n26
    ||     a == vector.n27
    ||     a == vector.n28
    ||     a == vector.n29
    ||     a == vector.n30
    ||     a == vector.n31
    ||     a == vector.n32
    ||     a == vector.n33


{-| Reverse the order of the items in a `Vector34 a` -}
reverse : Vector34 a -> Vector34 a
reverse (Vector vector) =
    { n0 = vector.n33
    , n1 = vector.n32
    , n2 = vector.n31
    , n3 = vector.n30
    , n4 = vector.n29
    , n5 = vector.n28
    , n6 = vector.n27
    , n7 = vector.n26
    , n8 = vector.n25
    , n9 = vector.n24
    , n10 = vector.n23
    , n11 = vector.n22
    , n12 = vector.n21
    , n13 = vector.n20
    , n14 = vector.n19
    , n15 = vector.n18
    , n16 = vector.n17
    , n17 = vector.n16
    , n18 = vector.n15
    , n19 = vector.n14
    , n20 = vector.n13
    , n21 = vector.n12
    , n22 = vector.n11
    , n23 = vector.n10
    , n24 = vector.n9
    , n25 = vector.n8
    , n26 = vector.n7
    , n27 = vector.n6
    , n28 = vector.n5
    , n29 = vector.n4
    , n30 = vector.n3
    , n31 = vector.n2
    , n32 = vector.n1
    , n33 = vector.n0
    }
        |> Vector


{-| The length of this vector type, which is 34 -}
length : Int
length =
    34


{-| Break a `List a` down into groups of `Vector34 a`. The output is a tuple, where the left side is a list of the remainder.

    Vector3.group [ 1, 2, 3 ]
    --> ([] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4 ]
    --> ([ 4 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5 ]
    --> ([ 4, 5 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5, 6 ]
    --> ([] , [ Vector3.from3 1 2 3, Vector3.from3 4 5 6 ])
 -}
group : List a -> (List a, List ( Vector34 a ) )
group items =
    groupHelp items []


groupHelp : List a -> List ( Vector34 a ) -> (List a, List ( Vector34 a ) )
groupHelp remainingItems output =
    case remainingItems of
        i0 :: i1 :: i2 :: i3 :: i4 :: i5 :: i6 :: i7 :: i8 :: i9 :: i10 :: i11 :: i12 :: i13 :: i14 :: i15 :: i16 :: i17 :: i18 :: i19 :: i20 :: i21 :: i22 :: i23 :: i24 :: i25 :: i26 :: i27 :: i28 :: i29 :: i30 :: i31 :: i32 :: i33 :: rest ->
            groupHelp rest (from34 i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 i11 i12 i13 i14 i15 i16 i17 i18 i19 i20 i21 i22 i23 i24 i25 i26 i27 i28 i29 i30 i31 i32 i33 :: output)

        _ ->
            (remainingItems, List.reverse output)


{-| A list of all the indices, from 0 to 33 -}
indices : Vector34 Index
indices =
    initializeFromIndex identity


{-| Add an element to the end of a `Vector34 a`, incrementing its size by 1

    Vector4.push 4 (Vector4.from4 0 1 2 3)
    --> Vector5.from5 0 1 2 3 4 -}
push : a -> Vector34 a -> Vector35.Vector35 a
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
    , n25 = vector.n25
    , n26 = vector.n26
    , n27 = vector.n27
    , n28 = vector.n28
    , n29 = vector.n29
    , n30 = vector.n30
    , n31 = vector.n31
    , n32 = vector.n32
    , n33 = vector.n33
    , n34 = a
    }
        |> Vector35.Vector


{-| Separate a `Vector34 a` into its last element and everything else.

    Vector4.pop (Vector4.from4 0 1 2 3)
    --> (Vector3.from3 0 1 2, 3) -}
pop : Vector34 a -> ( Vector33.Vector33 a, a )
pop (Vector vector) =
    (
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
    , n25 = vector.n25
    , n26 = vector.n26
    , n27 = vector.n27
    , n28 = vector.n28
    , n29 = vector.n29
    , n30 = vector.n30
    , n31 = vector.n31
    , n32 = vector.n32
    }
        |> Vector33.Vector
    , vector.n33
    )


{-| Split a `Vector34 a` into its first element and the rest

    Vector4.uncons (Vector4.from4 0 1 2 3)
    --> (0, Vector3.from3 1 2 3) -}
uncons : Vector34 a -> ( a, Vector33.Vector33 a )
uncons (Vector vector) =
    (vector.n0
    ,    { n0 = vector.n1
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
    , n24 = vector.n25
    , n25 = vector.n26
    , n26 = vector.n27
    , n27 = vector.n28
    , n28 = vector.n29
    , n29 = vector.n30
    , n30 = vector.n31
    , n31 = vector.n32
    , n32 = vector.n33
    }
        |> Vector33.Vector    )


{-| Add an element to the front of a vector, incrementing the vector size by 1

    Vector4.cons -1 (Vector4.from4 0 1 2 3)
    --> Vector5.from5 -1 0 1 2 3 -}
cons : a -> Vector34 a -> Vector35.Vector35 a
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
    , n26 = vector.n25
    , n27 = vector.n26
    , n28 = vector.n27
    , n29 = vector.n28
    , n30 = vector.n29
    , n31 = vector.n30
    , n32 = vector.n31
    , n33 = vector.n32
    , n34 = vector.n33
    }
        |> Vector35.Vector