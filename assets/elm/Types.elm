module Types exposing (Flags, Model, Msg(..))

import Navigation exposing (Location)
import Routing exposing (Route)
import User as User


type alias Model =
    { userModel : User.Model
    , route : Route
    , flags : Flags
    }


type alias Flags =
    { socketUrl : String }


type Msg
    = Noop
    | UrlChange Location
    | NavigateTo Route
    | UserMsg User.Msg
