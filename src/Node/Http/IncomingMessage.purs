module Node.Http.IncomingMessage where

import Prelude

import Control.Monad.Effect (Effect)
import Control.Monad.Effect.Exception (Error)
import Data.Foreign (Foreign)
import Node.Events.EventEmitter (undefined)
import Node.Stream.Readable (class Readable)

class Readable message <= IncomingMessage message where
    httpVersion :: message -> String
    rawHeaders  :: message -> Array String
    headers     :: message -> Foreign
    trailers    :: message -> Effect Foreign
    setTimeout  :: Int -> Effect Unit -> message -> Effect message
    destroy     :: Error -> message -> Effect Unit

foreign import defaultHttpVersion
    :: forall message
    .  message -> String

foreign import defaultRawHeaders
    :: forall message
    .  message -> Array String

foreign import defaultHeaders
    :: forall message
    .  message -> Foreign

foreign import defaultTrailers
    :: forall message
    .  message -> Effect Foreign

foreign import defaultSetTimeout
    :: forall message
    .  Int -> Effect Unit -> message -> Effect message

foreign import defaultDestroy
    :: forall message
    .  Error -> message -> Effect Unit

destroy_ :: forall message. IncomingMessage message => message -> Effect Unit
destroy_ = destroy undefined
