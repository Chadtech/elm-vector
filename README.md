# Elm Vector

A vector is a collection type, kind of similar to a `List` or an `Array`, except that it has a fixed length. This fixed length means you know with certainty and type safety whether or not there is an 4th element in the vector because you know if its at least 4 elements long. A direct implication of this is the `VectorN.get` function doesnt return a `Maybe a`, it returns an `a`.

This package exposes 79 vector modules, for vector types of length 1 to 80. Each module has an assortment of types and functions that make these vectors useful.