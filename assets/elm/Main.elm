module Main exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import User as User exposing (Model, Msg(..), initialModel, loginView, update)


type alias Model =
    { userModel : User.Model }


initialModel : Model
initialModel =
    { userModel = User.initialModel }


type Msg
    = Noop
    | UserMsg User.Msg


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )

        UserMsg userMsg ->
            let
                ( updatedModel, cmd ) =
                    User.update userMsg model.userModel
            in
            ( { model | userModel = updatedModel }, Cmd.map UserMsg cmd )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div [ class "elm-app" ]
        [ Html.map UserMsg (User.loginView model.userModel) ]
