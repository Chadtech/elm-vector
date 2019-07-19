# Elm Vector

A vector is a collection type, kind of similar to a `List` or an `Array`, except that it has a fixed length. This fixed length means you know with certainty and type safety whether or not there is an 4th element in the vector because you know if its at least 4 elements long. A direct implication of this is the `VectorN.get` function returns an `a`, instead of a `Maybe a`.

This package exposes 59 vector modules, for vector types of length 1 to 60. Each module has an assortment of types and functions that make these vectors useful.

[Heres a demo](https://ellie-app.com/686GT6WNpWva1)

# Background

I have written this exact code many times:
```elm
type Thing = A | B | C

things = [ A, B, C ]
```
I know other people who have written that exact code many times before too. That code _definitely_ has a first, second, and third element inside `things`. We know this. But, the type system does not know this. The compiler makes us handle the case that `things` is empty whenever we work with it. 

The other day in the Elm slack, someone was making a tic tac toe game. They came across this exact same thing, since their tic tac toe board was represented as a `List (List a)` where each `List` was three items long. "What do I do about the `Nothing` case? I know the element is there."

I recommended they just handle the `Nothing` case, since its harmless and fairly effortless, and the `List` being empty is probably more likely than either of us realize, such as if there really is some `List` manipulating error in the code.

I also suggested that if _they really wanted to_, they could model their tic tac toe board like this; avoiding the `Nothing` case:

```elm
type alias Board a =
    { upperLeft : a 
    , upper : a
    , upperRight : a
    , left : a 
    , center : a
    , right : a
    , lowerLeft : a
    , lower : a
    , lowerRight : a
    }
```
Using this type would be a lot more difficult, but it would be a complete representation of the board that does not include any of these weird `Nothing` cases that we know do not exist.

**Thats when I realized**
- This type is really just a 2D vector.
- If one person- just once- made this tedious `Vector3 a` type, it could be re-used by everyone.
- With code generation, someone could generate as many vector types as they wanted, at any size.

So thats what I did. Thats what this repo is. `./builder-src/Main.hs` generates a bunch of `*.elm` vector files, of any size.