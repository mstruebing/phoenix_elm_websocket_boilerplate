module Main exposing (..)

import Navigation exposing (Location)
import Routing exposing (Route(..), parse, toPath)
import Subscriptions exposing (subscriptions)
import Types exposing (Model, Msg(..))
import Update exposing (update)
import User as User
import View exposing (view)


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parse location
    in
    initialModel currentRoute


initialModel : Route -> ( Model, Cmd Msg )
initialModel route =
    ( { userModel = User.initialModel, route = route }, Cmd.none )


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- VIEW
