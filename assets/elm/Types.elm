module Types exposing (Model, Msg(..))

import Navigation exposing (Location)
import Routing exposing (Route)
import User as User


type alias Model =
    { userModel : User.Model
    , route : Route
    }


type Msg
    = Noop
    | UrlChange Location
    | NavigateTo Route
    | UserMsg User.Msg
