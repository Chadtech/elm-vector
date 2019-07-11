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
main = P.sequence_ (List.map makeVectorFiles vectors)


makeVectorFiles :: Int -> P.IO ()
makeVectorFiles n =
  let directory :: Text
      directory = T.append "./elm-src/Vector" <| T.pack <| P.show n
  in  P.sequence_
        [ SysDir.createDirectoryIfMissing True <| T.unpack directory
        , TIO.writeFile (T.unpack <| T.append directory "/Internal.elm")
                        (makeInternalFile n)
        , TIO.writeFile (T.unpack <| T.append directory ".elm") (makeModule n)
        ]

vectors :: List Int
vectors = range 1 100


makeInternalFile :: Int -> Text
makeInternalFile n =
  [makeInternalModuleHeader n, makeInternalVectorDefinition n]
    |> T.intercalate "\n\n\n"


makeModule :: Int -> Text
makeModule n =
  [ makeModuleHeader n
    , makeImports n
    , makeVectorDefinition n
    , makeIndexDefinition n
    , makeGetDefinition n
    , makeMapDefinition n
    , makeToListDefinition n
    , makeToIndexedListDefinition n
    , makeRepeatDefinition n
    ]
    |> T.intercalate "\n\n\n"



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
    ++ List.map comma
                ["Index(..)", "get", "map", "toList", "toIndexedList", "repeat"]
    ++ [")"]
    |> List.map (indent 1)
    |> T.intercalate "\n"
    ]
    |> T.intercalate "\n"



everyGetExport :: Int -> List Text
everyGetExport n = List.map (T.append "get" <. intToText) (range 0 (n - 1))


makeImports :: Int -> Text
makeImports n =
  let importThisVectorModule :: Int -> Text
      importThisVectorModule m =
          ["import Vector", intToText m, ".Internal exposing (Vector(..))"]
            |> T.concat
  in  importThisVectorModule n

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
  [ "type Vector"
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


makeMapDefinition :: Int -> Text
makeMapDefinition n =
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
        "map"
        [ ("Index"       , "index")
        , ("(a -> b)"    , "mapper")
        , (vectorOf n "a", "(Vector vector)")
        ]
        (vectorOf n "b")
      , caseStatement "index" (List.map toCase (range 0 (n - 1)))
      ]
        |> T.intercalate "\n"

makeToListDefinition :: Int -> Text
makeToListDefinition n =
  [ funcDef "toList" [(vectorOf n "a", "(Vector vector)")] "List a"
    , list (range 0 (n - 1) |> List.map fieldGetter)
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
  let toCase :: (Text, Text) -> Text
      toCase (thisCase, caseBody) =
          [indent 2 thisCase, " ->\n", indent 3 caseBody] |> T.concat
  in  [ ["case ", caseOn, " of\n"] |> T.concat |> indent 1
      , List.map toCase cases |> T.intercalate "\n\n"
      ]
        |> T.concat

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




