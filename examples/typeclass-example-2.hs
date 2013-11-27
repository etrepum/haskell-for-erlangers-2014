{-# LANGUAGE DeriveFunctor #-}

module List where

data List a = Cons a (List a)
            | Nil
            deriving (Eq, Functor)
