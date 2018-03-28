module Node.Http.ServerResponse where

import Prelude

import Control.Monad.Effect (Effect)
import Data.Foreign (Foreign)
import Data.Nullable (Nullable)
import Node.Events.EventEmitter (class EventEmitter)
import Node.Events.EventEmitter as EventEmitter
import Node.Stream.Writable (class Writable, undefined)
import Node.Stream.Writable as Writable
import Unsafe.Coerce (unsafeCoerce)

foreign import data ServerResponse :: Type

instance eventEmitterServerResponse :: EventEmitter ServerResponse where
    on                  = EventEmitter.defaultOn
    once                = EventEmitter.defaultOnce
    prependListener     = EventEmitter.defaultPrependListener
    prependOnceListener = EventEmitter.defaultPrependOnceListener
    removeListener      = EventEmitter.defaultRemoveListener
    removeAllListeners  = EventEmitter.defaultRemoveAllListeners
    emit                = EventEmitter.defaultEmit
    listeners           = EventEmitter.defaultListeners
    listenerCount       = EventEmitter.defaultListenerCount
    getMaxListeners     = EventEmitter.defaultGetMaxListeners
    setMaxListeners     = EventEmitter.defaultSetMaxListeners
    eventNames          = EventEmitter.defaultEventNames

instance writableServerResponse :: Writable ServerResponse where
    writableHighWaterMark   = Writable.defaultWritableHighWaterMark
    writableLength          = Writable.defaultWritableLength
    cork                    = Writable.defaultCork
    uncork                  = Writable.defaultUncork
    write                   = Writable.defaultWrite
    end                     = Writable.defaultEnd
    destroy                 = Writable.defaultDestroy

foreign import addTrailers :: Foreign -> ServerResponse -> Effect Unit

foreign import finished :: ServerResponse -> Effect Boolean

foreign import getHeader :: String -> ServerResponse -> Effect String

foreign import getHeaderNames :: ServerResponse -> Effect (Array String)

foreign import getHeaders :: ServerResponse -> Effect Foreign

foreign import hasHeader :: String -> ServerResponse -> Effect Boolean

foreign import headersSent :: ServerResponse -> Effect Boolean

foreign import removeHeader :: String -> ServerResponse -> Effect Unit

foreign import getSendDate :: ServerResponse -> Effect Boolean

foreign import setSendDate :: Boolean -> ServerResponse -> Effect Unit

foreign import setHeader :: String -> String -> ServerResponse -> Effect Unit

foreign import setHeader' :: String -> Array String -> ServerResponse -> Effect Unit

foreign import defaultSetTimeout :: Int -> Effect Unit -> ServerResponse -> Effect ServerResponse

foreign import getStatusCode :: ServerResponse -> Effect Int

foreign import setStatusCode :: Int -> ServerResponse -> Effect Unit

foreign import getStatusMessage :: ServerResponse -> Effect (Nullable String)

foreign import setStatusMessage :: String -> ServerResponse -> Effect Unit

foreign import writeContinue :: ServerResponse -> Effect Unit

foreign import writeHead :: Int -> String -> Foreign -> ServerResponse -> Effect Unit

writeHead_ :: Int -> Foreign -> ServerResponse -> Effect Unit
writeHead_ statusCode headers = writeHead statusCode (unsafeCoerce headers) undefined

writeHead_' :: Int -> String -> ServerResponse -> Effect Unit
writeHead_' statusCode statusMessage = writeHead statusCode statusMessage undefined

writeHead__ :: Int -> ServerResponse -> Effect Unit
writeHead__ statusCode = writeHead statusCode undefined undefined
