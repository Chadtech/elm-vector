module Vector3.Internal exposing
    ( Vector3(..)
    , VectorModel
    )


type Vector3 a
    = Vector (VectorModel a)


type alias VectorModel a  =
    { n0 : a
    , n1 : a
    , n2 : a
    }