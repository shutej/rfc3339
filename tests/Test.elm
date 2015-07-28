import Date
import String

import ElmTest.Assertion exposing  (assert, assertEqual)
import ElmTest.Runner.Element exposing (runDisplay)
import ElmTest.Test exposing (test, Test, suite)
import Rfc3339

testEmpty =
    Rfc3339.empty |> Rfc3339.encode |> assertEqual "0000-01-01T00:00:00Z"

testEncode =
    let
        result = Date.fromString "Sat Jul 25 2015 23:24:53 GMT-0400 (EDT)"
    in
      case result of
        Result.Ok date ->
            date
                |> Rfc3339.encode
                |> assertEqual "2015-07-26T03:24:53Z"

testDecodeZ =
    let
        expected = Date.fromString "Sat Jul 25 2015 23:24:53 GMT-0400 (EDT)"
        actual = Rfc3339.decode "2015-07-26T03:24:53Z"
    in
      case (expected, actual) of
        (Result.Ok e, Result.Ok a) ->
            assertEqual (Rfc3339.encode e) (Rfc3339.encode a)

testDecodeEDT =
    let
        expected = Date.fromString "Sat Jul 25 2015 23:24:53 GMT-0400 (EDT)"
        actual = Rfc3339.decode "2015-07-25T23:24:53.000-04:00"
    in
      case (expected, actual) of
        (Result.Ok e, Result.Ok a) ->
            assertEqual (Rfc3339.encode e) (Rfc3339.encode a)

tests : Test
tests = suite "Rfc3339"
        [ test "empty" testEmpty
        , test "encode" testEncode
        , test "decodeZ" testDecodeZ
        , test "decodeEDT" testDecodeEDT
        ]

main = runDisplay tests
