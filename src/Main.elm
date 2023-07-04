module Main exposing (..)

import Browser
import Browser.Dom exposing (Viewport)
import Css exposing (..)
import Css.Transitions exposing (easeIn, easeInOut, transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src, style)
import Json.Encode as Encode exposing (Value)
import Task



-- model


type ViewType
    = Desktop
    | Mobile


type alias Model =
    { viewType : ViewType
    }



-- flags


type alias Flags =
    {}



--init


init : Encode.Value -> ( Model, Cmd Msg )
init _ =
    ( { viewType = Desktop }
    , Task.perform (\vp -> GotViewport vp) Browser.Dom.getViewport
    )

-- classes

socialIcon : Attribute Msg
socialIcon =
    css [ minHeight (px 48)
        , maxHeight (px 48)
        , height auto
        ]

socialBox : Model -> Attribute Msg
socialBox model =
    css (
            [ backgroundColor (rgb 18 18 18)
            , backgroundPosition center
            , height (px 48)
            , overflow hidden
            , whiteSpace noWrap
            , padding (px 10)
            , margin (px 10)
            ]
            ++
            ( case model.viewType of
                Desktop ->
                    [ width (px 48)
                    , transition [ Css.Transitions.width 1000
                                 ]
                    , hover [ width (px 380)
                            ]
                    ]
                Mobile ->
                    [ width (px 380) ]
            )
        )

-- view


view_ : Model -> List (Html Msg)
view_ model =
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
                      [ div [ socialBox model ] [ a [ href "https://dneaves-blog.lamdera.app/"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/Lamdera.png"

                                                    ] []
                                              , text "    Blog"
                                              ]
                                          ]
                      , div [ socialBox model ] [ a [ href "https://twitter.com/DNEAVES/"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/TwitSolo.png"

                                                    ] []
                                              , text "    Twitter"
                                              ]
                                          ]
                      --, div [ socialBox model ] [ a [ href "https://hivesocial.app"
                      --                        ]
                      --                        [ img [ socialIcon
                      --                              , src "Images/HiveSolo.png"
                      --                              ] []
                      --                        , text "    Hive"
                      --                        ]
                      --                    ]
                      , div [ socialBox model ] [ a [ href "https://fosstodon.org/@dneaves"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/MastSolo.png"
                                                    ] []
                                              , text "    Mastodon"
                                              ]
                                          ]
                      , div [ socialBox model ] [ a [ href "https://instagram.com/DNEAVES/"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/InstaSolo.png"
                                                    ] []
                                              , text "    Instagram"
                                              ]
                                          ]
                      , div [ socialBox model ] [ a [ href "https://youtube.com/@dneavesgaming"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/YTGSolo.png"
                                                    ] []
                                              , text "    Youtube (Gaming)"
                                              ]
                                          ]
                      , div [ socialBox model ] [ a [ href "https://kick.com/DNEAVES/"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/Kick.png"
                                                    ] []
                                              , text "    Kick"
                                              ]
                                          ]
                      , div [ socialBox model ] [ a [ href "https://twitch.tv/DNEAVES/"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/TwitchSolo.png"
                                                    ] []
                                              , text "    Twitch"
                                              ]
                                          ]
                      , div [ socialBox model ] [ a [ href "https://youtube.com/@dneavesmusic"
                                              ]
                                              [ img [ socialIcon
                                                    , src "Images/YTMSolo.png"
                                                    ] []
                                              , text "    Youtube (Music)"
                                              ]
                                          ]
                      --, div [ socialBox model ] [ a [ href "https://soundcloud.com/DNEAVES"
                      --                        ]
                      --                        [ img [ socialIcon
                      --                              , src "Images/SoundcloudSolo.png"
                      --                              ] []
                      --                        , text "    Soundcloud"
                      --                        ]
                      --                    ]
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
    = GotViewport Viewport


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotViewport viewport ->
            let
                screenType =
                    if viewport.scene.width > viewport.scene.height then
                        Desktop
                    else
                        Mobile
            in
            ( { model | viewType = screenType }
            , Cmd.none
            )




-- func
-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
