module Test.Main where

import Prelude

import Control.Monad.Effect (Effect)
import Data.Maybe (Maybe(..))
import Node.Http.Server (create)
import Node.Net.Server (ListenOptions(..), listen_)
import Node.Stream.Readable (pipe_)

listenOptions :: ListenOptions
listenOptions = TcpListenOptions
    { port: Just 8080
    , host: Nothing
    , backlog: Nothing
    , exclusive: Nothing
    }

main :: Effect Unit
main = create (\request response -> request # pipe_ response # void)
    >>= listen_ listenOptions
