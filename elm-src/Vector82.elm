module Vector82 exposing
    ( Vector82 
    , Index(..)
    , get
    , map
    , toList
    , toIndexedList
    , repeat
    )


import Vector82.Internal exposing (Vector(..))


type alias Vector82 a = 
    Vector82.Internal.Vector a


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


get : Index -> Vector82 a -> a
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


map : Index -> (a -> b) -> Vector82 a -> Vector82 b
map index mapper (Vector vector) =
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


toList : Vector82 a -> List a
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
    ]


toIndexedList : Vector82 a -> List (Index, a)
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
    ]


repeat : a -> Vector82 a
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
    }