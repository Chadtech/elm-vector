module Tests exposing (suite, testVector)

import Expect exposing (Expectation)
import Test exposing (Test, describe, test)
import Vector3
import Vector4 exposing (Vector4)
import Vector5


testVector : Vector4 Int
testVector =
    Vector4.from4 1 2 3 4


onesVector : Vector4 Int
onesVector =
    Vector4.from4 1 1 1 1


suite : Test
suite =
    describe "vector"
        [ test "fromList" <|
            \_ ->
                [ 1, 2, 3, 4 ]
                    |> Vector4.fromList
                    |> Expect.equal (Just ( [], testVector ))
        , test "toList" <|
            \_ ->
                testVector
                    |> Vector4.toList
                    |> Expect.equal [ 1, 2, 3, 4 ]
        , test "toIndexedList" <|
            \_ ->
                testVector
                    |> Vector4.toIndexedList
                    |> Expect.equal
                        [ ( Vector4.Index0, 1 )
                        , ( Vector4.Index1, 2 )
                        , ( Vector4.Index2, 3 )
                        , ( Vector4.Index3, 4 )
                        ]
        , test "repeat" <|
            \_ ->
                Vector4.repeat 1
                    |> Expect.equal onesVector
        , describe "fromListWithDefault" <|
            [ test "Uses default" <|
                \_ ->
                    Vector4.fromListWithDefault 1 []
                        |> Expect.equal ( [], onesVector )
            , test "Uses default and list" <|
                \_ ->
                    Vector4.fromListWithDefault 2 [ 1 ]
                        |> Expect.equal ( [], Vector4.from4 1 2 2 2 )
            , test "Doesnt use default is exceeds size and list" <|
                \_ ->
                    Vector4.fromListWithDefault 2 [ 1, 2, 3, 4, 5 ]
                        |> Expect.equal ( [ 5 ], testVector )
            ]
        , describe "initializeFromInt"
            [ test "identity" <|
                \_ ->
                    Vector4.initializeFromInt identity
                        |> Expect.equal (Vector4.from4 0 1 2 3)
            , test "x2" <|
                \_ ->
                    Vector4.initializeFromInt ((*) 2)
                        |> Expect.equal (Vector4.from4 0 2 4 6)
            ]
        , describe "initializeFromIndex"
            [ test "identity" <|
                \_ ->
                    Vector4.initializeFromIndex identity
                        |> Expect.equal (Vector4.from4 Vector4.Index0 Vector4.Index1 Vector4.Index2 Vector4.Index3)
            , test "x2" <|
                \_ ->
                    Vector4.initializeFromIndex Vector4.indexToInt
                        |> Expect.equal (Vector4.from4 0 1 2 3)
            ]
        , describe "get"
            [ test "get Index0" <|
                \_ ->
                    Vector4.get Vector4.Index0 testVector
                        |> Expect.equal 1
            , test "get Index3" <|
                \_ ->
                    Vector4.get Vector4.Index3 testVector
                        |> Expect.equal 4
            ]
        , describe "set"
            [ test "set Index1" <|
                \_ ->
                    Vector4.set Vector4.Index1 8 testVector
                        |> Expect.equal (Vector4.from4 1 8 3 4)
            , test "set Index4" <|
                \_ ->
                    Vector4.set Vector4.Index3 8 testVector
                        |> Vector4.get Vector4.Index3
                        |> Expect.equal 8
            ]
        , describe "intToIndex"
            [ test "0 is Index0" <|
                \_ ->
                    Vector4.intToIndex 0
                        |> Expect.equal (Just Vector4.Index0)
            , test "3 is Index3" <|
                \_ ->
                    Vector4.intToIndex 3
                        |> Expect.equal (Just Vector4.Index3)
            , test "5 is Nothing" <|
                \_ ->
                    Vector4.intToIndex 5
                        |> Expect.equal Nothing
            ]
        , describe "nextIndex"
            [ test "Index0 goes to Index1" <|
                \_ ->
                    Vector4.nextIndex Vector4.Index0
                        |> Expect.equal (Just Vector4.Index1)
            , test "Index1 goes to Index2" <|
                \_ ->
                    Vector4.nextIndex Vector4.Index1
                        |> Expect.equal (Just Vector4.Index2)
            , test "Index3 goes to Nothing" <|
                \_ ->
                    Vector4.nextIndex Vector4.Index3
                        |> Expect.equal Nothing
            ]
        , describe "previousIndex"
            [ test "Index0 goes to Nothing" <|
                \_ ->
                    Vector4.previousIndex Vector4.Index0
                        |> Expect.equal Nothing
            , test "Index1 goes to Index0" <|
                \_ ->
                    Vector4.previousIndex Vector4.Index1
                        |> Expect.equal (Just Vector4.Index0)
            , test "Index3 goes to Index2" <|
                \_ ->
                    Vector4.previousIndex Vector4.Index3
                        |> Expect.equal (Just Vector4.Index2)
            ]
        , test "map" <|
            \_ ->
                Vector4.map String.fromInt testVector
                    |> Expect.equal (Vector4.from4 "1" "2" "3" "4")
        , test "mapItem" <|
            \_ ->
                Vector4.mapItem Vector4.Index2 ((*) 2) testVector
                    |> Expect.equal (Vector4.from4 1 2 6 4)
        , test "indexedMap" <|
            \_ ->
                Vector4.initializeFromIndex identity
                    |> Vector4.indexedMap (==)
                    |> Expect.equal (Vector4.repeat True)
        , test "map2" <|
            \_ ->
                Vector4.map2 (*) testVector testVector
                    |> Vector4.toList
                    |> Expect.equal [ 1, 4, 9, 16 ]
        , test "pop" <|
            \_ ->
                Vector4.pop testVector
                    |> Expect.equal ( Vector3.from3 1 2 3, 4 )
        , test "push" <|
            \_ ->
                Vector4.push 5 testVector
                    |> Expect.equal (Vector5.from5 1 2 3 4 5)
        , test "uncons" <|
            \_ ->
                Vector4.uncons testVector
                    |> Expect.equal ( 1, Vector3.from3 2 3 4 )
        , test "cons" <|
            \_ ->
                Vector4.cons 0 testVector
                    |> Expect.equal (Vector5.from5 0 1 2 3 4)
        , test "length" <|
            \_ ->
                Vector4.length
                    |> Expect.equal 4
        , test "reverse" <|
            \_ ->
                Vector4.reverse testVector
                    |> Expect.equal (Vector4.from4 4 3 2 1)
        , describe "member"
            [ test "contains element" <|
                \_ ->
                    Vector4.member 1 testVector
                        |> Expect.equal True
            , test "doesnt contain element" <|
                \_ ->
                    Vector4.member 8 testVector
                        |> Expect.equal False
            ]
        , describe "group"
            [ test "8 elements" <|
                \_ ->
                    Vector4.group
                        (List.range 0 7)
                        |> Expect.equal
                            ( []
                            , [ Vector4.from4 0 1 2 3
                              , Vector4.from4 4 5 6 7
                              ]
                            )
            , test "9 elements" <|
                \_ ->
                    Vector4.group
                        (List.range 0 8)
                        |> Expect.equal
                            ( [ 8 ]
                            , [ Vector4.from4 0 1 2 3
                              , Vector4.from4 4 5 6 7
                              ]
                            )
            ]
        ]
