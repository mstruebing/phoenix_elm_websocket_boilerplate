module Components.Button exposing (button)

import Html exposing (Attribute, Html)


button : List (Attribute msg) -> List (Html msg) -> Html msg
button attributes contents =
    -- use Html.button because otherwise it would be a recursive call
    Html.button attributes contents
