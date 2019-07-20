module Vector1.Internal exposing
    ( Vector1(..)
    , VectorModel
    )


type Vector1 a
    = Vector (VectorModel a)


type alias VectorModel a =
    { n0 : a
    }
