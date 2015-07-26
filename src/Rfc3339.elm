module Rfc3339
    ( decode
    , Date
    , empty
    , encode
    ) where
{-| RFC3339 support in Elm.
-}

import Date
import Result
import Native.Rfc3339

type alias Date = Date.Date

{-| Takes an RFC3339 string and makes it into a `Date.Date`.
-}
decode : String -> Result String Date
decode = Native.Rfc3339.decode

{-| Takes a `Date.Date` and makes it into an RFC3339 string.
-}
encode : Date -> String
encode = Native.Rfc3339.encode

{-| This is a `Date.Date` on January 1st, 0AD.
-}
empty : Date
empty = Native.Rfc3339.empty
