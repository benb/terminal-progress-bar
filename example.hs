{-# LANGUAGE NoImplicitPrelude, PackageImports, UnicodeSyntax #-}

module Main where

import "base" Control.Concurrent ( threadDelay )
import "base" Control.Monad ( forM_ )
import "base" Data.Function ( ($) )
import "base" Data.Int ( Int )
import "base" Prelude ( (+) )
import "base" System.IO ( IO, hSetBuffering, BufferMode(NoBuffering), stdout, putStrLn )
import "base-unicode-symbols" Prelude.Unicode ( ℤ )
import "terminal-progress-bar" System.ProgressBar ( progressBar, percentage, exact )


main ∷ IO ()
main = example 60 (13 + 60) 25000

example ∷ ℤ → ℤ → Int → IO ()
example t w delay = do
    hSetBuffering stdout NoBuffering
    forM_ [1..t] $ \d → do
      progressBar percentage exact w d t
      threadDelay delay
    putStrLn ""

