module Pages.Home_ exposing (Model, Msg, page)

import Effect exposing (Effect)
import Html
import Page exposing (Page)
import Route exposing (Route)
import Shared
import Shared.Model
import View exposing (View)


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view shared
        }



-- INIT


type alias Model =
    {}


init : () -> ( Model, Effect Msg )
init () =
    ( {}
    , Effect.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        NoOp ->
            ( model
            , Effect.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Shared.Model -> Model -> View Msg
view shared model =
    { title = "Pages.Home_"
    , body =
        [ Html.text "/"
        , Html.div []
            [ Html.div [] [ Html.text ("InitialHeight: " ++ String.fromInt shared.initialHeight) ]
            , Html.div [] [ Html.text ("InitialWidth: " ++ String.fromInt shared.initialWidth) ]
            , Html.div [] [ Html.text ("CurrentHeight: " ++ String.fromInt shared.currentHeight) ]
            , Html.div [] [ Html.text ("CurrentWidth: " ++ String.fromInt shared.currentWidth) ]
            ]
        ]
    }
