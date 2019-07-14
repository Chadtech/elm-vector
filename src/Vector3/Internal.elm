module Vector3.Internal exposing
    ( Vector(..)
    , VectorModel
    )


type Vector
    = Vector (VectorModel a)


type alias VectorModel a  =
    { n0 : a
    , n1 : a
    , n2 : a
    }