module Test.Main where

import Prelude

import Control.Monad.Effect (Effect)
import Control.Monad.Effect.Ref (Ref, modifyRef, newRef, readRef)
import Control.Monad.Except (runExcept)
import Data.Array (cons)
import Data.Either (Either, either)
import Data.Foreign (Foreign, ForeignError, unsafeFromForeign, unsafeReadTagged)
import Data.List.Types (NonEmptyList)
import Data.Maybe (Maybe(..))
import Node.Buffer (Buffer, concat_)
import Node.Events.EventEmitter (on')
import Node.Http.Server (Request, Response, create)
import Node.Http.ServerRequest (method, url)
import Node.Http.ServerResponse (setHeader, setStatusCode)
import Node.Server (ListenOptions(..), listen_)
import Node.Stream.Readable.Events (data', end)
import Node.Stream.Writable (endBuffer_, writeString__)

listenOptions :: ListenOptions
listenOptions = TcpListenOptions
    { port: Just 8080
    , host: Nothing
    , backlog: Nothing
    , exclusive: Nothing
    }

foreignToBuffer :: Foreign -> Either (NonEmptyList ForeignError) Buffer
foreignToBuffer foreignBuffer =
    unsafeReadTagged "Uint8Array" foreignBuffer
    # runExcept
    <#> unsafeFromForeign

requestHandler :: Request -> Response -> Effect Unit
requestHandler request response = do
    let method' = method request
    let url' = url request
    setStatusCode 500 response
    setHeader "nigga" "higga" response
    response # writeString__ ("<p>Method is " <> method' <> " and url is " <> url' <> "</p>") # void
    (body :: Ref (Array Buffer)) <- newRef []
    _ <- request # on' data' \foreignData ->
        foreignToBuffer foreignData # either (const $ pure unit) \buffer ->
            modifyRef body (cons buffer)
    _ <- request # on' end (readRef body >>= concat_ >>= (flip endBuffer_ response) # void)
    pure unit

main :: Effect Unit
main = create requestHandler >>= listen_ listenOptions
