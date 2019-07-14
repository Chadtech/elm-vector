module Vector1.Internal exposing
    ( Vector(..)
    , VectorModel
    )


type Vector a
    = Vector (VectorModel a)


type alias VectorModel a  =
    { n0 : a
    }