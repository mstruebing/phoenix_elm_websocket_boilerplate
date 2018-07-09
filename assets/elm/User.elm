module User exposing (Model, Msg(..), initialModel, update)


type alias Model =
    { email : String
    , password : String
    }


type Msg
    = ClearPassword
    | UpdateEmail String


initialModel : Model
initialModel =
    { email = ""
    , password = ""
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClearPassword ->
            ( { model | password = "" }, Cmd.none )

        UpdateEmail email ->
            ( { model | email = email }, Cmd.none )
