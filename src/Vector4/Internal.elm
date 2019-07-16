module Vector4.Internal exposing
    ( Vector4(..)
    , VectorModel
    )


type Vector4 a
    = Vector (VectorModel a)


type alias VectorModel a  =
    { n0 : a
    , n1 : a
    , n2 : a
    , n3 : a
    }