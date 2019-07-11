{-# LANGUAGE OverloadedStrings #-}


module CtBasic
  ( List
  , (-)
  , require
  , Bool(..)
  , Int
  , Float
  , Char
  , IO
  , Monad
  , andThen
  , fromInt64
  , fromInt32
  , trace
  , mapTrace
  , mixLists
  , first
  , slice
  , toFloat
  , replaceChar
  , showText
  , second
  , toIO
  , range
  , mark
  , intToText
  , mapIO
  , (++)
  , maxInt32Sample
  )
where


import           Flow

import           Data.Int                       ( Int64
                                                , Int32
                                                )
-- import qualified Data.List                     as List
import           Data.Text.Lazy                 ( Text )
import qualified Data.Text.Lazy                as T
-- import qualified Data.Text.Lazy.Read           as TR
import qualified Prelude                       as P
import           Prelude                        ( (-)
                                                , (==)
                                                , (>>=)
                                                , (++)
                                                , Bool
                                                , Int
                                                , Float
                                                , Char
                                                , Monad
                                                , IO
                                                )
import qualified Debug.Trace                   as Debug


first :: (a, b) -> a
first (a, _) = a

second :: (a, b) -> b
second (_, b) = b

mapIO :: (a -> b) -> P.IO a -> P.IO b
mapIO = P.fmap


toIO :: a -> P.IO a
toIO = P.return

showText :: P.Show a => a -> Text
showText = P.show .> T.pack


andThen :: P.Monad m => (a -> m b) -> m a -> m b
andThen f m = m >>= f


require :: P.Monad m => m a -> m (a -> b) -> m b
require ma fm = andThen (\f -> P.fmap f ma) fm


toFloat :: Int -> Float
toFloat = P.fromIntegral


slice :: Int -> Int -> Text -> Text
slice a b = T.take (P.fromIntegral (b - a)) <. T.drop (P.fromIntegral a)


replaceChar :: Char -> Char -> Text -> Text
replaceChar target replacement =
  T.pack <. P.map (replaceIfTarget target replacement) <. T.unpack


replaceIfTarget :: Char -> Char -> Char -> Char
replaceIfTarget target replacement char =
  if char == target then replacement else char


mixLists :: List a -> List a -> List a
mixLists xs ys = case (xs, ys) of
  (firstX : restX, firstY : restY) -> firstX : firstY : mixLists restX restY

  (_             , []            ) -> xs

  ([]            , _             ) -> ys


type List a = [a]


trace :: P.Show a => Text -> a -> a
trace msg x = mapTrace msg P.id x


mapTrace :: P.Show b => Text -> (a -> b) -> a -> a
mapTrace msg f x =
  Debug.trace (T.unpack <| T.concat [msg, " : ", T.pack <| P.show <| f x]) x



mark :: Text -> a -> a
mark text = Debug.trace (T.unpack text)


range :: Int -> Int -> List Int
range n m = [n .. m]


fromInt64 :: Int64 -> Int
fromInt64 = P.fromIntegral


fromInt32 :: Int32 -> Int
fromInt32 = P.fromIntegral


maxInt32Sample :: Float
maxInt32Sample = 2147483647


intToText :: Int -> Text
intToText = P.show .> T.pack
