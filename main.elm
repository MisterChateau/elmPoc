module Main exposing (..)

import Html exposing (text)

import List

type alias Person =
    { name : String
    , age : Int
    }

people = 
    [ { name = "Rick", age = 55 }
    , { name = "Morty", age = 14 }
    ]

names : List Person -> List String
names people =
    List.map (\person -> person.name) people

findPerson : String -> List Person -> Maybe Person
findPerson name people =
    List.foldl 
    (\person acc ->
        case acc of
            Just _ -> acc
            Nothing ->
                if person.name == name then
                    Just person
                else
                    Nothing
    ) Nothing people

main =
    text <| toString <| findPerson "Rick" people