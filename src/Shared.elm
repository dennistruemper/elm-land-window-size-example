module Shared exposing
    ( Flags, decoder
    , Model, Msg
    , init, update, subscriptions
    )

{-|

@docs Flags, decoder
@docs Model, Msg
@docs init, update, subscriptions

-}

import Effect exposing (Effect)
import Json.Decode
import Ports
import Route exposing (Route)
import Route.Path
import Shared.Model
import Shared.Msg



-- FLAGS


type alias Flags =
    { initialHeight : Int, initialWidth : Int }


decoder : Json.Decode.Decoder Flags
decoder =
    Json.Decode.map2 Flags
        (Json.Decode.field "height" Json.Decode.int)
        (Json.Decode.field "width" Json.Decode.int)



-- INIT


type alias Model =
    Shared.Model.Model


init : Result Json.Decode.Error Flags -> Route () -> ( Model, Effect Msg )
init flagsResult route =
    let
        initialDimensions =
            case flagsResult of
                Ok flags ->
                    flags

                -- Just an example, so no real error handling
                Err _ ->
                    { initialHeight = 0, initialWidth = 0 }
    in
    ( { initialHeight = initialDimensions.initialHeight
      , initialWidth = initialDimensions.initialWidth
      , currentHeight = 300
      , currentWidth = 400
      }
    , Effect.none
    )



-- UPDATE


type alias Msg =
    Shared.Msg.Msg


update : Route () -> Msg -> Model -> ( Model, Effect Msg )
update route msg model =
    case msg of
        Shared.Msg.NoOp ->
            ( model
            , Effect.none
            )

        Shared.Msg.DimensionsChanged dimensions ->
            ( { model | currentHeight = dimensions.height, currentWidth = dimensions.width }
            , Effect.none
            )



-- SUBSCRIPTIONS


subscriptions : Route () -> Model -> Sub Msg
subscriptions route model =
    Ports.dimensions Shared.Msg.DimensionsChanged
