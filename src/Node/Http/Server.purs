module Node.Http.Server
    ( HttpServerImpl
    , Request
    , Response
    , create
    ) where

import Prelude

import Control.Monad.Effect (Effect)
import Node.Http.ServerRequest (ServerRequest)
import Node.Http.ServerResponse (ServerResponse)
import Node.Net.Server (class NetServer, defaultListen)

foreign import data HttpServerImpl :: Type

type Request = ServerRequest

type Response = ServerResponse

foreign import create ::
    (Request -> Response -> Effect Unit) -> Effect HttpServerImpl

instance netServerHttpServerImpl :: NetServer HttpServerImpl where
    listen = defaultListen
