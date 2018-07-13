module Components.Atoms.Button exposing (button)

import Html exposing (Attribute, Html)
import Html.Attributes exposing (style)


buttonStyle : Attribute msg
buttonStyle =
    style
        [ ( "padding", "1em" )
        , ( "backgroundColor", "unset" )
        , ( "border", "none" )
        , ( "color", "#fff" )
        ]


button : List (Attribute msg) -> List (Html msg) -> Html msg
button attributes contents =
    Html.button (buttonStyle :: attributes) contents
