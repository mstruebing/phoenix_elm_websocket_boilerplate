module Update exposing (update)

import Navigation as Navigation
import Routing exposing (parse, toPath)
import Types exposing (Model, Msg(..))
import User as User


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )

        UrlChange location ->
            let
                currentRoute =
                    parse location
            in
            ( { model | route = currentRoute }, Cmd.none )

        NavigateTo route ->
            ( model, Cmd.batch [ Navigation.newUrl <| toPath route ] )

        UserMsg userMsg ->
            let
                ( updatedModel, cmd ) =
                    User.update userMsg model.userModel
            in
            ( { model | userModel = updatedModel }, Cmd.map UserMsg cmd )