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
        ]

vectors :: List Int
vectors = range 1 100


makeInternalFile :: Int -> Text
makeInternalFile n =
  [makeInternalModuleHeader n, makeExports n, "\n\n", makeImports n]
    |> T.intercalate "\n"



makeInternalModuleHeader :: Int -> Text
makeInternalModuleHeader n =
  ["module", T.append "Vector" <| intToText n, "exposing"] |> T.intercalate " "

makeExports :: Int -> Text
makeExports n =
  let comma :: Text -> Text
      comma = T.append ", "
  in  [T.append "( Vector" <| intToText n]
        ++ List.map comma ["Nat", "get"]
        ++ [")"]
        |> List.map (indent 1)
        |> T.intercalate "\n"

everyGetExport :: Int -> List Text
everyGetExport n = List.map (T.append "get" <. intToText) (range 0 (n - 1))


makeImports :: Int -> Text
makeImports n =
  let importThisVectorModule :: Int -> Text
      importThisVectorModule m =
          [ "import Vector"
            , intToText m
            , ".Internal as "
            , "Vector"
            , intToText m
            , "Int"
            , " exposing ("
            , "Vector"
            , intToText m
            , ")"
            ]
            |> T.concat
  in  everyEarlierVectorModule n
        |> List.map importThisVectorModule
        |> T.intercalate "\n"

indent :: Int -> Text -> Text
indent times = T.append (T.replicate (P.fromIntegral times) "    ")

everyEarlierVectorModule :: Int -> List Int
everyEarlierVectorModule n = range 1 (n - 1)
