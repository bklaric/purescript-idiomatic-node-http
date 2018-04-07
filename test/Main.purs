module Test.Main where

import Prelude

import Control.Monad.Effect (Effect)
import Data.Maybe (Maybe(..))
import Node.Http.Server (Request, Response, create)
import Node.Http.ServerRequest (method, url)
import Node.Net.Server (ListenOptions(..), listen_)
import Node.Stream.Readable (pipe_)

listenOptions :: ListenOptions
listenOptions = TcpListenOptions
    { port: Just 8080
    , host: Nothing
    , backlog: Nothing
    , exclusive: Nothing
    }

requestHandler :: Request -> Response -> Effect Unit
requestHandler request response = do
    let method' = method request
    let url' = url request
    method

main :: Effect Unit
main = create (\request response -> request # pipe_ response # void)
    >>= listen_ listenOptions
