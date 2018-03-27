module Node.Http.Server
    ( HttpServerImpl
    , Request
    , Response
    , create
    ) where

import Prelude

import Control.Monad.Effect (Effect)
import Node.Http.IncomingMessage (IncomingMessage)
import Node.Http.ServerResponse (ServerResponse)
import Node.Net.Server (class NetServer, defaultListen)

foreign import data HttpServerImpl :: Type

type Request = IncomingMessage

type Response = ServerResponse

foreign import create :: forall effects.
    (Request -> Response -> Effect Unit) -> Effect HttpServerImpl

instance netServerHttpServerImpl :: NetServer HttpServerImpl where
    listen = defaultListen
