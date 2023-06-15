module Main exposing (..)

import Browser
import Css exposing (..)
import Css.Transitions exposing (easeIn, easeInOut, transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src, style)
import Json.Encode as Encode exposing (Value)



-- model


type alias Model =
    {
    }



-- flags


type alias Flags =
    {}



--init


init : Encode.Value -> ( Model, Cmd Msg )
init _ =
    ( {}
    , Cmd.none
    )

-- classes

socialIcon : Attribute Msg
socialIcon =
    css [ minHeight (px 48)
        , maxHeight (px 48)
        , height auto
        ]

socialBox : Attribute Msg
socialBox =
    css [ backgroundColor (rgb 18 18 18)
        , backgroundPosition center
        , height (px 48)
        , width (px 48)
        , overflow hidden
        , whiteSpace noWrap
        , padding (px 10)
        , margin (px 10)
        , transition [ Css.Transitions.width 1000
                     ]
        , hover [ width (px 380)
                ]
        ]

-- view


view_ : Model -> List (Html Msg)
view_ _ =
    [ div [ css [ width auto
                , height (pct 100)
                , fontFamilies [ "Consolas", "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", "Monaco", "Courier New", "monospace" ]
                , fontSize (px 32)
                , textAlign center
                , verticalAlign middle
                , margin auto
                , color (rgb 255 119 0)
                ]
          ]
          [ img [ css
                    [ top (px 10)
                    , width auto
                    , height (px 240)
                    ]
                , src "Images/DN logo Trans.png"
                ]
                []
          , div [ css [ textAlign left
                      , marginLeft (pct 5)
                      , verticalAlign middle
                      , width auto
                      , height auto
                      ]
                ]
                [ div [ css [ float left
                            , width (pct 47)
                            , padding (px 5)
                            ]
                      ]
                      [ div [ socialBox ] [ a [ href "https://twitter.com/DNEAVES/"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/TwitSolo.png"

                                                    ] []
                                              , text "    Twitter"
                                              ]
                                          ]
                      --, div [ socialBox ] [ a [ href "https://hivesocial.app"
                      --                        ]
                      --                        [ img [ socialIcon
                      --                              , src "Images/HiveSolo.png"
                      --                              ] []
                      --                        , text "    Hive"
                      --                        ]
                      --                    ]
                      , div [ socialBox ] [ a [ href "https://fosstodon.org/@dneaves"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/MastSolo.png"
                                                    ] []
                                              , text "    Mastodon"
                                              ]
                                          ]
                      , div [ socialBox ] [ a [ href "https://instagram.com/DNEAVES/"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/InstaSolo.png"
                                                    ] []
                                              , text "    Instagram"
                                              ]
                                          ]
                      , div [ socialBox ] [ a [ href "https://youtube.com/@dneavesgaming"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/YTGSolo.png"
                                                    ] []
                                              , text "    Youtube (Gaming)"
                                              ]
                                          ]
                      , div [ socialBox ] [ a [ href "https://kick.com/DNEAVES/"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/Kick.png"
                                                    ] []
                                              , text "    Kick"
                                              ]
                                          ]
                      , div [ socialBox ] [ a [ href "https://twitch.tv/DNEAVES/"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/TwitchSolo.png"
                                                    ] []
                                              , text "    Twitch"
                                              ]
                                          ]
                      , div [ socialBox ] [ a [ href "https://youtube.com/@dneavesmusic"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/YTMSolo.png"
                                                    ] []
                                              , text "    Youtube (Music)"
                                              ]
                                          ]
                      , div [ socialBox ] [ a [ href "https://soundcloud.com/DNEAVES"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/SoundcloudSolo.png"
                                                    ] []
                                              , text "    Soundcloud"
                                              ]
                                          ]
                      ]
                ]
          , div [ css [ float right
                    , marginRight (pct 5)
                    , width auto
                    , height auto
                    , backgroundColor (rgb 255 255 255)
                    ]
                ]
                --[ div [ css [ width auto
                --            , height auto
                --            , padding (px 5)
                --            ]
                --      ]
                --      []
                --      TODO: iframe
                --]
                []
          ]
    ]


view : Model -> Browser.Document Msg
view model =
    { title = "DNEAVES' Links"
    , body = List.map toUnstyled (view_ model)
    }



--main


main : Program Encode.Value Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- msg/update


type Msg
    = None


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )




-- func
-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
