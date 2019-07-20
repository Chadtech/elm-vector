module Vector6.Internal exposing
    ( Vector6(..)
    , VectorModel
    )


type Vector6 a
    = Vector (VectorModel a)


type alias VectorModel a =
    { n0 : a
    , n1 : a
    , n2 : a
    , n3 : a
    , n4 : a
    , n5 : a
    }
