module User exposing (Model, Msg(..), initialModel, loginView, registerView, update)

import Components.Button exposing (button)
import Html exposing (Html, div, form, input, text)
import Html.Attributes exposing (class, placeholder, type_)
import Html.Events exposing (onInput, onSubmit)


type alias Model =
    { email : String
    , password : String
    , passwordConfirmation : String
    }


type Msg
    = UpdatePassword String
    | UpdatePasswordConfirmation String
    | UpdateEmail String
    | NoOp


initialModel : Model
initialModel =
    { email = ""
    , password = ""
    , passwordConfirmation = ""
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        UpdatePassword password ->
            ( { model | password = password }, Cmd.none )

        UpdatePasswordConfirmation password ->
            ( { model | passwordConfirmation = password }, Cmd.none )

        UpdateEmail email ->
            ( { model | email = email }, Cmd.none )


loginView : Model -> Html Msg
loginView model =
    div [ class "user__login" ]
        [ form
            [ onSubmit NoOp ]
            [ input [ type_ "email", onInput UpdateEmail, placeholder "email" ] []
            , input [ type_ "password", onInput UpdatePassword, placeholder "password" ] []
            , button [ type_ "submit" ] [ text "Login" ]
            ]
        ]


registerView : Model -> Html Msg
registerView model =
    div [ class "user__register" ]
        [ form
            [ onSubmit NoOp ]
            [ input [ type_ "email", onInput UpdateEmail, placeholder "email" ] []
            , input [ type_ "password", onInput UpdatePassword, placeholder "password" ] []
            , input [ type_ "password", onInput UpdatePassword, placeholder "confirm password" ] []
            , button [ type_ "submit" ] [ text "Login" ]
            ]
        ]
