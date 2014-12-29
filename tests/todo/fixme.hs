module Goo where

import Prelude hiding (sum, map, foldr1)

wtAverage :: [(Int, Int)] -> Int
wtAverage wxs = div totElems totWeight 
  where
    elems     = map (\(w, x) -> w * x) wxs
    weights   = map (\(w, _) -> w    ) wxs
    totElems  = sum elems 
    totWeight = sum weights 

{-@ map       :: (a -> b) -> [a] -> [b]  @-}
map _ []      = []
map f (x:xs)  = f x : map f xs 

sum :: [Int] -> Int
sum []        = error "cannot add up empty list"
sum _         = foldr1 (+)
