module Main where

import Prelude
import Effect
import Effect.Class.Console
import Affjax
import Affjax.ResponseFormat
import Effect.Aff
import Data.Either
import Data.Argonaut.Core

main :: Effect Unit
main = launchAff_ $ do
    res1 <- get json "https://jsonplaceholder.typicode.com/todos/1"
    case res1.body of
        Left err -> log $ printResponseFormatError err
        Right json -> log $ stringify json
