module Node.Http.IncomingMessage where

import Node.Events.EventEmitter as EventEmitter
import Node.Stream.Readable as Readable

foreign import data IncomingMessage :: Type

instance eventEmitterServerResponse
    :: EventEmitter.EventEmitter IncomingMessage where
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

instance readableIncomingMessage :: Readable.Readable IncomingMessage  where
    readableHighWaterMark   = Readable.defaultReadableHighWaterMark
    readableLength          = Readable.defaultReadableLength
    isPaused                = Readable.defaultIsPaused
    pause                   = Readable.defaultPause
    read                    = Readable.defaultRead
    resume                  = Readable.defaultResume
    pipe                    = Readable.defaultPipe
    unpipe                  = Readable.defaultUnpipe
    setEncoding             = Readable.defaultSetEncoding
    unshift                 = Readable.defaultUnshift
    destroy                 = Readable.defaultDestroy
