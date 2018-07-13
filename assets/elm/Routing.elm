module Routing exposing (Route(..), parse, toPath)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = IndexRoute
    | LoginRoute
    | RegisterRoute
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map IndexRoute <| s ""
        , map LoginRoute <| s ""
        , map RegisterRoute <| s ""
        ]


parse : Location -> Route
parse location =
    case parsePath matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


toPath : Route -> String
toPath route =
    case route of
        IndexRoute ->
            "/"

        LoginRoute ->
            "/login"

        RegisterRoute ->
            "/register"

        NotFoundRoute ->
            "/not-found"
