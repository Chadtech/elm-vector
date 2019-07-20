module Vector2.Internal exposing
    ( Vector2(..)
    , VectorModel
    )


type Vector2 a
    = Vector (VectorModel a)


type alias VectorModel a =
    { n0 : a
    , n1 : a
    }
