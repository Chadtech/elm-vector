module Vector97 exposing
    ( Vector97
    , fromList, repeat, from97, fromListWithDefault, initializeFromInt, initializeFromIndex
    , Index(..), get, set, indices, indexToInt, intToIndex, nextIndex, previousIndex
    , map, mapItem, indexedMap, foldr, foldl, map2, map3, map4, map5
    , toList, toIndexedList
    , pop, uncons, push, cons
    , length, reverse, member, group
    )

{-| A vector of length 97


# Vector97

@docs Vector97


# Creation

@docs fromList, repeat, from97, fromListWithDefault, initializeFromInt, initializeFromIndex


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
import Vector96.Internal as Vector96
import Vector97.Internal exposing (Vector97(..), VectorModel)
import Vector98.Internal as Vector98


{-| A vector that contains exactly 97 elements
-}
type alias Vector97 a =
    Vector97.Internal.Vector97 a


{-| All the indices to a `Vector97 a`. There are exactly 97 of them. Its kind of like an `Int` except there is a finite amount of them.
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
    | Index25
    | Index26
    | Index27
    | Index28
    | Index29
    | Index30
    | Index31
    | Index32
    | Index33
    | Index34
    | Index35
    | Index36
    | Index37
    | Index38
    | Index39
    | Index40
    | Index41
    | Index42
    | Index43
    | Index44
    | Index45
    | Index46
    | Index47
    | Index48
    | Index49
    | Index50
    | Index51
    | Index52
    | Index53
    | Index54
    | Index55
    | Index56
    | Index57
    | Index58
    | Index59
    | Index60
    | Index61
    | Index62
    | Index63
    | Index64
    | Index65
    | Index66
    | Index67
    | Index68
    | Index69
    | Index70
    | Index71
    | Index72
    | Index73
    | Index74
    | Index75
    | Index76
    | Index77
    | Index78
    | Index79
    | Index80
    | Index81
    | Index82
    | Index83
    | Index84
    | Index85
    | Index86
    | Index87
    | Index88
    | Index89
    | Index90
    | Index91
    | Index92
    | Index93
    | Index94
    | Index95
    | Index96


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
            Just Index34

        Index34 ->
            Just Index35

        Index35 ->
            Just Index36

        Index36 ->
            Just Index37

        Index37 ->
            Just Index38

        Index38 ->
            Just Index39

        Index39 ->
            Just Index40

        Index40 ->
            Just Index41

        Index41 ->
            Just Index42

        Index42 ->
            Just Index43

        Index43 ->
            Just Index44

        Index44 ->
            Just Index45

        Index45 ->
            Just Index46

        Index46 ->
            Just Index47

        Index47 ->
            Just Index48

        Index48 ->
            Just Index49

        Index49 ->
            Just Index50

        Index50 ->
            Just Index51

        Index51 ->
            Just Index52

        Index52 ->
            Just Index53

        Index53 ->
            Just Index54

        Index54 ->
            Just Index55

        Index55 ->
            Just Index56

        Index56 ->
            Just Index57

        Index57 ->
            Just Index58

        Index58 ->
            Just Index59

        Index59 ->
            Just Index60

        Index60 ->
            Just Index61

        Index61 ->
            Just Index62

        Index62 ->
            Just Index63

        Index63 ->
            Just Index64

        Index64 ->
            Just Index65

        Index65 ->
            Just Index66

        Index66 ->
            Just Index67

        Index67 ->
            Just Index68

        Index68 ->
            Just Index69

        Index69 ->
            Just Index70

        Index70 ->
            Just Index71

        Index71 ->
            Just Index72

        Index72 ->
            Just Index73

        Index73 ->
            Just Index74

        Index74 ->
            Just Index75

        Index75 ->
            Just Index76

        Index76 ->
            Just Index77

        Index77 ->
            Just Index78

        Index78 ->
            Just Index79

        Index79 ->
            Just Index80

        Index80 ->
            Just Index81

        Index81 ->
            Just Index82

        Index82 ->
            Just Index83

        Index83 ->
            Just Index84

        Index84 ->
            Just Index85

        Index85 ->
            Just Index86

        Index86 ->
            Just Index87

        Index87 ->
            Just Index88

        Index88 ->
            Just Index89

        Index89 ->
            Just Index90

        Index90 ->
            Just Index91

        Index91 ->
            Just Index92

        Index92 ->
            Just Index93

        Index93 ->
            Just Index94

        Index94 ->
            Just Index95

        Index95 ->
            Just Index96

        Index96 ->
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

        Index34 ->
            Just Index33

        Index35 ->
            Just Index34

        Index36 ->
            Just Index35

        Index37 ->
            Just Index36

        Index38 ->
            Just Index37

        Index39 ->
            Just Index38

        Index40 ->
            Just Index39

        Index41 ->
            Just Index40

        Index42 ->
            Just Index41

        Index43 ->
            Just Index42

        Index44 ->
            Just Index43

        Index45 ->
            Just Index44

        Index46 ->
            Just Index45

        Index47 ->
            Just Index46

        Index48 ->
            Just Index47

        Index49 ->
            Just Index48

        Index50 ->
            Just Index49

        Index51 ->
            Just Index50

        Index52 ->
            Just Index51

        Index53 ->
            Just Index52

        Index54 ->
            Just Index53

        Index55 ->
            Just Index54

        Index56 ->
            Just Index55

        Index57 ->
            Just Index56

        Index58 ->
            Just Index57

        Index59 ->
            Just Index58

        Index60 ->
            Just Index59

        Index61 ->
            Just Index60

        Index62 ->
            Just Index61

        Index63 ->
            Just Index62

        Index64 ->
            Just Index63

        Index65 ->
            Just Index64

        Index66 ->
            Just Index65

        Index67 ->
            Just Index66

        Index68 ->
            Just Index67

        Index69 ->
            Just Index68

        Index70 ->
            Just Index69

        Index71 ->
            Just Index70

        Index72 ->
            Just Index71

        Index73 ->
            Just Index72

        Index74 ->
            Just Index73

        Index75 ->
            Just Index74

        Index76 ->
            Just Index75

        Index77 ->
            Just Index76

        Index78 ->
            Just Index77

        Index79 ->
            Just Index78

        Index80 ->
            Just Index79

        Index81 ->
            Just Index80

        Index82 ->
            Just Index81

        Index83 ->
            Just Index82

        Index84 ->
            Just Index83

        Index85 ->
            Just Index84

        Index86 ->
            Just Index85

        Index87 ->
            Just Index86

        Index88 ->
            Just Index87

        Index89 ->
            Just Index88

        Index90 ->
            Just Index89

        Index91 ->
            Just Index90

        Index92 ->
            Just Index91

        Index93 ->
            Just Index92

        Index94 ->
            Just Index93

        Index95 ->
            Just Index94

        Index96 ->
            Just Index95


{-| Get the item at that `Index` in a `Vector97 a`
-}
get : Index -> Vector97 a -> a
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

        Index34 ->
            vector.n34

        Index35 ->
            vector.n35

        Index36 ->
            vector.n36

        Index37 ->
            vector.n37

        Index38 ->
            vector.n38

        Index39 ->
            vector.n39

        Index40 ->
            vector.n40

        Index41 ->
            vector.n41

        Index42 ->
            vector.n42

        Index43 ->
            vector.n43

        Index44 ->
            vector.n44

        Index45 ->
            vector.n45

        Index46 ->
            vector.n46

        Index47 ->
            vector.n47

        Index48 ->
            vector.n48

        Index49 ->
            vector.n49

        Index50 ->
            vector.n50

        Index51 ->
            vector.n51

        Index52 ->
            vector.n52

        Index53 ->
            vector.n53

        Index54 ->
            vector.n54

        Index55 ->
            vector.n55

        Index56 ->
            vector.n56

        Index57 ->
            vector.n57

        Index58 ->
            vector.n58

        Index59 ->
            vector.n59

        Index60 ->
            vector.n60

        Index61 ->
            vector.n61

        Index62 ->
            vector.n62

        Index63 ->
            vector.n63

        Index64 ->
            vector.n64

        Index65 ->
            vector.n65

        Index66 ->
            vector.n66

        Index67 ->
            vector.n67

        Index68 ->
            vector.n68

        Index69 ->
            vector.n69

        Index70 ->
            vector.n70

        Index71 ->
            vector.n71

        Index72 ->
            vector.n72

        Index73 ->
            vector.n73

        Index74 ->
            vector.n74

        Index75 ->
            vector.n75

        Index76 ->
            vector.n76

        Index77 ->
            vector.n77

        Index78 ->
            vector.n78

        Index79 ->
            vector.n79

        Index80 ->
            vector.n80

        Index81 ->
            vector.n81

        Index82 ->
            vector.n82

        Index83 ->
            vector.n83

        Index84 ->
            vector.n84

        Index85 ->
            vector.n85

        Index86 ->
            vector.n86

        Index87 ->
            vector.n87

        Index88 ->
            vector.n88

        Index89 ->
            vector.n89

        Index90 ->
            vector.n90

        Index91 ->
            vector.n91

        Index92 ->
            vector.n92

        Index93 ->
            vector.n93

        Index94 ->
            vector.n94

        Index95 ->
            vector.n95

        Index96 ->
            vector.n96


{-| Set the item at a specific index in a `Vector97 a`
-}
set : Index -> a -> Vector97 a -> Vector97 a
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

        Index34 ->
            Vector { vector | n34 = a }

        Index35 ->
            Vector { vector | n35 = a }

        Index36 ->
            Vector { vector | n36 = a }

        Index37 ->
            Vector { vector | n37 = a }

        Index38 ->
            Vector { vector | n38 = a }

        Index39 ->
            Vector { vector | n39 = a }

        Index40 ->
            Vector { vector | n40 = a }

        Index41 ->
            Vector { vector | n41 = a }

        Index42 ->
            Vector { vector | n42 = a }

        Index43 ->
            Vector { vector | n43 = a }

        Index44 ->
            Vector { vector | n44 = a }

        Index45 ->
            Vector { vector | n45 = a }

        Index46 ->
            Vector { vector | n46 = a }

        Index47 ->
            Vector { vector | n47 = a }

        Index48 ->
            Vector { vector | n48 = a }

        Index49 ->
            Vector { vector | n49 = a }

        Index50 ->
            Vector { vector | n50 = a }

        Index51 ->
            Vector { vector | n51 = a }

        Index52 ->
            Vector { vector | n52 = a }

        Index53 ->
            Vector { vector | n53 = a }

        Index54 ->
            Vector { vector | n54 = a }

        Index55 ->
            Vector { vector | n55 = a }

        Index56 ->
            Vector { vector | n56 = a }

        Index57 ->
            Vector { vector | n57 = a }

        Index58 ->
            Vector { vector | n58 = a }

        Index59 ->
            Vector { vector | n59 = a }

        Index60 ->
            Vector { vector | n60 = a }

        Index61 ->
            Vector { vector | n61 = a }

        Index62 ->
            Vector { vector | n62 = a }

        Index63 ->
            Vector { vector | n63 = a }

        Index64 ->
            Vector { vector | n64 = a }

        Index65 ->
            Vector { vector | n65 = a }

        Index66 ->
            Vector { vector | n66 = a }

        Index67 ->
            Vector { vector | n67 = a }

        Index68 ->
            Vector { vector | n68 = a }

        Index69 ->
            Vector { vector | n69 = a }

        Index70 ->
            Vector { vector | n70 = a }

        Index71 ->
            Vector { vector | n71 = a }

        Index72 ->
            Vector { vector | n72 = a }

        Index73 ->
            Vector { vector | n73 = a }

        Index74 ->
            Vector { vector | n74 = a }

        Index75 ->
            Vector { vector | n75 = a }

        Index76 ->
            Vector { vector | n76 = a }

        Index77 ->
            Vector { vector | n77 = a }

        Index78 ->
            Vector { vector | n78 = a }

        Index79 ->
            Vector { vector | n79 = a }

        Index80 ->
            Vector { vector | n80 = a }

        Index81 ->
            Vector { vector | n81 = a }

        Index82 ->
            Vector { vector | n82 = a }

        Index83 ->
            Vector { vector | n83 = a }

        Index84 ->
            Vector { vector | n84 = a }

        Index85 ->
            Vector { vector | n85 = a }

        Index86 ->
            Vector { vector | n86 = a }

        Index87 ->
            Vector { vector | n87 = a }

        Index88 ->
            Vector { vector | n88 = a }

        Index89 ->
            Vector { vector | n89 = a }

        Index90 ->
            Vector { vector | n90 = a }

        Index91 ->
            Vector { vector | n91 = a }

        Index92 ->
            Vector { vector | n92 = a }

        Index93 ->
            Vector { vector | n93 = a }

        Index94 ->
            Vector { vector | n94 = a }

        Index95 ->
            Vector { vector | n95 = a }

        Index96 ->
            Vector { vector | n96 = a }


{-| Reduce a `Vector97 a` from the right
-}
foldr : (a -> b -> b) -> b -> Vector97 a -> b
foldr f start vector =
    List.foldr f start <| toList vector


{-| Reduce a `Vector97 a` from the left
-}
foldl : (a -> b -> b) -> b -> Vector97 a -> b
foldl f start vector =
    List.foldl f start <| toList vector


{-| Apply a function to every element in a \`Vector97 a
-}
map : (a -> b) -> Vector97 a -> Vector97 b
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
    , n34 = f vector.n34
    , n35 = f vector.n35
    , n36 = f vector.n36
    , n37 = f vector.n37
    , n38 = f vector.n38
    , n39 = f vector.n39
    , n40 = f vector.n40
    , n41 = f vector.n41
    , n42 = f vector.n42
    , n43 = f vector.n43
    , n44 = f vector.n44
    , n45 = f vector.n45
    , n46 = f vector.n46
    , n47 = f vector.n47
    , n48 = f vector.n48
    , n49 = f vector.n49
    , n50 = f vector.n50
    , n51 = f vector.n51
    , n52 = f vector.n52
    , n53 = f vector.n53
    , n54 = f vector.n54
    , n55 = f vector.n55
    , n56 = f vector.n56
    , n57 = f vector.n57
    , n58 = f vector.n58
    , n59 = f vector.n59
    , n60 = f vector.n60
    , n61 = f vector.n61
    , n62 = f vector.n62
    , n63 = f vector.n63
    , n64 = f vector.n64
    , n65 = f vector.n65
    , n66 = f vector.n66
    , n67 = f vector.n67
    , n68 = f vector.n68
    , n69 = f vector.n69
    , n70 = f vector.n70
    , n71 = f vector.n71
    , n72 = f vector.n72
    , n73 = f vector.n73
    , n74 = f vector.n74
    , n75 = f vector.n75
    , n76 = f vector.n76
    , n77 = f vector.n77
    , n78 = f vector.n78
    , n79 = f vector.n79
    , n80 = f vector.n80
    , n81 = f vector.n81
    , n82 = f vector.n82
    , n83 = f vector.n83
    , n84 = f vector.n84
    , n85 = f vector.n85
    , n86 = f vector.n86
    , n87 = f vector.n87
    , n88 = f vector.n88
    , n89 = f vector.n89
    , n90 = f vector.n90
    , n91 = f vector.n91
    , n92 = f vector.n92
    , n93 = f vector.n93
    , n94 = f vector.n94
    , n95 = f vector.n95
    , n96 = f vector.n96
    }
        |> Vector


{-| Apply a function on every element with its index as first argument
-}
indexedMap : (Index -> a -> b) -> Vector97 a -> Vector97 b
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
    , n34 = f Index34 vector.n34
    , n35 = f Index35 vector.n35
    , n36 = f Index36 vector.n36
    , n37 = f Index37 vector.n37
    , n38 = f Index38 vector.n38
    , n39 = f Index39 vector.n39
    , n40 = f Index40 vector.n40
    , n41 = f Index41 vector.n41
    , n42 = f Index42 vector.n42
    , n43 = f Index43 vector.n43
    , n44 = f Index44 vector.n44
    , n45 = f Index45 vector.n45
    , n46 = f Index46 vector.n46
    , n47 = f Index47 vector.n47
    , n48 = f Index48 vector.n48
    , n49 = f Index49 vector.n49
    , n50 = f Index50 vector.n50
    , n51 = f Index51 vector.n51
    , n52 = f Index52 vector.n52
    , n53 = f Index53 vector.n53
    , n54 = f Index54 vector.n54
    , n55 = f Index55 vector.n55
    , n56 = f Index56 vector.n56
    , n57 = f Index57 vector.n57
    , n58 = f Index58 vector.n58
    , n59 = f Index59 vector.n59
    , n60 = f Index60 vector.n60
    , n61 = f Index61 vector.n61
    , n62 = f Index62 vector.n62
    , n63 = f Index63 vector.n63
    , n64 = f Index64 vector.n64
    , n65 = f Index65 vector.n65
    , n66 = f Index66 vector.n66
    , n67 = f Index67 vector.n67
    , n68 = f Index68 vector.n68
    , n69 = f Index69 vector.n69
    , n70 = f Index70 vector.n70
    , n71 = f Index71 vector.n71
    , n72 = f Index72 vector.n72
    , n73 = f Index73 vector.n73
    , n74 = f Index74 vector.n74
    , n75 = f Index75 vector.n75
    , n76 = f Index76 vector.n76
    , n77 = f Index77 vector.n77
    , n78 = f Index78 vector.n78
    , n79 = f Index79 vector.n79
    , n80 = f Index80 vector.n80
    , n81 = f Index81 vector.n81
    , n82 = f Index82 vector.n82
    , n83 = f Index83 vector.n83
    , n84 = f Index84 vector.n84
    , n85 = f Index85 vector.n85
    , n86 = f Index86 vector.n86
    , n87 = f Index87 vector.n87
    , n88 = f Index88 vector.n88
    , n89 = f Index89 vector.n89
    , n90 = f Index90 vector.n90
    , n91 = f Index91 vector.n91
    , n92 = f Index92 vector.n92
    , n93 = f Index93 vector.n93
    , n94 = f Index94 vector.n94
    , n95 = f Index95 vector.n95
    , n96 = f Index96 vector.n96
    }
        |> Vector


{-| -}
map2 : (a -> b -> c) -> Vector97 a -> Vector97 b -> Vector97 c
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
    , n25 = f va.n25 vb.n25
    , n26 = f va.n26 vb.n26
    , n27 = f va.n27 vb.n27
    , n28 = f va.n28 vb.n28
    , n29 = f va.n29 vb.n29
    , n30 = f va.n30 vb.n30
    , n31 = f va.n31 vb.n31
    , n32 = f va.n32 vb.n32
    , n33 = f va.n33 vb.n33
    , n34 = f va.n34 vb.n34
    , n35 = f va.n35 vb.n35
    , n36 = f va.n36 vb.n36
    , n37 = f va.n37 vb.n37
    , n38 = f va.n38 vb.n38
    , n39 = f va.n39 vb.n39
    , n40 = f va.n40 vb.n40
    , n41 = f va.n41 vb.n41
    , n42 = f va.n42 vb.n42
    , n43 = f va.n43 vb.n43
    , n44 = f va.n44 vb.n44
    , n45 = f va.n45 vb.n45
    , n46 = f va.n46 vb.n46
    , n47 = f va.n47 vb.n47
    , n48 = f va.n48 vb.n48
    , n49 = f va.n49 vb.n49
    , n50 = f va.n50 vb.n50
    , n51 = f va.n51 vb.n51
    , n52 = f va.n52 vb.n52
    , n53 = f va.n53 vb.n53
    , n54 = f va.n54 vb.n54
    , n55 = f va.n55 vb.n55
    , n56 = f va.n56 vb.n56
    , n57 = f va.n57 vb.n57
    , n58 = f va.n58 vb.n58
    , n59 = f va.n59 vb.n59
    , n60 = f va.n60 vb.n60
    , n61 = f va.n61 vb.n61
    , n62 = f va.n62 vb.n62
    , n63 = f va.n63 vb.n63
    , n64 = f va.n64 vb.n64
    , n65 = f va.n65 vb.n65
    , n66 = f va.n66 vb.n66
    , n67 = f va.n67 vb.n67
    , n68 = f va.n68 vb.n68
    , n69 = f va.n69 vb.n69
    , n70 = f va.n70 vb.n70
    , n71 = f va.n71 vb.n71
    , n72 = f va.n72 vb.n72
    , n73 = f va.n73 vb.n73
    , n74 = f va.n74 vb.n74
    , n75 = f va.n75 vb.n75
    , n76 = f va.n76 vb.n76
    , n77 = f va.n77 vb.n77
    , n78 = f va.n78 vb.n78
    , n79 = f va.n79 vb.n79
    , n80 = f va.n80 vb.n80
    , n81 = f va.n81 vb.n81
    , n82 = f va.n82 vb.n82
    , n83 = f va.n83 vb.n83
    , n84 = f va.n84 vb.n84
    , n85 = f va.n85 vb.n85
    , n86 = f va.n86 vb.n86
    , n87 = f va.n87 vb.n87
    , n88 = f va.n88 vb.n88
    , n89 = f va.n89 vb.n89
    , n90 = f va.n90 vb.n90
    , n91 = f va.n91 vb.n91
    , n92 = f va.n92 vb.n92
    , n93 = f va.n93 vb.n93
    , n94 = f va.n94 vb.n94
    , n95 = f va.n95 vb.n95
    , n96 = f va.n96 vb.n96
    }
        |> Vector


{-| -}
map3 : (a -> b -> c -> d) -> Vector97 a -> Vector97 b -> Vector97 c -> Vector97 d
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
    , n25 = f va.n25 vb.n25 vc.n25
    , n26 = f va.n26 vb.n26 vc.n26
    , n27 = f va.n27 vb.n27 vc.n27
    , n28 = f va.n28 vb.n28 vc.n28
    , n29 = f va.n29 vb.n29 vc.n29
    , n30 = f va.n30 vb.n30 vc.n30
    , n31 = f va.n31 vb.n31 vc.n31
    , n32 = f va.n32 vb.n32 vc.n32
    , n33 = f va.n33 vb.n33 vc.n33
    , n34 = f va.n34 vb.n34 vc.n34
    , n35 = f va.n35 vb.n35 vc.n35
    , n36 = f va.n36 vb.n36 vc.n36
    , n37 = f va.n37 vb.n37 vc.n37
    , n38 = f va.n38 vb.n38 vc.n38
    , n39 = f va.n39 vb.n39 vc.n39
    , n40 = f va.n40 vb.n40 vc.n40
    , n41 = f va.n41 vb.n41 vc.n41
    , n42 = f va.n42 vb.n42 vc.n42
    , n43 = f va.n43 vb.n43 vc.n43
    , n44 = f va.n44 vb.n44 vc.n44
    , n45 = f va.n45 vb.n45 vc.n45
    , n46 = f va.n46 vb.n46 vc.n46
    , n47 = f va.n47 vb.n47 vc.n47
    , n48 = f va.n48 vb.n48 vc.n48
    , n49 = f va.n49 vb.n49 vc.n49
    , n50 = f va.n50 vb.n50 vc.n50
    , n51 = f va.n51 vb.n51 vc.n51
    , n52 = f va.n52 vb.n52 vc.n52
    , n53 = f va.n53 vb.n53 vc.n53
    , n54 = f va.n54 vb.n54 vc.n54
    , n55 = f va.n55 vb.n55 vc.n55
    , n56 = f va.n56 vb.n56 vc.n56
    , n57 = f va.n57 vb.n57 vc.n57
    , n58 = f va.n58 vb.n58 vc.n58
    , n59 = f va.n59 vb.n59 vc.n59
    , n60 = f va.n60 vb.n60 vc.n60
    , n61 = f va.n61 vb.n61 vc.n61
    , n62 = f va.n62 vb.n62 vc.n62
    , n63 = f va.n63 vb.n63 vc.n63
    , n64 = f va.n64 vb.n64 vc.n64
    , n65 = f va.n65 vb.n65 vc.n65
    , n66 = f va.n66 vb.n66 vc.n66
    , n67 = f va.n67 vb.n67 vc.n67
    , n68 = f va.n68 vb.n68 vc.n68
    , n69 = f va.n69 vb.n69 vc.n69
    , n70 = f va.n70 vb.n70 vc.n70
    , n71 = f va.n71 vb.n71 vc.n71
    , n72 = f va.n72 vb.n72 vc.n72
    , n73 = f va.n73 vb.n73 vc.n73
    , n74 = f va.n74 vb.n74 vc.n74
    , n75 = f va.n75 vb.n75 vc.n75
    , n76 = f va.n76 vb.n76 vc.n76
    , n77 = f va.n77 vb.n77 vc.n77
    , n78 = f va.n78 vb.n78 vc.n78
    , n79 = f va.n79 vb.n79 vc.n79
    , n80 = f va.n80 vb.n80 vc.n80
    , n81 = f va.n81 vb.n81 vc.n81
    , n82 = f va.n82 vb.n82 vc.n82
    , n83 = f va.n83 vb.n83 vc.n83
    , n84 = f va.n84 vb.n84 vc.n84
    , n85 = f va.n85 vb.n85 vc.n85
    , n86 = f va.n86 vb.n86 vc.n86
    , n87 = f va.n87 vb.n87 vc.n87
    , n88 = f va.n88 vb.n88 vc.n88
    , n89 = f va.n89 vb.n89 vc.n89
    , n90 = f va.n90 vb.n90 vc.n90
    , n91 = f va.n91 vb.n91 vc.n91
    , n92 = f va.n92 vb.n92 vc.n92
    , n93 = f va.n93 vb.n93 vc.n93
    , n94 = f va.n94 vb.n94 vc.n94
    , n95 = f va.n95 vb.n95 vc.n95
    , n96 = f va.n96 vb.n96 vc.n96
    }
        |> Vector


{-| -}
map4 : (a -> b -> c -> d -> e) -> Vector97 a -> Vector97 b -> Vector97 c -> Vector97 d -> Vector97 e
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
    , n25 = f va.n25 vb.n25 vc.n25 vd.n25
    , n26 = f va.n26 vb.n26 vc.n26 vd.n26
    , n27 = f va.n27 vb.n27 vc.n27 vd.n27
    , n28 = f va.n28 vb.n28 vc.n28 vd.n28
    , n29 = f va.n29 vb.n29 vc.n29 vd.n29
    , n30 = f va.n30 vb.n30 vc.n30 vd.n30
    , n31 = f va.n31 vb.n31 vc.n31 vd.n31
    , n32 = f va.n32 vb.n32 vc.n32 vd.n32
    , n33 = f va.n33 vb.n33 vc.n33 vd.n33
    , n34 = f va.n34 vb.n34 vc.n34 vd.n34
    , n35 = f va.n35 vb.n35 vc.n35 vd.n35
    , n36 = f va.n36 vb.n36 vc.n36 vd.n36
    , n37 = f va.n37 vb.n37 vc.n37 vd.n37
    , n38 = f va.n38 vb.n38 vc.n38 vd.n38
    , n39 = f va.n39 vb.n39 vc.n39 vd.n39
    , n40 = f va.n40 vb.n40 vc.n40 vd.n40
    , n41 = f va.n41 vb.n41 vc.n41 vd.n41
    , n42 = f va.n42 vb.n42 vc.n42 vd.n42
    , n43 = f va.n43 vb.n43 vc.n43 vd.n43
    , n44 = f va.n44 vb.n44 vc.n44 vd.n44
    , n45 = f va.n45 vb.n45 vc.n45 vd.n45
    , n46 = f va.n46 vb.n46 vc.n46 vd.n46
    , n47 = f va.n47 vb.n47 vc.n47 vd.n47
    , n48 = f va.n48 vb.n48 vc.n48 vd.n48
    , n49 = f va.n49 vb.n49 vc.n49 vd.n49
    , n50 = f va.n50 vb.n50 vc.n50 vd.n50
    , n51 = f va.n51 vb.n51 vc.n51 vd.n51
    , n52 = f va.n52 vb.n52 vc.n52 vd.n52
    , n53 = f va.n53 vb.n53 vc.n53 vd.n53
    , n54 = f va.n54 vb.n54 vc.n54 vd.n54
    , n55 = f va.n55 vb.n55 vc.n55 vd.n55
    , n56 = f va.n56 vb.n56 vc.n56 vd.n56
    , n57 = f va.n57 vb.n57 vc.n57 vd.n57
    , n58 = f va.n58 vb.n58 vc.n58 vd.n58
    , n59 = f va.n59 vb.n59 vc.n59 vd.n59
    , n60 = f va.n60 vb.n60 vc.n60 vd.n60
    , n61 = f va.n61 vb.n61 vc.n61 vd.n61
    , n62 = f va.n62 vb.n62 vc.n62 vd.n62
    , n63 = f va.n63 vb.n63 vc.n63 vd.n63
    , n64 = f va.n64 vb.n64 vc.n64 vd.n64
    , n65 = f va.n65 vb.n65 vc.n65 vd.n65
    , n66 = f va.n66 vb.n66 vc.n66 vd.n66
    , n67 = f va.n67 vb.n67 vc.n67 vd.n67
    , n68 = f va.n68 vb.n68 vc.n68 vd.n68
    , n69 = f va.n69 vb.n69 vc.n69 vd.n69
    , n70 = f va.n70 vb.n70 vc.n70 vd.n70
    , n71 = f va.n71 vb.n71 vc.n71 vd.n71
    , n72 = f va.n72 vb.n72 vc.n72 vd.n72
    , n73 = f va.n73 vb.n73 vc.n73 vd.n73
    , n74 = f va.n74 vb.n74 vc.n74 vd.n74
    , n75 = f va.n75 vb.n75 vc.n75 vd.n75
    , n76 = f va.n76 vb.n76 vc.n76 vd.n76
    , n77 = f va.n77 vb.n77 vc.n77 vd.n77
    , n78 = f va.n78 vb.n78 vc.n78 vd.n78
    , n79 = f va.n79 vb.n79 vc.n79 vd.n79
    , n80 = f va.n80 vb.n80 vc.n80 vd.n80
    , n81 = f va.n81 vb.n81 vc.n81 vd.n81
    , n82 = f va.n82 vb.n82 vc.n82 vd.n82
    , n83 = f va.n83 vb.n83 vc.n83 vd.n83
    , n84 = f va.n84 vb.n84 vc.n84 vd.n84
    , n85 = f va.n85 vb.n85 vc.n85 vd.n85
    , n86 = f va.n86 vb.n86 vc.n86 vd.n86
    , n87 = f va.n87 vb.n87 vc.n87 vd.n87
    , n88 = f va.n88 vb.n88 vc.n88 vd.n88
    , n89 = f va.n89 vb.n89 vc.n89 vd.n89
    , n90 = f va.n90 vb.n90 vc.n90 vd.n90
    , n91 = f va.n91 vb.n91 vc.n91 vd.n91
    , n92 = f va.n92 vb.n92 vc.n92 vd.n92
    , n93 = f va.n93 vb.n93 vc.n93 vd.n93
    , n94 = f va.n94 vb.n94 vc.n94 vd.n94
    , n95 = f va.n95 vb.n95 vc.n95 vd.n95
    , n96 = f va.n96 vb.n96 vc.n96 vd.n96
    }
        |> Vector


{-| -}
map5 : (a -> b -> c -> d -> e -> f) -> Vector97 a -> Vector97 b -> Vector97 c -> Vector97 d -> Vector97 e -> Vector97 f
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
    , n25 = f va.n25 vb.n25 vc.n25 vd.n25 ve.n25
    , n26 = f va.n26 vb.n26 vc.n26 vd.n26 ve.n26
    , n27 = f va.n27 vb.n27 vc.n27 vd.n27 ve.n27
    , n28 = f va.n28 vb.n28 vc.n28 vd.n28 ve.n28
    , n29 = f va.n29 vb.n29 vc.n29 vd.n29 ve.n29
    , n30 = f va.n30 vb.n30 vc.n30 vd.n30 ve.n30
    , n31 = f va.n31 vb.n31 vc.n31 vd.n31 ve.n31
    , n32 = f va.n32 vb.n32 vc.n32 vd.n32 ve.n32
    , n33 = f va.n33 vb.n33 vc.n33 vd.n33 ve.n33
    , n34 = f va.n34 vb.n34 vc.n34 vd.n34 ve.n34
    , n35 = f va.n35 vb.n35 vc.n35 vd.n35 ve.n35
    , n36 = f va.n36 vb.n36 vc.n36 vd.n36 ve.n36
    , n37 = f va.n37 vb.n37 vc.n37 vd.n37 ve.n37
    , n38 = f va.n38 vb.n38 vc.n38 vd.n38 ve.n38
    , n39 = f va.n39 vb.n39 vc.n39 vd.n39 ve.n39
    , n40 = f va.n40 vb.n40 vc.n40 vd.n40 ve.n40
    , n41 = f va.n41 vb.n41 vc.n41 vd.n41 ve.n41
    , n42 = f va.n42 vb.n42 vc.n42 vd.n42 ve.n42
    , n43 = f va.n43 vb.n43 vc.n43 vd.n43 ve.n43
    , n44 = f va.n44 vb.n44 vc.n44 vd.n44 ve.n44
    , n45 = f va.n45 vb.n45 vc.n45 vd.n45 ve.n45
    , n46 = f va.n46 vb.n46 vc.n46 vd.n46 ve.n46
    , n47 = f va.n47 vb.n47 vc.n47 vd.n47 ve.n47
    , n48 = f va.n48 vb.n48 vc.n48 vd.n48 ve.n48
    , n49 = f va.n49 vb.n49 vc.n49 vd.n49 ve.n49
    , n50 = f va.n50 vb.n50 vc.n50 vd.n50 ve.n50
    , n51 = f va.n51 vb.n51 vc.n51 vd.n51 ve.n51
    , n52 = f va.n52 vb.n52 vc.n52 vd.n52 ve.n52
    , n53 = f va.n53 vb.n53 vc.n53 vd.n53 ve.n53
    , n54 = f va.n54 vb.n54 vc.n54 vd.n54 ve.n54
    , n55 = f va.n55 vb.n55 vc.n55 vd.n55 ve.n55
    , n56 = f va.n56 vb.n56 vc.n56 vd.n56 ve.n56
    , n57 = f va.n57 vb.n57 vc.n57 vd.n57 ve.n57
    , n58 = f va.n58 vb.n58 vc.n58 vd.n58 ve.n58
    , n59 = f va.n59 vb.n59 vc.n59 vd.n59 ve.n59
    , n60 = f va.n60 vb.n60 vc.n60 vd.n60 ve.n60
    , n61 = f va.n61 vb.n61 vc.n61 vd.n61 ve.n61
    , n62 = f va.n62 vb.n62 vc.n62 vd.n62 ve.n62
    , n63 = f va.n63 vb.n63 vc.n63 vd.n63 ve.n63
    , n64 = f va.n64 vb.n64 vc.n64 vd.n64 ve.n64
    , n65 = f va.n65 vb.n65 vc.n65 vd.n65 ve.n65
    , n66 = f va.n66 vb.n66 vc.n66 vd.n66 ve.n66
    , n67 = f va.n67 vb.n67 vc.n67 vd.n67 ve.n67
    , n68 = f va.n68 vb.n68 vc.n68 vd.n68 ve.n68
    , n69 = f va.n69 vb.n69 vc.n69 vd.n69 ve.n69
    , n70 = f va.n70 vb.n70 vc.n70 vd.n70 ve.n70
    , n71 = f va.n71 vb.n71 vc.n71 vd.n71 ve.n71
    , n72 = f va.n72 vb.n72 vc.n72 vd.n72 ve.n72
    , n73 = f va.n73 vb.n73 vc.n73 vd.n73 ve.n73
    , n74 = f va.n74 vb.n74 vc.n74 vd.n74 ve.n74
    , n75 = f va.n75 vb.n75 vc.n75 vd.n75 ve.n75
    , n76 = f va.n76 vb.n76 vc.n76 vd.n76 ve.n76
    , n77 = f va.n77 vb.n77 vc.n77 vd.n77 ve.n77
    , n78 = f va.n78 vb.n78 vc.n78 vd.n78 ve.n78
    , n79 = f va.n79 vb.n79 vc.n79 vd.n79 ve.n79
    , n80 = f va.n80 vb.n80 vc.n80 vd.n80 ve.n80
    , n81 = f va.n81 vb.n81 vc.n81 vd.n81 ve.n81
    , n82 = f va.n82 vb.n82 vc.n82 vd.n82 ve.n82
    , n83 = f va.n83 vb.n83 vc.n83 vd.n83 ve.n83
    , n84 = f va.n84 vb.n84 vc.n84 vd.n84 ve.n84
    , n85 = f va.n85 vb.n85 vc.n85 vd.n85 ve.n85
    , n86 = f va.n86 vb.n86 vc.n86 vd.n86 ve.n86
    , n87 = f va.n87 vb.n87 vc.n87 vd.n87 ve.n87
    , n88 = f va.n88 vb.n88 vc.n88 vd.n88 ve.n88
    , n89 = f va.n89 vb.n89 vc.n89 vd.n89 ve.n89
    , n90 = f va.n90 vb.n90 vc.n90 vd.n90 ve.n90
    , n91 = f va.n91 vb.n91 vc.n91 vd.n91 ve.n91
    , n92 = f va.n92 vb.n92 vc.n92 vd.n92 ve.n92
    , n93 = f va.n93 vb.n93 vc.n93 vd.n93 ve.n93
    , n94 = f va.n94 vb.n94 vc.n94 vd.n94 ve.n94
    , n95 = f va.n95 vb.n95 vc.n95 vd.n95 ve.n95
    , n96 = f va.n96 vb.n96 vc.n96 vd.n96 ve.n96
    }
        |> Vector


{-| Transform just one particular item at a particular `Index`
-}
mapItem : Index -> (a -> a) -> Vector97 a -> Vector97 a
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

        Index34 ->
            Vector { vector | n34 = mapper vector.n34 }

        Index35 ->
            Vector { vector | n35 = mapper vector.n35 }

        Index36 ->
            Vector { vector | n36 = mapper vector.n36 }

        Index37 ->
            Vector { vector | n37 = mapper vector.n37 }

        Index38 ->
            Vector { vector | n38 = mapper vector.n38 }

        Index39 ->
            Vector { vector | n39 = mapper vector.n39 }

        Index40 ->
            Vector { vector | n40 = mapper vector.n40 }

        Index41 ->
            Vector { vector | n41 = mapper vector.n41 }

        Index42 ->
            Vector { vector | n42 = mapper vector.n42 }

        Index43 ->
            Vector { vector | n43 = mapper vector.n43 }

        Index44 ->
            Vector { vector | n44 = mapper vector.n44 }

        Index45 ->
            Vector { vector | n45 = mapper vector.n45 }

        Index46 ->
            Vector { vector | n46 = mapper vector.n46 }

        Index47 ->
            Vector { vector | n47 = mapper vector.n47 }

        Index48 ->
            Vector { vector | n48 = mapper vector.n48 }

        Index49 ->
            Vector { vector | n49 = mapper vector.n49 }

        Index50 ->
            Vector { vector | n50 = mapper vector.n50 }

        Index51 ->
            Vector { vector | n51 = mapper vector.n51 }

        Index52 ->
            Vector { vector | n52 = mapper vector.n52 }

        Index53 ->
            Vector { vector | n53 = mapper vector.n53 }

        Index54 ->
            Vector { vector | n54 = mapper vector.n54 }

        Index55 ->
            Vector { vector | n55 = mapper vector.n55 }

        Index56 ->
            Vector { vector | n56 = mapper vector.n56 }

        Index57 ->
            Vector { vector | n57 = mapper vector.n57 }

        Index58 ->
            Vector { vector | n58 = mapper vector.n58 }

        Index59 ->
            Vector { vector | n59 = mapper vector.n59 }

        Index60 ->
            Vector { vector | n60 = mapper vector.n60 }

        Index61 ->
            Vector { vector | n61 = mapper vector.n61 }

        Index62 ->
            Vector { vector | n62 = mapper vector.n62 }

        Index63 ->
            Vector { vector | n63 = mapper vector.n63 }

        Index64 ->
            Vector { vector | n64 = mapper vector.n64 }

        Index65 ->
            Vector { vector | n65 = mapper vector.n65 }

        Index66 ->
            Vector { vector | n66 = mapper vector.n66 }

        Index67 ->
            Vector { vector | n67 = mapper vector.n67 }

        Index68 ->
            Vector { vector | n68 = mapper vector.n68 }

        Index69 ->
            Vector { vector | n69 = mapper vector.n69 }

        Index70 ->
            Vector { vector | n70 = mapper vector.n70 }

        Index71 ->
            Vector { vector | n71 = mapper vector.n71 }

        Index72 ->
            Vector { vector | n72 = mapper vector.n72 }

        Index73 ->
            Vector { vector | n73 = mapper vector.n73 }

        Index74 ->
            Vector { vector | n74 = mapper vector.n74 }

        Index75 ->
            Vector { vector | n75 = mapper vector.n75 }

        Index76 ->
            Vector { vector | n76 = mapper vector.n76 }

        Index77 ->
            Vector { vector | n77 = mapper vector.n77 }

        Index78 ->
            Vector { vector | n78 = mapper vector.n78 }

        Index79 ->
            Vector { vector | n79 = mapper vector.n79 }

        Index80 ->
            Vector { vector | n80 = mapper vector.n80 }

        Index81 ->
            Vector { vector | n81 = mapper vector.n81 }

        Index82 ->
            Vector { vector | n82 = mapper vector.n82 }

        Index83 ->
            Vector { vector | n83 = mapper vector.n83 }

        Index84 ->
            Vector { vector | n84 = mapper vector.n84 }

        Index85 ->
            Vector { vector | n85 = mapper vector.n85 }

        Index86 ->
            Vector { vector | n86 = mapper vector.n86 }

        Index87 ->
            Vector { vector | n87 = mapper vector.n87 }

        Index88 ->
            Vector { vector | n88 = mapper vector.n88 }

        Index89 ->
            Vector { vector | n89 = mapper vector.n89 }

        Index90 ->
            Vector { vector | n90 = mapper vector.n90 }

        Index91 ->
            Vector { vector | n91 = mapper vector.n91 }

        Index92 ->
            Vector { vector | n92 = mapper vector.n92 }

        Index93 ->
            Vector { vector | n93 = mapper vector.n93 }

        Index94 ->
            Vector { vector | n94 = mapper vector.n94 }

        Index95 ->
            Vector { vector | n95 = mapper vector.n95 }

        Index96 ->
            Vector { vector | n96 = mapper vector.n96 }


{-| Convert a `Vector97 a` into a `List a` of length 97
-}
toList : Vector97 a -> List a
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
    , vector.n34
    , vector.n35
    , vector.n36
    , vector.n37
    , vector.n38
    , vector.n39
    , vector.n40
    , vector.n41
    , vector.n42
    , vector.n43
    , vector.n44
    , vector.n45
    , vector.n46
    , vector.n47
    , vector.n48
    , vector.n49
    , vector.n50
    , vector.n51
    , vector.n52
    , vector.n53
    , vector.n54
    , vector.n55
    , vector.n56
    , vector.n57
    , vector.n58
    , vector.n59
    , vector.n60
    , vector.n61
    , vector.n62
    , vector.n63
    , vector.n64
    , vector.n65
    , vector.n66
    , vector.n67
    , vector.n68
    , vector.n69
    , vector.n70
    , vector.n71
    , vector.n72
    , vector.n73
    , vector.n74
    , vector.n75
    , vector.n76
    , vector.n77
    , vector.n78
    , vector.n79
    , vector.n80
    , vector.n81
    , vector.n82
    , vector.n83
    , vector.n84
    , vector.n85
    , vector.n86
    , vector.n87
    , vector.n88
    , vector.n89
    , vector.n90
    , vector.n91
    , vector.n92
    , vector.n93
    , vector.n94
    , vector.n95
    , vector.n96
    ]


{-| Turn a `List a` into a `Vector97 a`. If there are not enough items in the `List a`, then this function returns `Nothing`. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromList []
    --> Nothing

    Vector3.fromList [ 1 ]
    --> Nothing

    Vector3.fromList [ 5, 6, 7, 8 ]
    --> Just ([ 8 ], Vector3.from3 5 6 7)

-}
fromList : List a -> Maybe ( List a, Vector97 a )
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
        |> andAnother
        |> andAnother
        |> andAnother
        |> andAnother
        |> Maybe.map (Tuple.mapSecond Vector)


{-| Turn a `List a` into a `Vector97 a`. If there are not enough items in the `List a`, then fill in the remaining spots with a default value. The extra items in the input list, if there are any, is returned as the first element in the output tuple.

    Vector3.fromListWithDefault 1 []
    --> ([] ,Vector3.from3 1 1 1)

    Vector3.fromListWithDefault 2 [ 1 ]
    --> ([], Vector3.from3 1 2 2)

    Vector3.fromListWithDefault 2 [ 5, 6, 7, 8 ]
    --> ([ 8 ], Vector3.from3 5 6 7)

-}
fromListWithDefault : a -> List a -> ( List a, Vector97 a )
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
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> andAnotherSafe
        |> finishOffAndAnotherSafe
        |> Tuple.mapSecond Vector


{-| Turn a `Vector97 a` elm into a list, where each element is paired with its `Index`
-}
toIndexedList : Vector97 a -> List ( Index, a )
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
    , ( Index25, vector.n25 )
    , ( Index26, vector.n26 )
    , ( Index27, vector.n27 )
    , ( Index28, vector.n28 )
    , ( Index29, vector.n29 )
    , ( Index30, vector.n30 )
    , ( Index31, vector.n31 )
    , ( Index32, vector.n32 )
    , ( Index33, vector.n33 )
    , ( Index34, vector.n34 )
    , ( Index35, vector.n35 )
    , ( Index36, vector.n36 )
    , ( Index37, vector.n37 )
    , ( Index38, vector.n38 )
    , ( Index39, vector.n39 )
    , ( Index40, vector.n40 )
    , ( Index41, vector.n41 )
    , ( Index42, vector.n42 )
    , ( Index43, vector.n43 )
    , ( Index44, vector.n44 )
    , ( Index45, vector.n45 )
    , ( Index46, vector.n46 )
    , ( Index47, vector.n47 )
    , ( Index48, vector.n48 )
    , ( Index49, vector.n49 )
    , ( Index50, vector.n50 )
    , ( Index51, vector.n51 )
    , ( Index52, vector.n52 )
    , ( Index53, vector.n53 )
    , ( Index54, vector.n54 )
    , ( Index55, vector.n55 )
    , ( Index56, vector.n56 )
    , ( Index57, vector.n57 )
    , ( Index58, vector.n58 )
    , ( Index59, vector.n59 )
    , ( Index60, vector.n60 )
    , ( Index61, vector.n61 )
    , ( Index62, vector.n62 )
    , ( Index63, vector.n63 )
    , ( Index64, vector.n64 )
    , ( Index65, vector.n65 )
    , ( Index66, vector.n66 )
    , ( Index67, vector.n67 )
    , ( Index68, vector.n68 )
    , ( Index69, vector.n69 )
    , ( Index70, vector.n70 )
    , ( Index71, vector.n71 )
    , ( Index72, vector.n72 )
    , ( Index73, vector.n73 )
    , ( Index74, vector.n74 )
    , ( Index75, vector.n75 )
    , ( Index76, vector.n76 )
    , ( Index77, vector.n77 )
    , ( Index78, vector.n78 )
    , ( Index79, vector.n79 )
    , ( Index80, vector.n80 )
    , ( Index81, vector.n81 )
    , ( Index82, vector.n82 )
    , ( Index83, vector.n83 )
    , ( Index84, vector.n84 )
    , ( Index85, vector.n85 )
    , ( Index86, vector.n86 )
    , ( Index87, vector.n87 )
    , ( Index88, vector.n88 )
    , ( Index89, vector.n89 )
    , ( Index90, vector.n90 )
    , ( Index91, vector.n91 )
    , ( Index92, vector.n92 )
    , ( Index93, vector.n93 )
    , ( Index94, vector.n94 )
    , ( Index95, vector.n95 )
    , ( Index96, vector.n96 )
    ]


{-| a `Vector97 a` using a function that takes an `Int`, representing the index
-}
initializeFromInt : (Int -> a) -> Vector97 a
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
    , n34 = f 34
    , n35 = f 35
    , n36 = f 36
    , n37 = f 37
    , n38 = f 38
    , n39 = f 39
    , n40 = f 40
    , n41 = f 41
    , n42 = f 42
    , n43 = f 43
    , n44 = f 44
    , n45 = f 45
    , n46 = f 46
    , n47 = f 47
    , n48 = f 48
    , n49 = f 49
    , n50 = f 50
    , n51 = f 51
    , n52 = f 52
    , n53 = f 53
    , n54 = f 54
    , n55 = f 55
    , n56 = f 56
    , n57 = f 57
    , n58 = f 58
    , n59 = f 59
    , n60 = f 60
    , n61 = f 61
    , n62 = f 62
    , n63 = f 63
    , n64 = f 64
    , n65 = f 65
    , n66 = f 66
    , n67 = f 67
    , n68 = f 68
    , n69 = f 69
    , n70 = f 70
    , n71 = f 71
    , n72 = f 72
    , n73 = f 73
    , n74 = f 74
    , n75 = f 75
    , n76 = f 76
    , n77 = f 77
    , n78 = f 78
    , n79 = f 79
    , n80 = f 80
    , n81 = f 81
    , n82 = f 82
    , n83 = f 83
    , n84 = f 84
    , n85 = f 85
    , n86 = f 86
    , n87 = f 87
    , n88 = f 88
    , n89 = f 89
    , n90 = f 90
    , n91 = f 91
    , n92 = f 92
    , n93 = f 93
    , n94 = f 94
    , n95 = f 95
    , n96 = f 96
    }
        |> Vector


{-| Make a `Vector97 a` using a function that takes an `Index`
-}
initializeFromIndex : (Index -> a) -> Vector97 a
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
    , n34 = f Index34
    , n35 = f Index35
    , n36 = f Index36
    , n37 = f Index37
    , n38 = f Index38
    , n39 = f Index39
    , n40 = f Index40
    , n41 = f Index41
    , n42 = f Index42
    , n43 = f Index43
    , n44 = f Index44
    , n45 = f Index45
    , n46 = f Index46
    , n47 = f Index47
    , n48 = f Index48
    , n49 = f Index49
    , n50 = f Index50
    , n51 = f Index51
    , n52 = f Index52
    , n53 = f Index53
    , n54 = f Index54
    , n55 = f Index55
    , n56 = f Index56
    , n57 = f Index57
    , n58 = f Index58
    , n59 = f Index59
    , n60 = f Index60
    , n61 = f Index61
    , n62 = f Index62
    , n63 = f Index63
    , n64 = f Index64
    , n65 = f Index65
    , n66 = f Index66
    , n67 = f Index67
    , n68 = f Index68
    , n69 = f Index69
    , n70 = f Index70
    , n71 = f Index71
    , n72 = f Index72
    , n73 = f Index73
    , n74 = f Index74
    , n75 = f Index75
    , n76 = f Index76
    , n77 = f Index77
    , n78 = f Index78
    , n79 = f Index79
    , n80 = f Index80
    , n81 = f Index81
    , n82 = f Index82
    , n83 = f Index83
    , n84 = f Index84
    , n85 = f Index85
    , n86 = f Index86
    , n87 = f Index87
    , n88 = f Index88
    , n89 = f Index89
    , n90 = f Index90
    , n91 = f Index91
    , n92 = f Index92
    , n93 = f Index93
    , n94 = f Index94
    , n95 = f Index95
    , n96 = f Index96
    }
        |> Vector


{-| a `Vector97 a` filled with just one item repeated over and over again.
-}
repeat : a -> Vector97 a
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
    , n34 = a
    , n35 = a
    , n36 = a
    , n37 = a
    , n38 = a
    , n39 = a
    , n40 = a
    , n41 = a
    , n42 = a
    , n43 = a
    , n44 = a
    , n45 = a
    , n46 = a
    , n47 = a
    , n48 = a
    , n49 = a
    , n50 = a
    , n51 = a
    , n52 = a
    , n53 = a
    , n54 = a
    , n55 = a
    , n56 = a
    , n57 = a
    , n58 = a
    , n59 = a
    , n60 = a
    , n61 = a
    , n62 = a
    , n63 = a
    , n64 = a
    , n65 = a
    , n66 = a
    , n67 = a
    , n68 = a
    , n69 = a
    , n70 = a
    , n71 = a
    , n72 = a
    , n73 = a
    , n74 = a
    , n75 = a
    , n76 = a
    , n77 = a
    , n78 = a
    , n79 = a
    , n80 = a
    , n81 = a
    , n82 = a
    , n83 = a
    , n84 = a
    , n85 = a
    , n86 = a
    , n87 = a
    , n88 = a
    , n89 = a
    , n90 = a
    , n91 = a
    , n92 = a
    , n93 = a
    , n94 = a
    , n95 = a
    , n96 = a
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

        Index34 ->
            34

        Index35 ->
            35

        Index36 ->
            36

        Index37 ->
            37

        Index38 ->
            38

        Index39 ->
            39

        Index40 ->
            40

        Index41 ->
            41

        Index42 ->
            42

        Index43 ->
            43

        Index44 ->
            44

        Index45 ->
            45

        Index46 ->
            46

        Index47 ->
            47

        Index48 ->
            48

        Index49 ->
            49

        Index50 ->
            50

        Index51 ->
            51

        Index52 ->
            52

        Index53 ->
            53

        Index54 ->
            54

        Index55 ->
            55

        Index56 ->
            56

        Index57 ->
            57

        Index58 ->
            58

        Index59 ->
            59

        Index60 ->
            60

        Index61 ->
            61

        Index62 ->
            62

        Index63 ->
            63

        Index64 ->
            64

        Index65 ->
            65

        Index66 ->
            66

        Index67 ->
            67

        Index68 ->
            68

        Index69 ->
            69

        Index70 ->
            70

        Index71 ->
            71

        Index72 ->
            72

        Index73 ->
            73

        Index74 ->
            74

        Index75 ->
            75

        Index76 ->
            76

        Index77 ->
            77

        Index78 ->
            78

        Index79 ->
            79

        Index80 ->
            80

        Index81 ->
            81

        Index82 ->
            82

        Index83 ->
            83

        Index84 ->
            84

        Index85 ->
            85

        Index86 ->
            86

        Index87 ->
            87

        Index88 ->
            88

        Index89 ->
            89

        Index90 ->
            90

        Index91 ->
            91

        Index92 ->
            92

        Index93 ->
            93

        Index94 ->
            94

        Index95 ->
            95

        Index96 ->
            96


{-| Try and turn an `Int` into an `Index`, returning `Nothing` if the `Int` is above the maximum index, or below the zero index, of this `Vector97 a`

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

        34 ->
            Just Index34

        35 ->
            Just Index35

        36 ->
            Just Index36

        37 ->
            Just Index37

        38 ->
            Just Index38

        39 ->
            Just Index39

        40 ->
            Just Index40

        41 ->
            Just Index41

        42 ->
            Just Index42

        43 ->
            Just Index43

        44 ->
            Just Index44

        45 ->
            Just Index45

        46 ->
            Just Index46

        47 ->
            Just Index47

        48 ->
            Just Index48

        49 ->
            Just Index49

        50 ->
            Just Index50

        51 ->
            Just Index51

        52 ->
            Just Index52

        53 ->
            Just Index53

        54 ->
            Just Index54

        55 ->
            Just Index55

        56 ->
            Just Index56

        57 ->
            Just Index57

        58 ->
            Just Index58

        59 ->
            Just Index59

        60 ->
            Just Index60

        61 ->
            Just Index61

        62 ->
            Just Index62

        63 ->
            Just Index63

        64 ->
            Just Index64

        65 ->
            Just Index65

        66 ->
            Just Index66

        67 ->
            Just Index67

        68 ->
            Just Index68

        69 ->
            Just Index69

        70 ->
            Just Index70

        71 ->
            Just Index71

        72 ->
            Just Index72

        73 ->
            Just Index73

        74 ->
            Just Index74

        75 ->
            Just Index75

        76 ->
            Just Index76

        77 ->
            Just Index77

        78 ->
            Just Index78

        79 ->
            Just Index79

        80 ->
            Just Index80

        81 ->
            Just Index81

        82 ->
            Just Index82

        83 ->
            Just Index83

        84 ->
            Just Index84

        85 ->
            Just Index85

        86 ->
            Just Index86

        87 ->
            Just Index87

        88 ->
            Just Index88

        89 ->
            Just Index89

        90 ->
            Just Index90

        91 ->
            Just Index91

        92 ->
            Just Index92

        93 ->
            Just Index93

        94 ->
            Just Index94

        95 ->
            Just Index95

        96 ->
            Just Index96

        _ ->
            Nothing


{-| a `Vector97 a` from 97 elements
-}
from97 : a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> a -> Vector97 a
from97 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35 a36 a37 a38 a39 a40 a41 a42 a43 a44 a45 a46 a47 a48 a49 a50 a51 a52 a53 a54 a55 a56 a57 a58 a59 a60 a61 a62 a63 a64 a65 a66 a67 a68 a69 a70 a71 a72 a73 a74 a75 a76 a77 a78 a79 a80 a81 a82 a83 a84 a85 a86 a87 a88 a89 a90 a91 a92 a93 a94 a95 a96 =
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
    , n34 = a34
    , n35 = a35
    , n36 = a36
    , n37 = a37
    , n38 = a38
    , n39 = a39
    , n40 = a40
    , n41 = a41
    , n42 = a42
    , n43 = a43
    , n44 = a44
    , n45 = a45
    , n46 = a46
    , n47 = a47
    , n48 = a48
    , n49 = a49
    , n50 = a50
    , n51 = a51
    , n52 = a52
    , n53 = a53
    , n54 = a54
    , n55 = a55
    , n56 = a56
    , n57 = a57
    , n58 = a58
    , n59 = a59
    , n60 = a60
    , n61 = a61
    , n62 = a62
    , n63 = a63
    , n64 = a64
    , n65 = a65
    , n66 = a66
    , n67 = a67
    , n68 = a68
    , n69 = a69
    , n70 = a70
    , n71 = a71
    , n72 = a72
    , n73 = a73
    , n74 = a74
    , n75 = a75
    , n76 = a76
    , n77 = a77
    , n78 = a78
    , n79 = a79
    , n80 = a80
    , n81 = a81
    , n82 = a82
    , n83 = a83
    , n84 = a84
    , n85 = a85
    , n86 = a86
    , n87 = a87
    , n88 = a88
    , n89 = a89
    , n90 = a90
    , n91 = a91
    , n92 = a92
    , n93 = a93
    , n94 = a94
    , n95 = a95
    , n96 = a96
    }
        |> Vector


{-| See if a Vector97 a contains a value
-}
member : a -> Vector97 a -> Bool
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
        || a
        == vector.n25
        || a
        == vector.n26
        || a
        == vector.n27
        || a
        == vector.n28
        || a
        == vector.n29
        || a
        == vector.n30
        || a
        == vector.n31
        || a
        == vector.n32
        || a
        == vector.n33
        || a
        == vector.n34
        || a
        == vector.n35
        || a
        == vector.n36
        || a
        == vector.n37
        || a
        == vector.n38
        || a
        == vector.n39
        || a
        == vector.n40
        || a
        == vector.n41
        || a
        == vector.n42
        || a
        == vector.n43
        || a
        == vector.n44
        || a
        == vector.n45
        || a
        == vector.n46
        || a
        == vector.n47
        || a
        == vector.n48
        || a
        == vector.n49
        || a
        == vector.n50
        || a
        == vector.n51
        || a
        == vector.n52
        || a
        == vector.n53
        || a
        == vector.n54
        || a
        == vector.n55
        || a
        == vector.n56
        || a
        == vector.n57
        || a
        == vector.n58
        || a
        == vector.n59
        || a
        == vector.n60
        || a
        == vector.n61
        || a
        == vector.n62
        || a
        == vector.n63
        || a
        == vector.n64
        || a
        == vector.n65
        || a
        == vector.n66
        || a
        == vector.n67
        || a
        == vector.n68
        || a
        == vector.n69
        || a
        == vector.n70
        || a
        == vector.n71
        || a
        == vector.n72
        || a
        == vector.n73
        || a
        == vector.n74
        || a
        == vector.n75
        || a
        == vector.n76
        || a
        == vector.n77
        || a
        == vector.n78
        || a
        == vector.n79
        || a
        == vector.n80
        || a
        == vector.n81
        || a
        == vector.n82
        || a
        == vector.n83
        || a
        == vector.n84
        || a
        == vector.n85
        || a
        == vector.n86
        || a
        == vector.n87
        || a
        == vector.n88
        || a
        == vector.n89
        || a
        == vector.n90
        || a
        == vector.n91
        || a
        == vector.n92
        || a
        == vector.n93
        || a
        == vector.n94
        || a
        == vector.n95
        || a
        == vector.n96


{-| Reverse the order of the items in a `Vector97 a`
-}
reverse : Vector97 a -> Vector97 a
reverse (Vector vector) =
    { n0 = vector.n96
    , n1 = vector.n95
    , n2 = vector.n94
    , n3 = vector.n93
    , n4 = vector.n92
    , n5 = vector.n91
    , n6 = vector.n90
    , n7 = vector.n89
    , n8 = vector.n88
    , n9 = vector.n87
    , n10 = vector.n86
    , n11 = vector.n85
    , n12 = vector.n84
    , n13 = vector.n83
    , n14 = vector.n82
    , n15 = vector.n81
    , n16 = vector.n80
    , n17 = vector.n79
    , n18 = vector.n78
    , n19 = vector.n77
    , n20 = vector.n76
    , n21 = vector.n75
    , n22 = vector.n74
    , n23 = vector.n73
    , n24 = vector.n72
    , n25 = vector.n71
    , n26 = vector.n70
    , n27 = vector.n69
    , n28 = vector.n68
    , n29 = vector.n67
    , n30 = vector.n66
    , n31 = vector.n65
    , n32 = vector.n64
    , n33 = vector.n63
    , n34 = vector.n62
    , n35 = vector.n61
    , n36 = vector.n60
    , n37 = vector.n59
    , n38 = vector.n58
    , n39 = vector.n57
    , n40 = vector.n56
    , n41 = vector.n55
    , n42 = vector.n54
    , n43 = vector.n53
    , n44 = vector.n52
    , n45 = vector.n51
    , n46 = vector.n50
    , n47 = vector.n49
    , n48 = vector.n48
    , n49 = vector.n47
    , n50 = vector.n46
    , n51 = vector.n45
    , n52 = vector.n44
    , n53 = vector.n43
    , n54 = vector.n42
    , n55 = vector.n41
    , n56 = vector.n40
    , n57 = vector.n39
    , n58 = vector.n38
    , n59 = vector.n37
    , n60 = vector.n36
    , n61 = vector.n35
    , n62 = vector.n34
    , n63 = vector.n33
    , n64 = vector.n32
    , n65 = vector.n31
    , n66 = vector.n30
    , n67 = vector.n29
    , n68 = vector.n28
    , n69 = vector.n27
    , n70 = vector.n26
    , n71 = vector.n25
    , n72 = vector.n24
    , n73 = vector.n23
    , n74 = vector.n22
    , n75 = vector.n21
    , n76 = vector.n20
    , n77 = vector.n19
    , n78 = vector.n18
    , n79 = vector.n17
    , n80 = vector.n16
    , n81 = vector.n15
    , n82 = vector.n14
    , n83 = vector.n13
    , n84 = vector.n12
    , n85 = vector.n11
    , n86 = vector.n10
    , n87 = vector.n9
    , n88 = vector.n8
    , n89 = vector.n7
    , n90 = vector.n6
    , n91 = vector.n5
    , n92 = vector.n4
    , n93 = vector.n3
    , n94 = vector.n2
    , n95 = vector.n1
    , n96 = vector.n0
    }
        |> Vector


{-| The length of this vector type, which is 97
-}
length : Int
length =
    97


{-| Break a `List a` down into groups of `Vector97 a`. The output is a tuple, where the left side is a list of the remainder.

    Vector3.group [ 1, 2, 3 ]
    --> ([] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4 ]
    --> ([ 4 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5 ]
    --> ([ 4, 5 ] , [ Vector3.from3 1 2 3 ])

    Vector3.group [ 1, 2, 3, 4, 5, 6 ]
    --> ([] , [ Vector3.from3 1 2 3, Vector3.from3 4 5 6 ])

-}
group : List a -> ( List a, List (Vector97 a) )
group items =
    groupHelp items []


groupHelp : List a -> List (Vector97 a) -> ( List a, List (Vector97 a) )
groupHelp remainingItems output =
    case remainingItems of
        i0 :: i1 :: i2 :: i3 :: i4 :: i5 :: i6 :: i7 :: i8 :: i9 :: i10 :: i11 :: i12 :: i13 :: i14 :: i15 :: i16 :: i17 :: i18 :: i19 :: i20 :: i21 :: i22 :: i23 :: i24 :: i25 :: i26 :: i27 :: i28 :: i29 :: i30 :: i31 :: i32 :: i33 :: i34 :: i35 :: i36 :: i37 :: i38 :: i39 :: i40 :: i41 :: i42 :: i43 :: i44 :: i45 :: i46 :: i47 :: i48 :: i49 :: i50 :: i51 :: i52 :: i53 :: i54 :: i55 :: i56 :: i57 :: i58 :: i59 :: i60 :: i61 :: i62 :: i63 :: i64 :: i65 :: i66 :: i67 :: i68 :: i69 :: i70 :: i71 :: i72 :: i73 :: i74 :: i75 :: i76 :: i77 :: i78 :: i79 :: i80 :: i81 :: i82 :: i83 :: i84 :: i85 :: i86 :: i87 :: i88 :: i89 :: i90 :: i91 :: i92 :: i93 :: i94 :: i95 :: i96 :: rest ->
            groupHelp rest (from97 i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 i11 i12 i13 i14 i15 i16 i17 i18 i19 i20 i21 i22 i23 i24 i25 i26 i27 i28 i29 i30 i31 i32 i33 i34 i35 i36 i37 i38 i39 i40 i41 i42 i43 i44 i45 i46 i47 i48 i49 i50 i51 i52 i53 i54 i55 i56 i57 i58 i59 i60 i61 i62 i63 i64 i65 i66 i67 i68 i69 i70 i71 i72 i73 i74 i75 i76 i77 i78 i79 i80 i81 i82 i83 i84 i85 i86 i87 i88 i89 i90 i91 i92 i93 i94 i95 i96 :: output)

        _ ->
            ( remainingItems, List.reverse output )


{-| A list of all the indices, from 0 to 96
-}
indices : Vector97 Index
indices =
    initializeFromIndex identity


{-| Add an element to the end of a `Vector97 a`, incrementing its size by 1

    Vector4.push 4 (Vector4.from4 0 1 2 3)
    --> Vector5.from5 0 1 2 3 4

-}
push : a -> Vector97 a -> Vector98.Vector98 a
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
    , n34 = vector.n34
    , n35 = vector.n35
    , n36 = vector.n36
    , n37 = vector.n37
    , n38 = vector.n38
    , n39 = vector.n39
    , n40 = vector.n40
    , n41 = vector.n41
    , n42 = vector.n42
    , n43 = vector.n43
    , n44 = vector.n44
    , n45 = vector.n45
    , n46 = vector.n46
    , n47 = vector.n47
    , n48 = vector.n48
    , n49 = vector.n49
    , n50 = vector.n50
    , n51 = vector.n51
    , n52 = vector.n52
    , n53 = vector.n53
    , n54 = vector.n54
    , n55 = vector.n55
    , n56 = vector.n56
    , n57 = vector.n57
    , n58 = vector.n58
    , n59 = vector.n59
    , n60 = vector.n60
    , n61 = vector.n61
    , n62 = vector.n62
    , n63 = vector.n63
    , n64 = vector.n64
    , n65 = vector.n65
    , n66 = vector.n66
    , n67 = vector.n67
    , n68 = vector.n68
    , n69 = vector.n69
    , n70 = vector.n70
    , n71 = vector.n71
    , n72 = vector.n72
    , n73 = vector.n73
    , n74 = vector.n74
    , n75 = vector.n75
    , n76 = vector.n76
    , n77 = vector.n77
    , n78 = vector.n78
    , n79 = vector.n79
    , n80 = vector.n80
    , n81 = vector.n81
    , n82 = vector.n82
    , n83 = vector.n83
    , n84 = vector.n84
    , n85 = vector.n85
    , n86 = vector.n86
    , n87 = vector.n87
    , n88 = vector.n88
    , n89 = vector.n89
    , n90 = vector.n90
    , n91 = vector.n91
    , n92 = vector.n92
    , n93 = vector.n93
    , n94 = vector.n94
    , n95 = vector.n95
    , n96 = vector.n96
    , n97 = a
    }
        |> Vector98.Vector


{-| Separate a `Vector97 a` into its last element and everything else.

    Vector4.pop (Vector4.from4 0 1 2 3)
    --> (Vector3.from3 0 1 2, 3)

-}
pop : Vector97 a -> ( Vector96.Vector96 a, a )
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
      , n34 = vector.n34
      , n35 = vector.n35
      , n36 = vector.n36
      , n37 = vector.n37
      , n38 = vector.n38
      , n39 = vector.n39
      , n40 = vector.n40
      , n41 = vector.n41
      , n42 = vector.n42
      , n43 = vector.n43
      , n44 = vector.n44
      , n45 = vector.n45
      , n46 = vector.n46
      , n47 = vector.n47
      , n48 = vector.n48
      , n49 = vector.n49
      , n50 = vector.n50
      , n51 = vector.n51
      , n52 = vector.n52
      , n53 = vector.n53
      , n54 = vector.n54
      , n55 = vector.n55
      , n56 = vector.n56
      , n57 = vector.n57
      , n58 = vector.n58
      , n59 = vector.n59
      , n60 = vector.n60
      , n61 = vector.n61
      , n62 = vector.n62
      , n63 = vector.n63
      , n64 = vector.n64
      , n65 = vector.n65
      , n66 = vector.n66
      , n67 = vector.n67
      , n68 = vector.n68
      , n69 = vector.n69
      , n70 = vector.n70
      , n71 = vector.n71
      , n72 = vector.n72
      , n73 = vector.n73
      , n74 = vector.n74
      , n75 = vector.n75
      , n76 = vector.n76
      , n77 = vector.n77
      , n78 = vector.n78
      , n79 = vector.n79
      , n80 = vector.n80
      , n81 = vector.n81
      , n82 = vector.n82
      , n83 = vector.n83
      , n84 = vector.n84
      , n85 = vector.n85
      , n86 = vector.n86
      , n87 = vector.n87
      , n88 = vector.n88
      , n89 = vector.n89
      , n90 = vector.n90
      , n91 = vector.n91
      , n92 = vector.n92
      , n93 = vector.n93
      , n94 = vector.n94
      , n95 = vector.n95
      }
        |> Vector96.Vector
    , vector.n96
    )


{-| Split a `Vector97 a` into its first element and the rest

    Vector4.uncons (Vector4.from4 0 1 2 3)
    --> (0, Vector3.from3 1 2 3)

-}
uncons : Vector97 a -> ( a, Vector96.Vector96 a )
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
      , n24 = vector.n25
      , n25 = vector.n26
      , n26 = vector.n27
      , n27 = vector.n28
      , n28 = vector.n29
      , n29 = vector.n30
      , n30 = vector.n31
      , n31 = vector.n32
      , n32 = vector.n33
      , n33 = vector.n34
      , n34 = vector.n35
      , n35 = vector.n36
      , n36 = vector.n37
      , n37 = vector.n38
      , n38 = vector.n39
      , n39 = vector.n40
      , n40 = vector.n41
      , n41 = vector.n42
      , n42 = vector.n43
      , n43 = vector.n44
      , n44 = vector.n45
      , n45 = vector.n46
      , n46 = vector.n47
      , n47 = vector.n48
      , n48 = vector.n49
      , n49 = vector.n50
      , n50 = vector.n51
      , n51 = vector.n52
      , n52 = vector.n53
      , n53 = vector.n54
      , n54 = vector.n55
      , n55 = vector.n56
      , n56 = vector.n57
      , n57 = vector.n58
      , n58 = vector.n59
      , n59 = vector.n60
      , n60 = vector.n61
      , n61 = vector.n62
      , n62 = vector.n63
      , n63 = vector.n64
      , n64 = vector.n65
      , n65 = vector.n66
      , n66 = vector.n67
      , n67 = vector.n68
      , n68 = vector.n69
      , n69 = vector.n70
      , n70 = vector.n71
      , n71 = vector.n72
      , n72 = vector.n73
      , n73 = vector.n74
      , n74 = vector.n75
      , n75 = vector.n76
      , n76 = vector.n77
      , n77 = vector.n78
      , n78 = vector.n79
      , n79 = vector.n80
      , n80 = vector.n81
      , n81 = vector.n82
      , n82 = vector.n83
      , n83 = vector.n84
      , n84 = vector.n85
      , n85 = vector.n86
      , n86 = vector.n87
      , n87 = vector.n88
      , n88 = vector.n89
      , n89 = vector.n90
      , n90 = vector.n91
      , n91 = vector.n92
      , n92 = vector.n93
      , n93 = vector.n94
      , n94 = vector.n95
      , n95 = vector.n96
      }
        |> Vector96.Vector
    )


{-| Add an element to the front of a vector, incrementing the vector size by 1

    Vector4.cons -1 (Vector4.from4 0 1 2 3)
    --> Vector5.from5 -1 0 1 2 3

-}
cons : a -> Vector97 a -> Vector98.Vector98 a
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
    , n35 = vector.n34
    , n36 = vector.n35
    , n37 = vector.n36
    , n38 = vector.n37
    , n39 = vector.n38
    , n40 = vector.n39
    , n41 = vector.n40
    , n42 = vector.n41
    , n43 = vector.n42
    , n44 = vector.n43
    , n45 = vector.n44
    , n46 = vector.n45
    , n47 = vector.n46
    , n48 = vector.n47
    , n49 = vector.n48
    , n50 = vector.n49
    , n51 = vector.n50
    , n52 = vector.n51
    , n53 = vector.n52
    , n54 = vector.n53
    , n55 = vector.n54
    , n56 = vector.n55
    , n57 = vector.n56
    , n58 = vector.n57
    , n59 = vector.n58
    , n60 = vector.n59
    , n61 = vector.n60
    , n62 = vector.n61
    , n63 = vector.n62
    , n64 = vector.n63
    , n65 = vector.n64
    , n66 = vector.n65
    , n67 = vector.n66
    , n68 = vector.n67
    , n69 = vector.n68
    , n70 = vector.n69
    , n71 = vector.n70
    , n72 = vector.n71
    , n73 = vector.n72
    , n74 = vector.n73
    , n75 = vector.n74
    , n76 = vector.n75
    , n77 = vector.n76
    , n78 = vector.n77
    , n79 = vector.n78
    , n80 = vector.n79
    , n81 = vector.n80
    , n82 = vector.n81
    , n83 = vector.n82
    , n84 = vector.n83
    , n85 = vector.n84
    , n86 = vector.n85
    , n87 = vector.n86
    , n88 = vector.n87
    , n89 = vector.n88
    , n90 = vector.n89
    , n91 = vector.n90
    , n92 = vector.n91
    , n93 = vector.n92
    , n94 = vector.n93
    , n95 = vector.n94
    , n96 = vector.n95
    , n97 = vector.n96
    }
        |> Vector98.Vector
