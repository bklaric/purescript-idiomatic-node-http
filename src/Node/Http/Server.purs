module Node.Http.Server
    ( HttpServer
    , Request
    , Response
    , create
    ) where

import Prelude

import Control.Monad.Effect (Effect)
import Node.Events.EventEmitter as EventEmitter
import Node.Events.EventEmitter (class EventEmitter)
import Node.Http.ServerRequest (ServerRequest)
import Node.Http.ServerResponse (ServerResponse)
import Node.Server (class Server, defaultListen)

foreign import data HttpServer :: Type

type Request = ServerRequest

type Response = ServerResponse

foreign import create ::
    (Request -> Response -> Effect Unit) -> Effect HttpServer

instance eventEmitterHttpServer :: EventEmitter HttpServer where
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

instance serverHttpServer :: Server HttpServer where
    listen = defaultListen
