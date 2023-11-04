module Shared.Msg exposing (Msg(..))

import Ports


type Msg
    = NoOp
    | DimensionsChanged Ports.Dimensions
