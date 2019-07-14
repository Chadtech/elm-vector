module Vector95 exposing
    ( Vector95 
    , Index(..)
    , get
    , push
    , pop
    , shift
    , unshift
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
    )


import Vector95.Internal exposing (Vector(..), VectorModel)
import Vector96.Internal as Vector96
import Vector94.Internal as Vector94
import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)


type alias Vector95 a = 
    Vector95.Internal.Vector a


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


get : Index -> Vector95 a -> a
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


map : (a -> b) -> Vector95 a -> Vector95 b
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
    }
        |> Vector


mapItem : Index -> (a -> a) -> Vector95 a -> Vector95 a
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


toList : Vector95 a -> List a
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
    ]


fromList : List a -> Maybe (List a, Vector95 a)
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



fromListWithDefault : a -> List a -> ( List a,Vector95 a)
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


toIndexedList : Vector95 a -> List (Index, a)
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
    , ( Index34, vector.n34)
    , ( Index35, vector.n35)
    , ( Index36, vector.n36)
    , ( Index37, vector.n37)
    , ( Index38, vector.n38)
    , ( Index39, vector.n39)
    , ( Index40, vector.n40)
    , ( Index41, vector.n41)
    , ( Index42, vector.n42)
    , ( Index43, vector.n43)
    , ( Index44, vector.n44)
    , ( Index45, vector.n45)
    , ( Index46, vector.n46)
    , ( Index47, vector.n47)
    , ( Index48, vector.n48)
    , ( Index49, vector.n49)
    , ( Index50, vector.n50)
    , ( Index51, vector.n51)
    , ( Index52, vector.n52)
    , ( Index53, vector.n53)
    , ( Index54, vector.n54)
    , ( Index55, vector.n55)
    , ( Index56, vector.n56)
    , ( Index57, vector.n57)
    , ( Index58, vector.n58)
    , ( Index59, vector.n59)
    , ( Index60, vector.n60)
    , ( Index61, vector.n61)
    , ( Index62, vector.n62)
    , ( Index63, vector.n63)
    , ( Index64, vector.n64)
    , ( Index65, vector.n65)
    , ( Index66, vector.n66)
    , ( Index67, vector.n67)
    , ( Index68, vector.n68)
    , ( Index69, vector.n69)
    , ( Index70, vector.n70)
    , ( Index71, vector.n71)
    , ( Index72, vector.n72)
    , ( Index73, vector.n73)
    , ( Index74, vector.n74)
    , ( Index75, vector.n75)
    , ( Index76, vector.n76)
    , ( Index77, vector.n77)
    , ( Index78, vector.n78)
    , ( Index79, vector.n79)
    , ( Index80, vector.n80)
    , ( Index81, vector.n81)
    , ( Index82, vector.n82)
    , ( Index83, vector.n83)
    , ( Index84, vector.n84)
    , ( Index85, vector.n85)
    , ( Index86, vector.n86)
    , ( Index87, vector.n87)
    , ( Index88, vector.n88)
    , ( Index89, vector.n89)
    , ( Index90, vector.n90)
    , ( Index91, vector.n91)
    , ( Index92, vector.n92)
    , ( Index93, vector.n93)
    , ( Index94, vector.n94)
    ]


initializeFromInt : (Int -> a) -> Vector95 a
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
    }
        |> Vector


initializeFromIndex : (Index -> a) -> Vector95 a
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
    }
        |> Vector


repeat : a -> Vector95 a
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

        _ ->
            Nothing


push : a -> Vector95 a -> Vector96 a
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
    , n95 = a
    }
        |> Vector96.Vector


pop : Vector95 a -> ( Vector94.Vector a, a )
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
    }
        |> Vector94.Vector
    , vector.n94
    )


shift : Vector95 a -> ( a, Vector94.Vector a )
shift (Vector vector) =
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
    }
        |> Vector94.Vector    )


unshift : a -> Vector95 a -> Vector96 a
unshift a (Vector vector) =
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
    }
        |> Vector96.Vector