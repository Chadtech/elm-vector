module Vector15.Internal exposing
    ( Vector15(..)
    , VectorModel
    )


type Vector15 a
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
    }
