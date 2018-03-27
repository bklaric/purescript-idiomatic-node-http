module Node.Http.ServerResponse where

import Node.Events.EventEmitter as EventEmitter
import Node.Stream.Writable as Writable

foreign import data ServerResponse :: Type

instance eventEmitterServerResponse
    :: EventEmitter.EventEmitter ServerResponse where
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

instance writableServerResponse :: Writable.Writable ServerResponse where
    writableHighWaterMark   = Writable.defaultWritableHighWaterMark
    writableLength          = Writable.defaultWritableLength
    cork                    = Writable.defaultCork
    uncork                  = Writable.defaultUncork
    write                   = Writable.defaultWrite
    end                     = Writable.defaultEnd
    destroy                 = Writable.defaultDestroy
