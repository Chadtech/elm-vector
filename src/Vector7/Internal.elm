module Vector7.Internal exposing
    ( Vector7(..)
    , VectorModel
    )


type Vector7 a
    = Vector (VectorModel a)


type alias VectorModel a  =
    { n0 : a
    , n1 : a
    , n2 : a
    , n3 : a
    , n4 : a
    , n5 : a
    , n6 : a
    }