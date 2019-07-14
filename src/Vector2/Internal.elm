module Vector2.Internal exposing
    ( Vector(..)
    , VectorModel
    )


type Vector
    = Vector (VectorModel a)


type alias VectorModel a  =
    { n0 : a
    , n1 : a
    }