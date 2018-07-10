module User exposing (Model, Msg(..), initialModel, loginView, update)

import Html exposing (Html, button, div, form, input, text)
import Html.Attributes exposing (type_)
import Html.Events exposing (onInput, onSubmit)


type alias Model =
    { email : String
    , password : String
    }


type Msg
    = UpdatePassword String
    | UpdateEmail String
    | NoOp


initialModel : Model
initialModel =
    { email = ""
    , password = ""
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        UpdatePassword password ->
            ( { model | password = password }, Cmd.none )

        UpdateEmail email ->
            ( { model | email = email }, Cmd.none )


loginView : Model -> Html Msg
loginView model =
    div []
        [ form
            [ onSubmit NoOp ]
            [ input [ type_ "email", onInput UpdateEmail ] []
            , input [ type_ "password", onInput UpdatePassword ] []
            , button [ type_ "submit" ] [ text "Login" ]
            ]
        ]
