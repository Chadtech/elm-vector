{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Prelude                       as P
import qualified Data.Text.Lazy.IO             as TIO
import qualified Data.Text.Lazy                as T
import           Data.Text.Lazy                 ( Text )
import qualified System.Directory              as SysDir
import qualified Data.List                     as List
import           CtBasic
import           Flow


totalVectors :: Int
totalVectors = 200


main :: P.IO ()
main = P.sequence_
  ( (TIO.writeFile "./src/Util.elm" helperModule)
  : (TIO.writeFile "./exposed-modules" exposedModules)
  : (List.map vectorFiles <| range 1 totalVectors)
  )


vectorFiles :: Int -> P.IO ()
vectorFiles n =
  let directory :: Text
      directory = T.append "./src/Vector" <| T.pack <| P.show n
  in  P.sequence_
        [ SysDir.createDirectoryIfMissing True <| T.unpack directory
        , TIO.writeFile (T.unpack <| T.append directory "/Internal.elm")
                        (internalFile n)
        , TIO.writeFile (T.unpack <| T.append directory ".elm") (module_ n)
        ]


internalFile :: Int -> Text
internalFile n =
  [internalModuleHeader n, internalVector n]
    |> T.intercalate "\n\n\n"

-- This is a way to automatically generate the list of exposed Vector 
-- modules for the elm.json. 
exposedModules :: Text
exposedModules =
  let toVectorModuleName :: Int -> Text
      toVectorModuleName i = T.concat ["\"Vector", (intToText i), "\""]
  in  T.intercalate ",\n" <| List.map toVectorModuleName (range 1 totalVectors)

helperModule :: Text
helperModule =
  [ "module Util exposing"
    , indent 1 "( andAnother"
    , indent 1 ", andAnotherSafe"
    , indent 1 ", finishOffAndAnotherSafe"
    , indent 1 ")\n\n"
    , "andAnother : Maybe (List a, a -> b) -> Maybe (List a, b)"
    , "andAnother maybeItems ="
    , indent 1 "case maybeItems of"
    , indent 2 "Just (remainingItems, f) ->"
    , indent 3 "case remainingItems of"
    , indent 4 "next :: rest ->"
    , indent 5 "Just (rest, f next)\n"
    , indent 4 "[] ->"
    , indent 5 "Nothing"
    , indent 2 "Nothing ->"
    , indent 3 "Nothing"
    , "andAnotherSafe : (a, List a, a -> b) -> (a, List a, b)"
    , "andAnotherSafe (default, items, f) ="
    , indent 1 "case items of"
    , indent 2 "next :: rest ->"
    , indent 3 "(default, rest, f next)\n"
    , indent 2 "[] ->"
    , indent 3 "(default, [], f default)"
    , "finishOffAndAnotherSafe : (a, List a, b) -> (List a, b)"
    , "finishOffAndAnotherSafe (_, second, third) ="
    , indent 1 "(second, third)"
    ]
    |> T.intercalate "\n"

module_ :: Int -> Text
module_ n =
        -- Parts in every module
  (  (  [ moduleHeader n
        , moduleDocs n
        , imports n
        , vector n
        , index n
        , nextIndex n
        , previousIndex n
        , get n
        , set n
        , foldr n
        , foldl n
        , map n
        , indexedMap n
        , map2 n
        , map3 n
        , map4 n
        , map5 n
        , mapItem n
        , toList n
        , fromList n
        , fromListWithDefault n
        , toIndexedList n
        , initialize n
        , initializeFromIndex n
        , repeat n
        , indexToInt n
        , intToIndex n
        , from n
        , member n
        , reverse n
        , length n
        , group n
        , indices n
        ]
     |> List.map Just
     )
     -- Conditional functions; functions 
     -- only used in some vector modules
    ++ [push n, pop n, uncons n, cons n]
    )
    |> onlyValues
    |> T.intercalate "\n\n\n"


onlyValues :: List (Maybe Text) -> List Text
onlyValues items = case items of
  []               -> []

  Just item : rest -> item : onlyValues rest

  Nothing   : rest -> onlyValues rest


internalModuleHeader :: Int -> Text
internalModuleHeader n =
  [ ["module ", T.append "Vector" <| intToText n, ".Internal exposing"]
      |> T.concat
    , [T.concat ["( Vector", intToText n, "(..)"], comma "VectorModel", ")"]
    |> List.map (indent 1)
    |> T.intercalate "\n"
    ]
    |> T.intercalate "\n"



moduleHeader :: Int -> Text
moduleHeader n =
  [ ["module ", T.append "Vector" <| intToText n, " exposing"] |> T.concat
    , [T.concat ["( ", vectorOf n ""]]
    ++ List.map
         comma
         -- Exports
         (  [ "Index(..)"
            , "get"
            , "foldr"
            , "foldl"
            , "map"
            , "indexedMap"
            , "set"
            , "mapItem"
            , "toList"
            , "fromList"
            , "fromListWithDefault"
            , "toIndexedList"
            , "repeat"
            , "initializeFromInt"
            , "initializeFromIndex"
            , "indexToInt"
            , "intToIndex"
            , "reverse"
            , "member"
            , "map5"
            , "nextIndex"
            , "previousIndex"
            , "map4"
            , "map3"
            , "map2"
            , "length"
            , "group"
            , "indices"
            , T.append "from" <| intToText n
            ]
         )
    -- Conditional exports, that arent
    -- in every module
    ++ ([pushImport n
    , popImport n
    , unconsImport n
    , consImport n
    ]
      |> onlyValues
      |> List.map comma)
    ++ [")"]
    |> List.map (indent 1)
    |> T.intercalate "\n"
    ]
    |> T.intercalate "\n"

pushImport :: Int -> Maybe Text
pushImport n = if n < totalVectors then Just "push" else Nothing

popImport :: Int -> Maybe Text
popImport n = if 1 < n then Just "pop" else Nothing

unconsImport :: Int -> Maybe Text
unconsImport n = if 1 < n then Just "uncons" else Nothing

consImport :: Int -> Maybe Text
consImport n = if n < totalVectors then Just "cons" else Nothing


everyGetExport :: Int -> List Text
everyGetExport n = List.map (T.append "get" <. intToText) (range 0 (n - 1))

moduleDocs :: Int -> Text
moduleDocs n =
  [ T.append "{-| A vector of length " <| intToText n
    , T.append "# Vector" <| intToText n
    , T.append "@docs Vector" <| intToText n
    , "# Creation"
    , T.concat
      [ "@docs fromList, repeat, from"
      , intToText n
      , ", fromListWithDefault, initializeFromInt, initializeFromIndex"
      ]
    , "# Index"
    , "@docs Index, get, set, indices, indexToInt, intToIndex, nextIndex, previousIndex"
    , "# Transform"
    , "@docs map, mapItem, indexedMap, foldr, foldl, map2, map3, map4, map5"
    , "# Lists"
    , "@docs toList, toIndexedList"
    , "# Methods"
    , [ "@docs"
      , if 1 < n then " pop, uncons" else ""
      , if 1 < n && n < totalVectors then ", " else ""
      , if n < totalVectors then " push, cons" else ""
      ]
      |> T.concat
    , "# Util"
    , "@docs length, reverse, member, group"
    , "-}"
    ]
    |> T.intercalate "\n\n"


imports :: Int -> Text
imports n =
  let
    importThisVectorModule :: Int -> Text
    importThisVectorModule m =
      [ "import Vector"
        , intToText m
        , ".Internal exposing (Vector"
        , intToText m
        , "(..), VectorModel)"
        ]
        |> T.concat
  in
    [ Just <| importThisVectorModule n
    , nextVectorImport n
    , previousVectorImport n
    , Just
      "import Util exposing (andAnother, andAnotherSafe, finishOffAndAnotherSafe)"
    ]
    |> onlyValues
    |> T.intercalate "\n"

nextVectorImport :: Int -> Maybe Text
nextVectorImport n = if n < totalVectors
  then
    [ "import Vector"
    , intToText (n + 1)
    , ".Internal as Vector"
    , intToText (n + 1)
    ]
    |> T.concat
    |> Just
  else Nothing

previousVectorImport :: Int -> Maybe Text
previousVectorImport n = if 1 < n
  then
    [ "import Vector"
    , intToText (n - 1)
    , ".Internal as Vector"
    , intToText (n - 1)
    ]
    |> T.concat
    |> Just
  else Nothing

vector :: Int -> Text
vector n =
  [ ["A vector that contains exactly ", intToText n, " elements"]
    |> T.concat
    |> docBrackets
    , "\ntype alias "
    , vectorOf n "a"
    , " = "
    , "\n"
    , indent 1 (T.concat ["Vector", intToText n, ".Internal.", vectorOf n "a"])
    ]
    |> T.concat



internalVector :: Int -> Text
internalVector n =
  [ "type "
    , vectorOf n "a"
    , "\n"
    , indent 1 "= Vector (VectorModel a)"
    , "\n\n\n"
    , "type alias VectorModel a "
    , " =\n"
    , indent 1 "{ "
    , List.map (T.append "n" <. prepend " : a" <. intToText) (range 0 (n - 1))
      |> T.intercalate "\n    , "
    , "\n"
    , indent 1 "}"
    ]
    |> T.concat


index :: Int -> Text
index n =
  [ [ "All the indices to a `"
    , vectorOf n "a"
    , "`. There are exactly "
    , intToText n
    , " of them. Its kind of like an `Int` except there is a finite amount of them."
    ]
    |> T.concat
    |> docBrackets
    
    
    , "\ntype Index\n"
    , indent 1 "= Index0\n"
    , List.map (indent 1 <. T.append "| " <. indexOf) (range 1 (n - 1))
      |> T.intercalate "\n"
    ]
    |> T.concat


nextIndex :: Int -> Text
nextIndex n =
  let
    indexCase :: Int -> (Text, Text)
    indexCase i =
      ( indexOf i
      , if i == (n - 1) then "Nothing" else T.append "Just " <| indexOf (i + 1)
      )
  in
    [ "Given an index, get the next one. Unless its the last index in which case there is no next index (`Nothing`)"
        |> docBrackets
      , funcDef "nextIndex" [("Index", "index")] "Maybe Index"
      , caseStatement "index" (List.map indexCase (range 0 (n - 1)))
      ]
      |> T.intercalate "\n"


previousIndex :: Int -> Text
previousIndex n =
  let
    indexCase :: Int -> (Text, Text)
    indexCase i =
      ( indexOf i
      , if i == 0 then "Nothing" else T.append "Just " <| indexOf (i - 1)
      )
  in
    [ "Given an index, get the previous one. Unless its the `0` index in which case there is no previous index (`Nothing`)"
        |> docBrackets
      , funcDef "previousIndex" [("Index", "index")] "Maybe Index"
      , caseStatement "index" (List.map indexCase (range 0 (n - 1)))
      ]
      |> T.intercalate "\n"

get :: Int -> Text
get n =
  let
    toCase :: Int -> (Text, Text)
    toCase i = (indexOf i, fieldGetter i)
  in
    [ ["Get the item at that `Index` in a `", vectorOf n "a", "`"]
      |> T.concat
      |> docBrackets
      , funcDef "get"
                [("Index", "index"), (vectorOf n "a", "(Vector vector)")]
                "a"
      , caseStatement "index" (List.map toCase (range 0 (n - 1)))
      ]
      |> T.intercalate "\n"


mapItem :: Int -> Text
mapItem n =
  let toCase :: Int -> (Text, Text)
      toCase i =
          ( indexOf i
          , [ "Vector { vector | "
            , fieldName i
            , " = "
            , "mapper "
            , fieldGetter i
            , " }"
            ]
            |> T.concat
          )
  in  [ "Transform just one particular item at a particular `Index`"
        |> docBrackets
      , funcDef
        "mapItem"
        [ ("Index"       , "index")
        , ("(a -> a)"    , "mapper")
        , (vectorOf n "a", "(Vector vector)")
        ]
        (vectorOf n "a")
      , caseStatement "index" (List.map toCase (range 0 (n - 1)))
      ]
        |> T.intercalate "\n"

set :: Int -> Text
set n =
  let toCase :: Int -> (Text, Text)
      toCase i =
          (indexOf i, ["Vector { vector | ", fieldName i, " = a }"] |> T.concat)
  in  [ ["Set the item at a specific index in a `", vectorOf n "a", "`"]
      |> T.concat
      |> docBrackets
      , funcDef
        "set"
        [("Index", "index"), ("a", "a"), (vectorOf n "a", "(Vector vector)")]
        (vectorOf n "a")
      , caseStatement "index" (List.map toCase (range 0 (n - 1)))
      ]
        |> T.intercalate "\n"


push :: Int -> Maybe Text
push n = if n < totalVectors
  then
    let field :: Int -> (Text, Text)
        field i = (fieldName i, if i == n then "a" else fieldGetter i)
    in  [ [ "Add an element to the end of a `"
          , vectorOf n "a"
          , "`, incrementing its size by 1"
          , "\n"
          , "\n    Vector4.push 4 (Vector4.from4 0 1 2 3)"
          , "\n    --> Vector5.from5 0 1 2 3 4"
          ]
        |> T.concat
        |> docBrackets
        , funcDef
          "push"
          [("a", "a"), (vectorOf n "a", "(Vector vector)")]
          (  ["Vector", intToText (n + 1), ".Vector", intToText (n + 1), " a"]
          |> T.concat
          )
        , recordAllocation (List.map field (range 0 n))
        , ["|> Vector", (intToText (n + 1)), ".Vector"] |> T.concat |> indent 2
        ]
        |> T.intercalate "\n"
        |> Just
  else Nothing

cons :: Int -> Maybe Text
cons n = if n < totalVectors
  then
    let
      field :: Int -> (Text, Text)
      field i = (fieldName i, if i == 0 then "a" else fieldGetter (i - 1))
    in
      [ [ "Add an element to the front of a vector, incrementing the vector size by 1"
        , "\n"
        , "\n    Vector4.cons -1 (Vector4.from4 0 1 2 3)"
        , "\n    --> Vector5.from5 -1 0 1 2 3"
        ]
      |> T.concat
      |> docBrackets
      , funcDef
        "cons"
        [("a", "a"), (vectorOf n "a", "(Vector vector)")]
        (  ["Vector", intToText (n + 1), ".Vector", intToText (n + 1), " a"]
        |> T.concat
        )
      , recordAllocation (List.map field (range 0 n))
      , ["|> Vector", (intToText (n + 1)), ".Vector"] |> T.concat |> indent 2
      ]
      |> T.intercalate "\n"
      |> Just
  else Nothing



pop :: Int -> Maybe Text
pop n = if 1 < n
  then
    let field :: Int -> (Text, Text)
        field i = (fieldName i, fieldGetter i)

        lowerVector :: Text
        lowerVector =
          T.append "Vector" <| intToText (n - 1)
    in  [ [ "Separate a `"
          , vectorOf n "a"
          , "` into its last element and everything else."
          , "\n"
          , "\n    Vector4.pop (Vector4.from4 0 1 2 3)"
          , "\n    --> (Vector3.from3 0 1 2, 3)"
          ]
        |> T.concat
        |> docBrackets
        , funcDef
          "pop"
          [(vectorOf n "a", unwrappedVector "vector")]
          (  [ "( "
             , lowerVector
             , "."
             , lowerVector
             , " a, a )"
             ]
          |> T.concat
          )
        , [ indent 1 "(\n"
          , recordAllocation (List.map field (range 0 (n - 2)))
          , "\n"
          , ["|> ", lowerVector, ".Vector"] |> T.concat |> indent
            2
          , "\n"
          , indent 1 <| comma <| fieldGetter (n - 1)
          , "\n"
          , indent 1 ")"
          ]
          |> T.concat
        ]
        |> T.intercalate "\n"
        |> Just
  else Nothing


uncons :: Int -> Maybe Text
uncons n = if 1 < n
  then
    let field :: Int -> (Text, Text)
        field i = (fieldName (i - 1), fieldGetter i)

        lowerVector :: Text
        lowerVector =
          T.append "Vector" <| intToText (n - 1)
    in  [ [ "Split a `"
          , vectorOf n "a"
          , "` into its first element and the rest"
          , "\n"
          , "\n    Vector4.uncons (Vector4.from4 0 1 2 3)"
          , "\n    --> (0, Vector3.from3 1 2 3)"
          ]
        |> T.concat
        |> docBrackets
        , funcDef
          "uncons"
          [(vectorOf n "a", unwrappedVector "vector")]
          (  [ "( a, "
             , lowerVector
             , "."
             , lowerVector
             , " a"
             , " )"
             ]
          |> T.concat
          )
        , [ indent 1 "("
          , fieldGetter 0
          , "\n"
          , indent 1 ","
          , recordAllocation (List.map field (range 1 (n - 1)))
          , "\n"
          , ["|> ", lowerVector, ".Vector"] |> T.concat |> indent
            2
          , indent 1 ")"
          ]
          |> T.concat
        ]
        |> T.intercalate "\n"
        |> Just
  else Nothing

indexToInt :: Int -> Text
indexToInt n =
  let toCase :: Int -> (Text, Text)
      toCase i = (indexOf i, intToText i)
  in  [ "Turn the `Index` into an `Int`" |> docBrackets
      , funcDef "indexToInt" [("Index", "index")] "Int"
      , caseStatement "index" (List.map toCase (range 0 (n - 1)))
      ]
        |> T.intercalate "\n"


intToIndex :: Int -> Text
intToIndex n =
  let
    indexCase :: Int -> (Text, Text)
    indexCase i = (intToText i, T.append "Just " <| indexOf i)
  in
    [ [ "Try and turn an `Int` into an `Index`, returning `Nothing` if the `Int` is above the maximum index, or below the zero index, of this `"
      , vectorOf n "a"
      , "`"
      , "\n"
      , "\n        Vector5.intToIndex 4"
      , "\n        --> Just Vector5.Index4"
      , "\n"
      , "\n        Vector3.intToIndex 4"
      , "\n        --> Nothing"
      ]
      |> T.concat
      |> docBrackets
      , funcDef "intToIndex" [("Int", "int")] "Maybe Index"
      , caseStatement "int" (List.map indexCase (range 0 (n - 1)))
      , ""
      , toCase ("_", "Nothing")
      ]
      |> T.intercalate "\n"



toList :: Int -> Text
toList n =
  let
    thisVector :: Text
    thisVector =
      vectorOf n "a"
  in
  [ ["Convert a `", thisVector, "` into a `List a` of length ", intToText n]
    |> T.concat
    |> docBrackets
    , funcDef "toList" [(thisVector, unwrappedVector "vector")] "List a"
    , list (range 0 (n - 1) |> List.map fieldGetter)
    ]
    |> T.intercalate "\n"

fromList :: Int -> Text
fromList n =
  [ [ "Turn a `List a` into a `"
    , vectorOf n "a"
    , "`. If there are not enough items in the `List a`, then this function returns `Nothing`. The extra items in the input list, if there are any, is returned as the first element in the output tuple."
    , "\n"
    , "\n    Vector3.fromList []"
    , "\n    --> Nothing"
    , "\n"
    , "\n    Vector3.fromList [ 1 ]"
    , "\n    --> Nothing"
    , "\n"
    , "\n    Vector3.fromList [ 5, 6, 7, 8 ]"
    , "\n    --> Just ([ 8 ], Vector3.from3 5 6 7)"
    , "\n"
    , "\n"
    ]
    |> T.concat
    |> docBrackets
    , funcDef "fromList"
              [("List a", "items")]
              (["Maybe (List a, ", vectorOf n "a", ")"] |> T.concat)
    , indent 1 "Just (items, VectorModel)"
    , T.replicate (toInt64 n) (indent 2 "|> andAnother\n")
    , indent 2 "|> Maybe.map (Tuple.mapSecond Vector)"
    ]
    |> T.intercalate "\n"

fromListWithDefault :: Int -> Text
fromListWithDefault n =
  let
    thisVector :: Text
    thisVector =
      vectorOf n "a"
  in
  [ [ "Turn a `List a` into a `"
    , thisVector
    , "`. If there are not enough items in the `List a`, then fill in the remaining spots with a default value. The extra items in the input list, if there are any, is returned as the first element in the output tuple."
    , "\n"
    , "\n    Vector3.fromListWithDefault 1 []"
    , "\n    --> ([] ,Vector3.from3 1 1 1)"
    , "\n"
    , "\n    Vector3.fromListWithDefault 2 [ 1 ]"
    , "\n    --> ([], Vector3.from3 1 2 2)"
    , "\n"
    , "\n    Vector3.fromListWithDefault 2 [ 5, 6, 7, 8 ]"
    , "\n    --> ([ 8 ], Vector3.from3 5 6 7)"
    , "\n"
    , "\n"
    ]
    |> T.concat
    |> docBrackets
    , funcDef "fromListWithDefault"
              [("a", "default"), ("List a", "items")]
              (["( List a,", thisVector, ")"] |> T.concat)
    , indent 1 "(default, items, VectorModel)"
    , T.replicate (toInt64 n) (indent 2 "|> andAnotherSafe\n")
    , indent 2 "|> finishOffAndAnotherSafe"
    , indent 2 "|> Tuple.mapSecond Vector"
    ]
    |> T.intercalate "\n"

from :: Int -> Text
from n =
  let toParam :: Int -> (Text, Text)
      toParam i = ("a", T.append "a" <| intToText i)

      field :: Int -> (Text, Text)
      field i = (fieldName i, T.append "a" <| intToText i)
  in  [ [" a `", vectorOf n "a", "` from ", intToText n, " elements"]
      |> T.concat
      |> docBrackets
      , funcDef (T.append "from" <| intToText n)
                (List.map toParam (range 0 (n - 1)))
                (vectorOf n "a")
      , recordAllocation (List.map field (range 0 (n - 1)))
      , pipeIntoVector
      ]
        |> T.intercalate "\n"

toIndexedList :: Int -> Text
toIndexedList n =
  let toIndexTuple :: Int -> Text
      toIndexTuple i = ["( ", indexOf i, ", ", fieldGetter i, ")"] |> T.concat

      thisVector :: Text
      thisVector =
        vectorOf n "a"
  in  [ [ "Turn a `"
        , thisVector
        , "` elm into a list, where each element is paired with its `Index`"
        ]
      |> T.concat
      |> docBrackets
      , funcDef "toIndexedList"
                [(thisVector, unwrappedVector "vector")]
                "List (Index, a)"
      , list (range 0 (n - 1) |> List.map toIndexTuple)
      ]
        |> T.intercalate "\n"


repeat :: Int -> Text
repeat n =
  let field :: Int -> (Text, Text)
      field i = (fieldName i, "a")

      thisVector :: Text
      thisVector =
        vectorOf n "a"
  in  [ [ " a `"
        , thisVector
        , "` filled with just one item repeated over and over again."
        ]
      |> T.concat
      |> docBrackets
      , funcDef "repeat" [("a", "a")] thisVector
      , recordAllocation (List.map field (range 0 (n - 1)))
      , pipeIntoVector
      ]
        |> T.intercalate "\n"

initialize :: Int -> Text
initialize n =
  let field :: Int -> (Text, Text)
      field i = (fieldName i, T.append "f " (intToText i))

      thisVector :: Text
      thisVector =
        vectorOf n "a"
  in  [ [ " a `"
        , thisVector
        , "` using a function that takes an `Int`, representing the index"
        ]
      |> T.concat
      |> docBrackets
      , funcDef "initializeFromInt" [("(Int -> a)", "f")] thisVector
      , recordAllocation (List.map field (range 0 (n - 1)))
      , pipeIntoVector
      ]
        |> T.intercalate "\n"

initializeFromIndex :: Int -> Text
initializeFromIndex n =
  let
    field :: Int -> (Text, Text)
    field i = (fieldName i, T.append "f " (indexOf i))

    thisVector :: Text
    thisVector =
      vectorOf n "a"
  in
    [ ["Make a `", thisVector, "` using a function that takes an `Index`"]
      |> T.concat
      |> docBrackets
      , funcDef "initializeFromIndex" [("(Index -> a)", "f")] thisVector
      , recordAllocation (List.map field (range 0 (n - 1)))
      , pipeIntoVector
      ]
      |> T.intercalate "\n"



map :: Int -> Text
map n =
  let field :: Int -> (Text, Text)
      field i = (fieldName i, T.append "f " (fieldGetter i))
      thisVector :: Text
      thisVector =
        vectorOf n "a"
  in  [ ["Apply a function to every element in a `", thisVector]
      |> T.concat
      |> docBrackets
      , funcDef "map"
                [("(a -> b)", "f"), (thisVector, unwrappedVector "vector")]
                (vectorOf n "b")
      , recordAllocation (List.map field (range 0 (n - 1)))
      , pipeIntoVector
      ]
        |> T.intercalate "\n"

foldr :: Int -> Text
foldr n =
  let
    thisVector :: Text
    thisVector =
      vectorOf n "a"
  in
  [ ["Reduce a `", thisVector, "` from the right"]
    |> T.concat
    |> docBrackets
    , funcDef
      "foldr"
      [("(a -> b -> b)", "f"), ("b", "start"), (thisVector, "vector")]
      "b"
    , indent 1 "List.foldr f start <| toList vector"
    ]
    |> T.intercalate "\n"

foldl :: Int -> Text
foldl n =
  let
    thisVector :: Text
    thisVector =
      vectorOf n "a"
  in
  [ ["Reduce a `", thisVector, "` from the left"]
    |> T.concat
    |> docBrackets
    , funcDef
      "foldl"
      [("(a -> b -> b)", "f"), ("b", "start"), (thisVector, "vector")]
      "b"
    , indent 1 "List.foldl f start <| toList vector"
    ]
    |> T.intercalate "\n"


indexedMap :: Int -> Text
indexedMap n =
  let field :: Int -> (Text, Text)
      field i =
          (fieldName i, ["f", indexOf i, fieldGetter i] |> T.intercalate " ")
  in  [ docBrackets
        "Apply a function on every element with its index as first argument"
      , funcDef
        "indexedMap"
        [("(Index -> a -> b)", "f"), (vectorOf n "a", "(Vector vector)")]
        (vectorOf n "b")
      , recordAllocation (List.map field (range 0 (n - 1)))
      , pipeIntoVector
      ]
        |> T.intercalate "\n"


member :: Int -> Text
member n =
  let
    check :: Int -> Text
    check i = indent 1 <| T.append "a == " <| fieldGetter i

    thisVector :: Text
    thisVector =
        vectorOf n "a"
  in
    [ ["See if a ", thisVector, " contains a value"]
      |> T.concat
      |> docBrackets
      , funcDef "member" [("a", "a"), (thisVector, unwrappedVector "vector")] "Bool"
      , (range 0 (n - 1)) |> List.map check |> T.intercalate "\n    || "
      ]

      |> T.intercalate "\n"

reverse :: Int -> Text
reverse n =
  let field :: Int -> (Text, Text)
      field i = (fieldName i, fieldGetter (n - i - 1))

      thisVector :: Text
      thisVector =
        vectorOf n "a"
  in  [ ["Reverse the order of the items in a `", thisVector, "`"]
      |> T.concat
      |> docBrackets
      , funcDef "reverse" [(vectorOf n "a", "(Vector vector)")] thisVector
      , recordAllocation (List.map field (range 0 (n - 1)))
      , pipeIntoVector
      ]
        |> T.intercalate "\n"

length :: Int -> Text
length n =
  [ ["The length of this vector type, which is", intToText n]
    |> T.intercalate " "
    |> docBrackets
    , funcDef "length" [] "Int"
    , indent 1 <| intToText n
    ]
    |> T.intercalate "\n"


indices :: Int -> Text
indices n =
  [ ["A list of all the indices, from 0 to ", intToText (n - 1)]
    |> T.concat
    |> docBrackets
    , funcDef "indices" [] (vectorOf n "Index")
    , indent 1 "initializeFromIndex identity"
    ]
    |> T.intercalate "\n"

group :: Int -> Text
group n =
  let
    caseItem :: Int -> Text
    caseItem i = T.append (deconstructedItem i) ":: "

    deconstructedItem :: Int -> Text
    deconstructedItem i = T.concat ["i", intToText i, " "]

    thisVector :: Text
    thisVector =
      vectorOf n "a"
  in
    [ [ [ "Break a `List a` down into groups of `"
        , thisVector
        , "`. The output is a tuple, where the left side is a list of the remainder."
        ]
        |> T.concat
      , ""
      , "    Vector3.group [ 1, 2, 3 ]"
      , "    --> ([] , [ Vector3.from3 1 2 3 ])"
      , ""
      , "    Vector3.group [ 1, 2, 3, 4 ]"
      , "    --> ([ 4 ] , [ Vector3.from3 1 2 3 ])"
      , ""
      , "    Vector3.group [ 1, 2, 3, 4, 5 ]"
      , "    --> ([ 4, 5 ] , [ Vector3.from3 1 2 3 ])"
      , ""
      , "    Vector3.group [ 1, 2, 3, 4, 5, 6 ]"
      , "    --> ([] , [ Vector3.from3 1 2 3, Vector3.from3 4 5 6 ])"
      , ""
      ]
      |> T.intercalate "\n"
      |> docBrackets
      , funcDef "group"
                [("List a", "items")]
                (T.concat ["(List a, List ( ", thisVector, " ) )"])
      , indent 1 "groupHelp items []"
      , "\n"
      , funcDef
        "groupHelp"
        [ ("List a", "remainingItems")
        , (T.concat ["List ( ", thisVector, " )"], "output")
        ]
        (T.concat ["(List a, List ( ", thisVector, " ) )"])
      , caseStatement
        "remainingItems"
        [ ( [List.map caseItem (range 0 (n - 1)) |> T.concat, "rest"]
            |> T.concat
          , [ "groupHelp rest (from"
            , intToText n
            , " "
            , List.map deconstructedItem (range 0 (n - 1)) |> T.concat
            , ":: output)"
            ]
            |> T.concat
          )
        , ("_", "(remainingItems, List.reverse output)")
        ]
      ]
      |> T.intercalate "\n"

map2 :: Int -> Text
map2 n =
  let field :: Int -> (Text, Text)
      field i =
          ( fieldName i
          , [fieldOf i "va", fieldOf i "vb"] |> T.intercalate " " |> T.append "f "
          )
  in  [ blankDocs
      , funcDef
        "map2"
        [ ("(a -> b -> c)", "f")
        , (vectorOf n "a" , unwrappedVector "va")
        , (vectorOf n "b" , unwrappedVector "vb")
        ]
        (vectorOf n "c")
      , recordAllocation (List.map field (range 0 (n - 1)))
      , pipeIntoVector
      ]
        |> T.intercalate "\n"

map3 :: Int -> Text
map3 n =
  let field :: Int -> (Text, Text)
      field i =
          ( fieldName i
          , [fieldOf i "va", fieldOf i "vb", fieldOf i "vc"]
            |> T.intercalate " "
            |> T.append "f "
          )
  in  [ blankDocs
      , funcDef
        "map3"
        [ ("(a -> b -> c -> d)", "f")
        , (vectorOf n "a"      , unwrappedVector "va")
        , (vectorOf n "b"      , unwrappedVector "vb")
        , (vectorOf n "c"      , unwrappedVector "vc")
        ]
        (vectorOf n "d")
      , recordAllocation (List.map field (range 0 (n - 1)))
      , pipeIntoVector
      ]
        |> T.intercalate "\n"

map4 :: Int -> Text
map4 n =
  let field :: Int -> (Text, Text)
      field i =
          ( fieldName i
          , [fieldOf i "va", fieldOf i "vb", fieldOf i "vc", fieldOf i "vd"]
            |> T.intercalate " "
            |> T.append "f "
          )
  in  [ blankDocs
      , funcDef
        "map4"
        [ ("(a -> b -> c -> d -> e)", "f")
        , (vectorOf n "a"           , unwrappedVector "va")
        , (vectorOf n "b"           , unwrappedVector "vb")
        , (vectorOf n "c"           , unwrappedVector "vc")
        , (vectorOf n "d"           , unwrappedVector "vd")
        ]
        (vectorOf n "e")
      , recordAllocation (List.map field (range 0 (n - 1)))
      , pipeIntoVector
      ]
        |> T.intercalate "\n"

map5 :: Int -> Text
map5 n =
  let field :: Int -> (Text, Text)
      field i =
          ( fieldName i
          , [ fieldOf i "va"
            , fieldOf i "vb"
            , fieldOf i "vc"
            , fieldOf i "vd"
            , fieldOf i "ve"
            ]
            |> T.intercalate " "
            |> T.append "f "
          )
  in  [ blankDocs
      , funcDef
        "map5"
        [ ("(a -> b -> c -> d -> e -> f)", "f")
        , (vectorOf n "a"                , unwrappedVector "va")
        , (vectorOf n "b"                , unwrappedVector "vb")
        , (vectorOf n "c"                , unwrappedVector "vc")
        , (vectorOf n "d"                , unwrappedVector "vd")
        , (vectorOf n "e"                , unwrappedVector "ve")
        ]
        (vectorOf n "f")
      , recordAllocation (List.map field (range 0 (n - 1)))
      , pipeIntoVector
      ]
        |> T.intercalate "\n"

-- HELPERS --

unwrappedVector :: Text -> Text
unwrappedVector vectorName = ["(Vector", vectorName, ")"] |> T.intercalate " "

pipeIntoVector :: Text
pipeIntoVector = indent 2 "|> Vector"

blankDocs :: Text
blankDocs = docBrackets ""

docBrackets :: Text -> Text
docBrackets docs = ["{-| ", docs, " -}"] |> T.concat

indexOf :: Int -> Text
indexOf = T.append "Index" <. intToText

recordAllocation :: List (Text, Text) -> Text
recordAllocation =
  let join :: (Text, Text) -> Text
      join (key, value) = [key, " = ", value] |> T.concat
  in  verticalCollection ("{", "}") <. List.map join

list :: List Text -> Text
list = verticalCollection ("[", "]")

verticalCollection :: (Text, Text) -> List Text -> Text
verticalCollection (opening, closing) items =
  [ indent 1 (T.append opening " ")
    , List.map (prepend "\n") items |> T.intercalate (indent 1 ", ")
    , indent 1 closing
    ]
    |> T.concat

funcDef :: Text -> List (Text, Text) -> Text -> Text
funcDef fName params outputType =
  [ typeDef fName (List.map first params) outputType
    , funcBodyDef fName (List.map second params)
    ]
    |> T.intercalate "\n"


typeDef :: Text -> List Text -> Text -> Text
typeDef fName params outputType =
  [fName, " : ", params |> List.map (prepend " -> ") |> T.concat, outputType]
    |> T.concat

funcBodyDef :: Text -> List Text -> Text
funcBodyDef fName params =
  [(fName : params) |> T.intercalate " ", " ="] |> T.concat

caseStatement :: Text -> List (Text, Text) -> Text
caseStatement caseOn cases =
  [ ["case ", caseOn, " of\n"] |> T.concat |> indent 1
    , List.map toCase cases |> T.intercalate "\n\n"
    ]
    |> T.concat

toCase :: (Text, Text) -> Text
toCase (thisCase, caseBody) =
  [indent 2 thisCase, " ->\n", indent 3 caseBody] |> T.concat

fieldName :: Int -> Text
fieldName = T.append "n" <. intToText

fieldGetter :: Int -> Text
fieldGetter n = fieldOf n "vector"

fieldOf :: Int -> Text -> Text
fieldOf n record = [record, ".", fieldName n] |> T.concat

vectorOf :: Int -> Text -> Text
vectorOf n type_ = ["Vector", intToText n, " ", type_] |> T.concat

prepend :: Text -> Text -> Text
prepend a b = T.append b a

comma :: Text -> Text
comma = T.append ", "

indent :: Int -> Text -> Text
indent times = T.append (T.replicate (P.fromIntegral times) "    ")

everyEarlierVectorModule :: Int -> List Int
everyEarlierVectorModule n = range 1 (n - 1)




