module Main exposing (..)

import Browser
import Browser.Dom exposing (Viewport)
import Element exposing (Attribute, Element, alignLeft, centerX, column, el, height, html, htmlAttribute, image, link, newTabLink, padding, px, rgb, rgb255, row, spacing, text, width)
import Element.Background as Bg
import Element.Font as Font
import Html
import Html.Attributes exposing (style)
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
    --, Task.perform (\vp -> GotViewport vp) Browser.Dom.getViewport
    , Cmd.none
    )

-- classes

--socialIcon : Attribute Msg
--socialIcon =
--    css [ minHeight (px 48)
--        , maxHeight (px 48)
--        , height auto
--        ]
--
--socialBox : Model -> Attribute Msg
--socialBox model =
--    css (
--            [ backgroundColor (rgb 18 18 18)
--            , backgroundPosition center
--            , height (px 48)
--            , overflow hidden
--            , whiteSpace noWrap
--            , padding (px 10)
--            , margin (px 10)
--            ]
--            ++
--            ( case model.viewType of
--                Desktop ->
--                    [ width (px 48)
--                    , transition [ Css.Transitions.width 1000
--                                 ]
--                    , hover [ width (px 380)
--                            ]
--                    ]
--                Mobile ->
--                    [ width (px 380) ]
--            )
--        )

socialBox : Model -> List (Attribute Msg)
socialBox model =
    [ Bg.color (rgb255 18 18 18)
    , Font.color (rgb255 255 255 255)
    , centerX
    ]


-- view


view_ : Model -> Element Msg
view_ model =
     column
        [ centerX
        , Font.size 28
        , Font.family
            [ Font.typeface "Consolas"
            , Font.typeface "Andale Mono"
            , Font.typeface "Lucida Console"
            , Font.typeface "Lucida Sans Typewriter"
            , Font.typeface "Monaco"
            , Font.typeface "Courier New"
            , Font.monospace
            ]
        ]
        [ image 
            [ width (px 240)
            , height (px 240)
            , centerX
            ]
            { src = "Images/DN logo Trans.png"
            , description = ""
            }
        , column [ spacing 15 ]
            [ newTabLink ( socialBox model )
                { url = "https://dneaves-blog.lamdera.app/"
                , label = (
                    row
                        [ spacing 15 ]
                        [ image [ width (px 48)
                                , height (px 48)
                                ]
                            { src = "Images/Lamdera.png"
                            , description = ""
                            }
                        , text "Blog "
                        ]
                    )
                }
            , newTabLink ( socialBox model )
                { url = "https://twitter.com/DNEAVES/"
                , label = (
                    row
                        [ spacing 15 ]
                        [ image [ width (px 48)
                                , height (px 48)
                                ]
                            { src = "Images/TwitSolo.png"
                            , description = ""
                            }
                        , text "Twitter "
                        ]
                    )
                }
            , newTabLink ( socialBox model ++ [ htmlAttribute (Html.Attributes.rel "me") ])
                { url = "https://fosstodon.org/@dneaves"
                , label = (
                    row
                        [ spacing 15 ]
                        [ image [ width (px 48)
                                , height (px 48)
                                ]
                            { src = "Images/MastSolo.png"
                            , description = ""
                            }
                        , text "Mastodon "
                        ]
                    )
                }
            --, html (Html.a
            --    [ Html.Attributes.href "https://fosstodon.org/@dneaves"
            --    , Html.Attributes.rel "me"
            --    , Html.Attributes.align "middle"
            --    ]
            --    [ Html.img
            --        [ Html.Attributes.height 48
            --        , Html.Attributes.width 48
            --        , Html.Attributes.src "Images/MastSolo.png"
            --        ]
            --        []
            --    , Html.text "Mastodon "
            --    ])
            , newTabLink ( socialBox model )
                { url = "https://twitch.tv/DNEAVES/"
                , label = (
                    row
                        [ spacing 15 ]
                        [ image [ width (px 48)
                                , height (px 48)
                                ]
                            { src = "Images/TwitchSolo.png"
                            , description = ""
                            }
                        , text "Twitch "
                        ]
                    )
                }
            , newTabLink ( socialBox model )
                { url = "https://kick.com/DNEAVES/"
                , label = (
                    row
                        [ spacing 15 ]
                        [ image [ width (px 48)
                                , height (px 48)
                                ]
                            { src = "Images/Kick.png"
                            , description = ""
                            }
                        , text "Kick "
                        ]
                    )
                }
            , newTabLink ( socialBox model )
                { url = "https://youtube.com/@dneavesgaming"
                , label = (
                    row
                        [ spacing 15 ]
                        [ image [ width (px 48)
                                , height (px 48)
                                ]
                            { src = "Images/YTGSolo.png"
                            , description = ""
                            }
                        , text "Youtube (Gaming) "
                        ]
                    )
                }
            , newTabLink ( socialBox model )
                { url = "https://youtube.com/@dneavesmusic"
                , label = (
                    row
                        [ spacing 15 ]
                        [ image [ width (px 48)
                                , height (px 48)
                                ]
                            { src = "Images/YTMSolo.png"
                            , description = ""
                            }
                        , text "Youtube (Music) "
                        ]
                    )
                }
            --, newTabLink ( socialBox model )
            --    { url = "https://hivesocial.app"
            --    , label = (
            --        row
            --            [ spacing 15 ]
            --            [ image [ width (px 48)
            --                    , height (px 48)
            --                    ]
            --                { src = "Images/HiveSolo.png"
            --                , description = ""
            --                }
            --            , text "Hive "
            --            ]
            --        )
            --    }
            , newTabLink ( socialBox model )
                { url = "https://instagram.com/DNEAVES/"
                , label = (
                    row
                        [ spacing 15 ]
                        [ image [ width (px 48)
                                , height (px 48)
                                ]
                            { src = "Images/InstaSolo.png"
                            , description = ""
                            }
                        , text "Instagram "
                        ]
                    )
                }
            , newTabLink ( socialBox model )
                { url = "https://soundcloud.com/DNEAVES"
                , label = (
                    row
                        [ spacing 15 ]
                        [ image [ width (px 48)
                                , height (px 48)
                                ]
                            { src = "Images/SoundcloudSolo.png"
                            , description = ""
                            }
                        , text "Soundcloud "
                        ]
                    )
                }
            ]
        ]


--view_ : Model -> List (Html Msg)
--view_ model =
--    [ div [ css [ width auto
--                , height (pct 100)
--                , fontFamilies [ "Consolas", "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", "Monaco", "Courier New", "monospace" ]
--                , fontSize (px 32)
--                , textAlign center
--                , verticalAlign middle
--                , margin auto
--                , color (rgb 255 119 0)
--                ]
--          ]
--          [ img [ css
--                    [ top (px 10)
--                    , width auto
--                    , height (px 240)
--                    ]
--                , src "Images/DN logo Trans.png"
--                ]
--                []
--          , div [ css [ textAlign left
--                      , marginLeft (pct 5)
--                      , verticalAlign middle
--                      , width auto
--                      , height auto
--                      ]
--                ]
--                [ div [ css [ float left
--                            , width (pct 47)
--                            , padding (px 5)
--                            ]
--                      ]
--                      [ div [ socialBox model ] [ a [ href "https://dneaves-blog.lamdera.app/"
--                                              ]
--                                              [ img [ socialIcon
--                                                    , src "Images/Lamdera.png"
--
--                                                    ] []
--                                              , text "    Blog"
--                                              ]
--                                          ]
--                      , div [ socialBox model ] [ a [ href "https://twitter.com/DNEAVES/"
--                                              ]
--                                              [ img [ socialIcon
--                                                    , src "Images/TwitSolo.png"
--
--                                                    ] []
--                                              , text "    Twitter"
--                                              ]
--                                          ]
--                      --, div [ socialBox model ] [ a [ href "https://hivesocial.app"
--                      --                        ]
--                      --                        [ img [ socialIcon
--                      --                              , src "Images/HiveSolo.png"
--                      --                              ] []
--                      --                        , text "    Hive"
--                      --                        ]
--                      --                    ]
--                      , div [ socialBox model ] [ a [ href "https://fosstodon.org/@dneaves"
--                                                    , rel "me"
--                                              ]
--                                              [ img [ socialIcon
--                                                    , src "Images/MastSolo.png"
--                                                    ] []
--                                              , text "    Mastodon"
--                                              ]
--                                          ]
--                      , div [ socialBox model ] [ a [ href "https://instagram.com/DNEAVES/"
--                                              ]
--                                              [ img [ socialIcon
--                                                    , src "Images/InstaSolo.png"
--                                                    ] []
--                                              , text "    Instagram"
--                                              ]
--                                          ]
--                      , div [ socialBox model ] [ a [ href "https://youtube.com/@dneavesgaming"
--                                              ]
--                                              [ img [ socialIcon
--                                                    , src "Images/YTGSolo.png"
--                                                    ] []
--                                              , text "    Youtube (Gaming)"
--                                              ]
--                                          ]
--                      , div [ socialBox model ] [ a [ href "https://kick.com/DNEAVES/"
--                                              ]
--                                              [ img [ socialIcon
--                                                    , src "Images/Kick.png"
--                                                    ] []
--                                              , text "    Kick"
--                                              ]
--                                          ]
--                      , div [ socialBox model ] [ a [ href "https://twitch.tv/DNEAVES/"
--                                              ]
--                                              [ img [ socialIcon
--                                                    , src "Images/TwitchSolo.png"
--                                                    ] []
--                                              , text "    Twitch"
--                                              ]
--                                          ]
--                      , div [ socialBox model ] [ a [ href "https://youtube.com/@dneavesmusic"
--                                              ]
--                                              [ img [ socialIcon
--                                                    , src "Images/YTMSolo.png"
--                                                    ] []
--                                              , text "    Youtube (Music)"
--                                              ]
--                                          ]
--                      --, div [ socialBox model ] [ a [ href "https://soundcloud.com/DNEAVES"
--                      --                        ]
--                      --                        [ img [ socialIcon
--                      --                              , src "Images/SoundcloudSolo.png"
--                      --                              ] []
--                      --                        , text "    Soundcloud"
--                      --                        ]
--                      --                    ]
--                      ]
--                ]
--          , div [ css [ float right
--                    , marginRight (pct 5)
--                    , width auto
--                    , height auto
--                    , backgroundColor (rgb 255 255 255)
--                    ]
--                ]
--                --[ div [ css [ width auto
--                --            , height auto
--                --            , padding (px 5)
--                --            ]
--                --      ]
--                --      []
--                --]
--                []
--          ]
--    ]


view : Model -> Browser.Document Msg
view model =
    { title = "DNEAVES' Links"
    , body = [ Element.layout [] (view_ model) ]
    }

--view : Model -> Browser.Document Msg
--view model =
--    { title = "DNEAVES' Links"
--    , body = List.map toUnstyled (view_ model)
--    }



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
                    if viewport.viewport.width > viewport.viewport.height then
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
