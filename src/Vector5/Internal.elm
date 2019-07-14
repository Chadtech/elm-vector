module Vector5.Internal exposing
    ( Vector(..)
    , VectorModel
    )


type Vector a
    = Vector (VectorModel a)


type alias VectorModel a  =
    { n0 : a
    , n1 : a
    , n2 : a
    , n3 : a
    , n4 : a
    }