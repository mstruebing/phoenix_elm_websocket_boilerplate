module Components.Button exposing (button)

import Html exposing (Attribute, Html)
import Html.Attributes exposing (style)


buttonStyle : Attribute msg
buttonStyle =
    style
        [ ( "backgroundColor", "red" )
        , ( "height", "90px" )
        , ( "width", "100%" )
        ]


button : List (Attribute msg) -> List (Html msg) -> Html msg
button attributes contents =
    Html.button (buttonStyle :: attributes) contents
