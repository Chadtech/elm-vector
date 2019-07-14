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


main :: P.IO ()
main = P.sequence_
  ( (TIO.writeFile "./src/Util.elm" makeHelper)
  : (TIO.writeFile "./exposed-modules" makeExposedModules)
  : (List.map makeVectorFiles vectors)
  )


makeVectorFiles :: Int -> P.IO ()
makeVectorFiles n =
  let directory :: Text
      directory = T.append "./src/Vector" <| T.pack <| P.show n
  in  P.sequence_
        [ SysDir.createDirectoryIfMissing True <| T.unpack directory
        , TIO.writeFile (T.unpack <| T.append directory "/Internal.elm")
                        (makeInternalFile n)
        , TIO.writeFile (T.unpack <| T.append directory ".elm") (makeModule n)
        ]



vectors :: List Int
vectors = range 1 totalVectors


totalVectors :: Int
totalVectors = 100

makeInternalFile :: Int -> Text
makeInternalFile n =
  [makeInternalModuleHeader n, makeInternalVectorDefinition n ]
    |> T.intercalate "\n\n\n"

makeExposedModules :: Text
makeExposedModules =
  let toVectorModuleName :: Int -> Text
      toVectorModuleName i = T.concat ["\"Vector", (intToText i), "\""]
  in  T.intercalate ",\n" <| List.map toVectorModuleName (range 1 totalVectors)

makeHelper :: Text
makeHelper =
  [ "module Util exposing"
    , indent 1 "( andAnother"
    , indent 1 ", andAnotherSafe"
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
    , "\n\n"
    , "andAnotherSafe : (a, List a, a -> b) -> (a, List a, b)"
    , "andAnotherSafe (default, items, f) ="
    , indent 1 "case items of"
    , indent 2 "next :: rest ->"
    , indent 3 "(default, rest, f next)\n"
    , indent 2 "[] ->"
    , indent 3 "(default, [], f default)"
    ]
    |> T.intercalate "\n"

makeModule :: Int -> Text
makeModule n =
        -- Functions in every module
  (  (  [ makeModuleHeader n
        , makeImports n
        , makeVectorDefinition n
        , makeIndexDefinition n
        , makeGetDefinition n
        , makeMapDefinition n
        , makeMapItemDefinition n
        , makeToListDefinition n
        , makeFromListDefinition n
        , makeFromListWithDefaultDefinition n
        , makeToIndexedListDefinition n
        , makeInitializeDefinition n
        , makeInitializeFromIndexDefinition n
        , makeRepeatDefinition n
        , makeIndexToInt n
        , makeIntToIndex n
        ]
     |> List.map Just
     )
     -- Conditional functions; functions only used in some vector modules
    ++ [makePush n, makePop n, makeShift n, makeUnshift n]
    )
    |> onlyValues
    |> T.intercalate "\n\n\n"


onlyValues :: List (Maybe Text) -> List Text
onlyValues items = case items of
  []               -> []

  Just item : rest -> item : onlyValues rest

  Nothing   : rest -> onlyValues rest

makeInternalModuleHeader :: Int -> Text
makeInternalModuleHeader n =
  [ ["module ", T.append "Vector" <| intToText n, ".Internal exposing"]
      |> T.concat
    , ["( Vector(..)", comma "VectorModel", ")"]
    |> List.map (indent 1)
    |> T.intercalate "\n"
    ]
    |> T.intercalate "\n"



makeModuleHeader :: Int -> Text
makeModuleHeader n =
  [ ["module ", T.append "Vector" <| intToText n, " exposing"] |> T.concat
    , [T.concat ["( ", vectorOf n ""]]
    ++ List.map
         comma
         (  [ Just "Index(..)"
            , Just "get"
            , pushImport n
            , popImport n
            , shiftImport n
            , unshiftImport n
            , Just "map"
            , Just "mapItem"
            , Just "toList"
            , Just "fromList"
            , Just "fromListWithDefault"
            , Just "toIndexedList"
            , Just "repeat"
            , Just "initializeFromInt"
            , Just "initializeFromIndex"
            , Just "indexToInt"
            , Just "intToIndex"
            ]
         |> onlyValues
         )
    ++ [")"]
    |> List.map (indent 1)
    |> T.intercalate "\n"
    ]
    |> T.intercalate "\n"

pushImport :: Int -> Maybe Text
pushImport n = if n < totalVectors then Just "push" else Nothing

popImport :: Int -> Maybe Text
popImport n = if 1 < n then Just "pop" else Nothing

shiftImport :: Int -> Maybe Text
shiftImport n = if 1 < n then Just "shift" else Nothing

unshiftImport :: Int -> Maybe Text
unshiftImport n = if n < totalVectors then Just "unshift" else Nothing


everyGetExport :: Int -> List Text
everyGetExport n = List.map (T.append "get" <. intToText) (range 0 (n - 1))


makeImports :: Int -> Text
makeImports n =
  let importThisVectorModule :: Int -> Text
      importThisVectorModule m =
          [ "import Vector"
            , intToText m
            , ".Internal exposing (Vector(..), VectorModel)"
            ]
            |> T.concat
  in  [ Just <| importThisVectorModule n
      , nextVectorImport n
      , previousVectorImport n
      , Just "import Util exposing (andAnother, andAnotherSafe)"
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

makeVectorDefinition :: Int -> Text
makeVectorDefinition n =
  [ "type alias "
    , vectorOf n "a"
    , " = "
    , "\n"
    , indent 1 (T.concat ["Vector", intToText n, ".Internal.Vector a"])
    ]
    |> T.concat



makeInternalVectorDefinition :: Int -> Text
makeInternalVectorDefinition n =
  [ "type Vector a"
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


makeIndexDefinition :: Int -> Text
makeIndexDefinition n =
  [ "type Index\n"
    , indent 1 "= Index0\n"
    , List.map (indent 1 <. T.append "| " <. indexOf) (range 1 (n - 1))
      |> T.intercalate "\n"
    ]
    |> T.concat


makeGetDefinition :: Int -> Text
makeGetDefinition n =
  let toCase :: Int -> (Text, Text)
      toCase i = (indexOf i, fieldGetter i)
  in  [ funcDef "get"
                [("Index", "index"), (vectorOf n "a", "(Vector vector)")]
                "a"
      , caseStatement "index" (List.map toCase (range 0 (n - 1)))
      ]
        |> T.intercalate "\n"


makeMapItemDefinition :: Int -> Text
makeMapItemDefinition n =
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
  in  [ funcDef
        "mapItem"
        [ ("Index"       , "index")
        , ("(a -> a)"    , "mapper")
        , (vectorOf n "a", "(Vector vector)")
        ]
        (vectorOf n "a")
      , caseStatement "index" (List.map toCase (range 0 (n - 1)))
      ]
        |> T.intercalate "\n"


makePush :: Int -> Maybe Text
makePush n = if n < totalVectors
  then
    let makeField :: Int -> (Text, Text)
        makeField i = (fieldName i, if i == n then "a" else fieldGetter i)
    in  [ funcDef "push"
                  [("a", "a"), (vectorOf n "a", "(Vector vector)")]
                  (vectorOf (n + 1) "a")
        , recordAllocation (List.map makeField (range 0 n))
        , ["|> Vector", (intToText (n + 1)), ".Vector"] |> T.concat |> indent 2
        ]
        |> T.intercalate "\n"
        |> Just
  else Nothing

makeUnshift :: Int -> Maybe Text
makeUnshift n = if n < totalVectors
  then
    let makeField :: Int -> (Text, Text)
        makeField i =
          (fieldName i, if i == 0 then "a" else fieldGetter (i - 1))
    in  [ funcDef "unshift"
                  [("a", "a"), (vectorOf n "a", "(Vector vector)")]
                  (vectorOf (n + 1) "a")
        , recordAllocation (List.map makeField (range 0 n))
        , ["|> Vector", (intToText (n + 1)), ".Vector"] |> T.concat |> indent 2
        ]
        |> T.intercalate "\n"
        |> Just
  else Nothing



makePop :: Int -> Maybe Text
makePop n = if 1 < n
  then
    let makeField :: Int -> (Text, Text)
        makeField i = (fieldName i, fieldGetter i)
    in  [ funcDef "pop"
                  [(vectorOf n "a", "(Vector vector)")]
                  (["(", (vectorOf (n - 1) "a"), ", ", "a )"] |> T.concat)
        , [ indent 1 "(\n"
          , recordAllocation (List.map makeField (range 0 (n - 2)))
          , "\n"
          , ["|> Vector", (intToText (n - 1)), ".Vector"] |> T.concat |> indent
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


makeShift :: Int -> Maybe Text
makeShift n = if 1 < n
  then
    let makeField :: Int -> (Text, Text)
        makeField i = (fieldName (i - 1), fieldGetter i)
    in  [ funcDef "shift"
                  [(vectorOf n "a", "(Vector vector)")]
                  (["( a, ", (vectorOf (n - 1) "a"), " )"] |> T.concat)
        , [ indent 1 "("
          , fieldGetter 0
          , "\n"
          , indent 1 ","
          , recordAllocation (List.map makeField (range 1 (n - 1)))
          , "\n"
          , ["|> Vector", (intToText (n - 1)), ".Vector"] |> T.concat |> indent
            2
          , indent 1 ")"
          ]
          |> T.concat
        ]
        |> T.intercalate "\n"
        |> Just
  else Nothing

makeIndexToInt :: Int -> Text
makeIndexToInt n =
  let toCase :: Int -> (Text, Text)
      toCase i = (indexOf i, intToText i)
  in  [ funcDef "indexToInt" [("Index", "index")] "Int"
      , caseStatement "index" (List.map toCase (range 0 (n - 1)))
      ]
        |> T.intercalate "\n"


makeIntToIndex :: Int -> Text
makeIntToIndex n =
  let indexCase :: Int -> (Text, Text)
      indexCase i = (intToText i, T.append "Just " <| indexOf i)
  in  [ funcDef "intToIndex" [("Int", "int")] "Int"
      , caseStatement "int" (List.map indexCase (range 0 (n - 1)))
      , ""
      , toCase ("_", "Nothing")
      ]
        |> T.intercalate "\n"

makeToListDefinition :: Int -> Text
makeToListDefinition n =
  [ funcDef "toList" [(vectorOf n "a", "(Vector vector)")] "List a"
    , list (range 0 (n - 1) |> List.map fieldGetter)
    ]
    |> T.intercalate "\n"

makeFromListDefinition :: Int -> Text
makeFromListDefinition n =
  [ funcDef "fromList"
            [("List a", "items")]
            (["Maybe (List a, ", vectorOf n "a", ")"] |> T.concat)
    , indent 1 "Just (items, VectorModel)"
    , T.replicate (toInt64 (n - 1)) (indent 2 "|> andAnother\n")
    ]
    |> T.intercalate "\n"

makeFromListWithDefaultDefinition :: Int -> Text
makeFromListWithDefaultDefinition n =
  [ funcDef "fromListWithDefault"
            [("a", "default"), ("List a", "items")]
            (vectorOf n "a")
    , indent 1 "(default, items, VectorModel)"
    , T.replicate (toInt64 (n - 1)) (indent 2 "|> andAnotherSafe\n")
    ]
    |> T.intercalate "\n"

makeToIndexedListDefinition :: Int -> Text
makeToIndexedListDefinition n =
  let toIndexTuple :: Int -> Text
      toIndexTuple i = ["( ", indexOf i, ", ", fieldGetter i, ")"] |> T.concat
  in  [ funcDef "toIndexedList"
                [(vectorOf n "a", "(Vector vector)")]
                "List (Index, a)"
      , list (range 0 (n - 1) |> List.map toIndexTuple)
      ]
        |> T.intercalate "\n"


makeRepeatDefinition :: Int -> Text
makeRepeatDefinition n =
  let makeField :: Int -> (Text, Text)
      makeField i = (fieldName i, "a")
  in  [ funcDef "repeat" [("a", "a")] (vectorOf n "a")
      , recordAllocation (List.map makeField (range 0 (n - 1)))
      ]
        |> T.intercalate "\n"

makeInitializeDefinition :: Int -> Text
makeInitializeDefinition n =
  let makeField :: Int -> (Text, Text)
      makeField i = (fieldName i, T.append "f " (intToText i))
  in  [ funcDef "initializeFromInt" [("(Int -> a)", "f")] (vectorOf n "a")
      , recordAllocation (List.map makeField (range 0 (n - 1)))
      ]
        |> T.intercalate "\n"

makeInitializeFromIndexDefinition :: Int -> Text
makeInitializeFromIndexDefinition n =
  let makeField :: Int -> (Text, Text)
      makeField i = (fieldName i, T.append "f " (indexOf i))
  in  [ funcDef "initializeFromIndex" [("(Index -> a)", "f")] (vectorOf n "a")
      , recordAllocation (List.map makeField (range 0 (n - 1)))
      ]
        |> T.intercalate "\n"



makeMapDefinition :: Int -> Text
makeMapDefinition n =
  let makeField :: Int -> (Text, Text)
      makeField i = (fieldName i, T.append "f " (fieldGetter i))
  in  [ funcDef "map"
                [("(a -> b)", "f"), (vectorOf n "a", "(Vector vector)")]
                (vectorOf n "b")
      , recordAllocation (List.map makeField (range 0 (n - 1)))
      ]
        |> T.intercalate "\n"

-- HELPERS --

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
fieldGetter n = ["vector.", fieldName n] |> T.concat

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




