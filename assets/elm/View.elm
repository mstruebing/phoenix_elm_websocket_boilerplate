module View exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Routing exposing (Route(..))
import Types exposing (Model, Msg(..))
import User as User


view : Model -> Html Msg
view model =
    case model.route of
        IndexRoute ->
            div [ class "elm-app", onClick <| NavigateTo RegisterRoute ]
                [ text "INDEX"
                ]

        LoginRoute ->
            div [ class "elm-app" ]
                [ Html.map UserMsg (User.loginView model.userModel)
                ]

        RegisterRoute ->
            div [ class "elm-app" ]
                [ Html.map UserMsg (User.registerView model.userModel)
                ]

        NotFoundRoute ->
            div [ class "elm-app" ]
                [ text "NOT FOUND"
                ]
