module Vector20.Internal exposing
    ( Vector20(..)
    , VectorModel
    )


type Vector20 a
    = Vector (VectorModel a)


type alias VectorModel a =
    { n0 : a
    , n1 : a
    , n2 : a
    , n3 : a
    , n4 : a
    , n5 : a
    , n6 : a
    , n7 : a
    , n8 : a
    , n9 : a
    , n10 : a
    , n11 : a
    , n12 : a
    , n13 : a
    , n14 : a
    , n15 : a
    , n16 : a
    , n17 : a
    , n18 : a
    , n19 : a
    }
