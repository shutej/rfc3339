module Rfc3339
    ( decode
    , Date
    , empty
    , encode
    ) where

import Date
import Result
import Native.Rfc3339

type alias Date = Date.Date

decode : String -> Result String Date
decode = Native.Rfc3339.decode

encode : Date -> String
encode = Native.Rfc3339.encode

empty : Date
empty = Native.Rfc3339.empty
