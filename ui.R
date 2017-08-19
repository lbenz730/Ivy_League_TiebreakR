### Shiny Application for Ivy League Tiebreaking Procedures
### By: Luke Benz, Yale Undergraduate Sports Analytics Group
### User Interface

library(shiny)
shinyUI(navbarPage("Ivy League TiebreakR", 
                   tabPanel("Men", id = "sidebar",
                            sidebarLayout(position = "left", 
                                          sidebarPanel(
                                            p(align = "center", "Created By: ", br(), 
                                              a("Luke Benz", href = "http://sports.sites.yale.edu/luke-benz"),
                                              br(), "President, ", a("Yale Undergraduate Sports Analytics Group", 
                                                                     href = "http://sports.sites.yale.edu"), br(), "Summer 2017"),
                                            p(align = "left", "An", span("R Shiny", style = "color:blue") ,"application designed
                                              to assist with Ivy League Basketball tiebreaking procedures. This application 
                                              allows the user to choose the outcome of each remaining Ivy League
                                              basketball game, and then computes which teams advance to the Ivy
                                              League Tournament, handling all of", 
                                              a("those nasty tiebreakers", href = "http://ivymadness.com/information/Tiebreakers"),
                                              "."), 
                                            p("Simply select winners for each of the remaining games for your desired
                                              season permutation and click submit. The winners of completed games are already
                                              filled in with blue circles, though these can be changed if the user desires to 
                                              examine additional hypothetical scenarios. The second team listed in each pair is
                                              the home team."),
                                            p("After filling out all 56 Ivy League Games, click the submit button and scroll 
                                              down to see the \"Season Standings\", and explanations for how/why each tie is broken."),
                                            p(strong("NOTE: "), "For simplicity in the third tiebreaker (analytics), I use my NCAA College Basketball Model's
                                              ", a(href = "http://sports.sites.yale.edu/ncaa-mens-basketball-power-rankings", "YUSAG coefficients"), "(which generally parallels other ranking systems like ESPN BPI or KenPom) 
                                              for the men and",  a(href = "http://www.ncaa.com/rankings/basketball-women/d1/ncaa-womens-basketball-rpi", "NCAA RPI rankings"),
                                              "for the women."),
                                            p("Be sure to follow my Ivy League/NCAA Hoops coverage on Twitter ", 
                                              a("@YaleSportsGroup", href = "https://twitter.com/YaleSportsGroup"), 
                                              "and", a("@recspecs730", href = "https://twitter.com/recspecs730"), "."),
                                            
                                            p(align = "center",
                                              img(src = "Square.png", height = 300, width = 300),
                                              img(src = "http://cdn.bleacherreport.net/images/team_logos/328x328/ivy_league_basketball.png", height = 300, width = 300),
                                              img(src = "https://s-media-cache-ak0.pinimg.com/originals/cb/7e/83/cb7e83c79d2e73dbd5f5918ef3f1bb1a.jpg", height = 300, width = 300),
                                              img(src = "http://www.upenn.edu/almanac/volumes/v63/n21/images/palestra-90th-logo-resized.jpg", height = 300, width = 300),
                                              img(src = "https://s3.amazonaws.com/media.dpn/58946_theivyleaguef.jpg", height = 300, width = 300),
                                              img(src = "http://images.huffingtonpost.com/2013-10-15-IvyLeague.jpg", heigh = 300, width = 300),
                                              img(src = "https://usatftw.files.wordpress.com/2016/03/usatsi_9191746.jpg?w=1000&h=750", height = 300, width = 300))
                                          ),
                                          mainPanel(
                                            ### Jan 5
                                            fluidRow(h3("January 5th"),
                                                     column(3, radioButtons("game_41", label = h5("Princeton @ Penn"),
                                                                            choices = list("Princeton" = "Princeton", "Penn" = "Penn"), selected = games$winner[41]))
                                            ),
                                            
                                            ### Jan 6
                                            fluidRow(h3("January 6th"),
                                                     column(3, radioButtons("game_32", label = h5("Dartmouth @ Harvard"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Harvard" = "Harvard"), selected = games$winner[32]))
                                            ),
                                            
                                            ### Jan 12
                                            fluidRow(h3("January 12th"),
                                                     column(3, radioButtons("game_44", label = h5("Columbia @ Princeton"),
                                                                            choices = list("Columbia" = "Columbia", "Princeton" = "Princeton"), selected = games$winner[44])),
                                                     column(3, radioButtons("game_38", label = h5("Cornell @ Penn"),
                                                                            choices = list("Cornell" = "Cornell", "Penn" = "Penn"), selected = games$winner[38])),
                                                     column(3, radioButtons("game_50", label = h5("Brown @ Yale"),
                                                                            choices = list("Brown" = "Brown", "Yale" = "Yale"), selected = games$winner[50]))
                                            ),
                                            
                                            ### Jan 13
                                            fluidRow(h3("January 13th"),
                                                     column(3, radioButtons("game_45", label = h5("Cornell @ Princeton"),
                                                                            choices = list("Cornell" = "Cornell", "Princeton" = "Princeton"), selected = games$winner[45])),
                                                     column(3, radioButtons("game_37", label = h5("Columbia @ Penn"),
                                                                            choices = list("Columbia" = "Columbia", "Penn" = "Penn"), selected = games$winner[37]))
                                                     
                                            ),
                                            
                                            ### Jan 19
                                            fluidRow(h3("January 19th"),
                                                     column(3, radioButtons("game_7", label = h5("Yale @ Brown"),
                                                                            choices = list("Yale" = "Yale", "Brown" = "Brown"), selected = games$winner[7]))
                                            ),
                                            
                                            ### Jan 20
                                            fluidRow(h3("January 20th"),
                                                     column(3, radioButtons("game_25", label = h5("Harvard @ Dartmouth"),
                                                                            choices = list("Harvard" = "Harvard", "Dartmouth" = "Dartmouth"), selected = games$winner[25])),
                                                     column(3, radioButtons("game_9", label = h5("Cornell @ Columbia"),
                                                                            choices = list("Cornell" = "Cornell", "Columbia" = "Columbia"), selected = games$winner[9]))
                                            ),
                                            
                                            ### Jan 26
                                            fluidRow(h3("January 26th"),
                                                     column(3, radioButtons("game_3", label = h5("Dartmouth @ Brown"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Brown" = "Brown"), selected = games$winner[3])),
                                                     column(3, radioButtons("game_54", label = h5("Harvard @ Yale"),
                                                                            choices = list("Harvard" = "Harvard", "Yale" = "Yale"), selected = games$winner[54]))
                                            ),
                                            
                                            ### Jan 27
                                            fluidRow(h3("January 27th"),
                                                     column(3, radioButtons("game_16", label = h5("Columbia @ Cornell"),
                                                                            choices = list("Columbia" = "Columbia", "Cornell" = "Cornell"), selected = games$winner[16])),
                                                     column(3, radioButtons("game_4", label = h5("Harvard @ Brown"),
                                                                            choices = list("Harvard" = "Harvard", "Brown" = "Brown"), selected = games$winner[4])),
                                                     column(3, radioButtons("game_53", label = h5("Dartmouth @ Yale"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Yale" = "Yale"), selected = games$winner[53]))
                                            ),
                                            
                                            ### Feb 2
                                            fluidRow(h3("February 2nd"),
                                                     column(3, radioButtons("game_36", label = h5("Brown @ Penn"),
                                                                            choices = list("Brown" = "Brown", "Penn" = "Penn"), selected = games$winner[36])),
                                                     column(3, radioButtons("game_49", label = h5("Yale @ Princeton"),
                                                                            choices = list("Yale" = "Yale", "Princeton" = "Princeton"), selected = games$winner[49])),
                                                     column(3, radioButtons("game_17", label = h5("Dartmouth @ Cornell"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Cornell" = "Cornell"), selected = games$winner[17])),
                                                     column(3, radioButtons("game_11", label = h5("Harvard @ Columbia"),
                                                                            choices = list("Harvard" = "Harvard", "Columbia" = "Columbia"), selected = games$winner[11]))
                                            ),
                                            
                                            ### Feb 3
                                            fluidRow(h3("February 3rd"),
                                                     column(3, radioButtons("game_42", label = h5("Yale @ Penn"),
                                                                            choices = list("Yale" = "Yale", "Penn" = "Penn"), selected = games$winner[42])),
                                                     column(3, radioButtons("game_43", label = h5("Brown @ Princeton"),
                                                                            choices = list("Brown" = "Brown", "Princeton" = "Princeton"), selected = games$winner[43])),
                                                     column(3, radioButtons("game_18", label = h5("Harvard @ Cornell"),
                                                                            choices = list("Harvard" = "Harvard", "Cornell" = "Cornell"), selected = games$winner[18])),
                                                     column(3, radioButtons("game_10", label = h5("Dartmouth @ Columbia"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Columbia" = "Columbia"), selected = games$winner[10]))
                                            ),
                                            
                                            ### Feb 6
                                            fluidRow(h3("February 6th"),
                                                     column(3, radioButtons("game_48", label = h5("Penn @ Princeton"),
                                                                            choices = list("Penn" = "Penn", "Princeton" = "Princeton"), selected = games$winner[48]))
                                            ),
                                            
                                            ### Feb 9
                                            fluidRow(h3("February 9th"),
                                                     column(3, radioButtons("game_2", label = h5("Cornell @ Brown"),
                                                                            choices = list("Cornell" = "Cornell", "Brown" = "Brown"), selected = games$winner[2])),
                                                     column(3, radioButtons("game_51", label = h5("Columbia @ Yale"),
                                                                            choices = list("Columbia" = "Columbia", "Yale" = "Yale"), selected = games$winner[51])),
                                                     column(3, radioButtons("game_34", label = h5("Princeton @ Harvard"),
                                                                            choices = list("Princeton" = "Princeton", "Harvard" = "Harvard"), selected = games$winner[34])),
                                                     column(3, radioButtons("game_26", label = h5("Penn @ Dartmouth"),
                                                                            choices = list("Penn" = "Penn", "Dartmouth" = "Dartmouth"), selected = games$winner[26]))
                                            ),
                                            
                                            ### Feb 10
                                            fluidRow(h3("February 10th"),
                                                     column(3, radioButtons("game_1", label = h5("Columbia @ Brown"),
                                                                            choices = list("Columbia" = "Columbia", "Brown" = "Brown"), selected = games$winner[1])),
                                                     column(3, radioButtons("game_52", label = h5("Cornell @ Yale"),
                                                                            choices = list("Cornell" = "Cornell", "Yale" = "Yale"), selected = games$winner[52])),
                                                     column(3, radioButtons("game_33", label = h5("Penn @ Harvard"),
                                                                            choices = list("Penn" = "Penn", "Harvard" = "Harvard"), selected = games$winner[33])),
                                                     column(3, radioButtons("game_27", label = h5("Princeton @ Dartmouth"),
                                                                            choices = list("Princeton" = "Princeton", "Dartmouth" = "Dartmouth"), selected = games$winner[27]))
                                            ),
                                            
                                            ### Feb 16th
                                            fluidRow(h3("February 16th"),
                                                     column(3, radioButtons("game_29", label = h5("Brown @ Harvard"),
                                                                            choices = list("Brown" = "Brown", "Harvard" = "Harvard"), selected = games$winner[29])),
                                                     column(3, radioButtons("game_28", label = h5("Yale @ Dartmouth"),
                                                                            choices = list("Yale" = "Yale", "Dartmouth" = "Dartmouth"), selected = games$winner[28])),
                                                     column(3, radioButtons("game_12", label = h5("Penn @ Columbia"),
                                                                            choices = list("Penn" = "Penn", "Columbia" = "Columbia"), selected = games$winner[12])),
                                                     column(3, radioButtons("game_20", label = h5("Princeton @ Cornell"),
                                                                            choices = list("Princeton" = "Princeton", "Cornell" = "Cornell"), selected = games$winner[20]))
                                            ),
                                            
                                            ### Feb 17th
                                            fluidRow(h3("February 17th"),
                                                     column(3, radioButtons("game_35", label = h5("Yale @ Harvard"),
                                                                            choices = list("Yale" = "Yale", "Harvard" = "Harvard"), selected = games$winner[35])),
                                                     column(3, radioButtons("game_22", label = h5("Brown @ Dartmouth"),
                                                                            choices = list("Brown" = "Brown", "Dartmouth" = "Dartmouth"), selected = games$winner[22])),
                                                     column(3, radioButtons("game_13", label = h5("Princeton @ Columbia"),
                                                                            choices = list("Princeton" = "Princeton", "Columbia" = "Columbia"), selected = games$winner[13])),
                                                     column(3, radioButtons("game_19", label = h5("Penn @ Cornell"),
                                                                            choices = list("Penn" = "Penn", "Cornell" = "Cornell"), selected = games$winner[19]))
                                            ),
                                            
                                            ### Feb 23th
                                            fluidRow(h3("February 23rd"),
                                                     column(3, radioButtons("game_40", label = h5("Harvard @ Penn"),
                                                                            choices = list("Harvard" = "Harvard", "Penn" = "Penn"), selected = games$winner[40])),
                                                     column(3, radioButtons("game_46", label = h5("Dartmouth @ Princeton"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Princeton" = "Princeton"), selected = games$winner[46])),
                                                     column(3, radioButtons("game_8", label = h5("Brown @ Columbia"),
                                                                            choices = list("Brown" = "Brown", "Columbia" = "Columbia"), selected = games$winner[8])),
                                                     column(3, radioButtons("game_21", label = h5("Yale @ Cornell"),
                                                                            choices = list("Yale" = "Yale", "Cornell" = "Cornell"), selected = games$winner[21]))
                                            ),
                                            
                                            ### Feb 24th
                                            fluidRow(h3("February 24th"),
                                                     column(3, radioButtons("game_39", label = h5("Dartmouth @ Penn"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Penn" = "Penn"), selected = games$winner[39])),
                                                     column(3, radioButtons("game_47", label = h5("Harvard @ Princeton"),
                                                                            choices = list("Harvard" = "Harvard", "Princeton" = "Princeton"), selected = games$winner[47])),
                                                     column(3, radioButtons("game_14", label = h5("Yale @ Columbia"),
                                                                            choices = list("Yale" = "Yale", "Columbia" = "Columbia"), selected = games$winner[14])),
                                                     column(3, radioButtons("game_15", label = h5("Brown @ Cornell"),
                                                                            choices = list("Brown" = "Brown", "Cornell" = "Cornell"), selected = games$winner[15]))
                                            ),
                                            
                                            ### March 2
                                            fluidRow(h3("March 2nd"),
                                                     column(3, radioButtons("game_6", label = h5("Princeton @ Brown"),
                                                                            choices = list("Princeton" = "Princeton", "Brown" = "Brown"), selected = games$winner[6])),
                                                     column(3, radioButtons("game_55", label = h5("Penn @ Yale"),
                                                                            choices = list("Penn" = "Penn", "Yale" = "Yale"), selected = games$winner[55])),
                                                     column(3, radioButtons("game_31", label = h5("Cornell @ Harvard"),
                                                                            choices = list("Cornell" = "Cornell", "Harvard" = "Harvard"), selected = games$winner[31])),
                                                     column(3, radioButtons("game_23", label = h5("Columbia @ Dartmouth"),
                                                                            choices = list("Columbia" = "Columbia", "Dartmouth" = "Dartmouth"), selected = games$winner[23]))
                                            ),
                                            
                                            ### March 3
                                            fluidRow(h3("March 3rd"),
                                                     column(3, radioButtons("game_5", label = h5("Penn @ Brown"),
                                                                            choices = list("Penn" = "Penn", "Brown" = "Brown"), selected = games$winner[5])),
                                                     column(3, radioButtons("game_56", label = h5("Princeton @ Yale"),
                                                                            choices = list("Princeton" = "Princeton", "Yale" = "Yale"), selected = games$winner[56])),
                                                     column(3, radioButtons("game_30", label = h5("Columbia @ Harvard"),
                                                                            choices = list("Columbia" = "Columbia", "Harvard" = "Harvard"), selected = games$winner[30])),
                                                     column(3, radioButtons("game_24", label = h5("Cornell @ Dartmouth"),
                                                                            choices = list("Cornell" = "Cornell", "Dartmouth" = "Dartmouth"), selected = games$winner[24]))
                                            ),
                                            
                                            ### Load js for submit
                                            tags$head(tags$script(src = "message.js")),
                                            fluidRow(column(2, offset = 4, actionButton("results", "Submit Schedule"))),
                                            fluidRow(column(6, offset = 3, h2(textOutput("title")))),
                                            fluidRow(column(3, offset = 3, tableOutput("mtable"))),
                                            p(align = "center", uiOutput("explanations"))
                                          )   
                            )
                   ),
                   
                   
                   
                   
                   
                   
                   
                   
                   tabPanel("Women",
                            sidebarLayout(position = "left",
                                          sidebarPanel(
                                            p(align = "center", "Created By: ", br(), 
                                              a("Luke Benz", href = "http://sports.sites.yale.edu/luke-benz"),
                                              br(), "President, ", a("Yale Undergraduate Sports Analytics Group", 
                                                                     href = "http://sports.sites.yale.edu"), br(), "Summer 2017"),
                                            p(align = "left", "An", span("R Shiny", style = "color:blue") ,"application designed
                                              to assist with Ivy League Basketball tiebreaking procedures. This application 
                                              allows the user to choose the outcome of each remaining Ivy League
                                              basketball game, and then computes which teams advance to the Ivy
                                              League Tournament, handling all of", 
                                              a("those nasty tiebreakers", href = "http://ivymadness.com/information/Tiebreakers"),
                                              "."), 
                                            p("Simply select winners for each of the remaining games for your desired
                                              season permutation and click submit. The winners of completed games are already
                                              filled in with blue circles, though these can be changed if the user desires to 
                                              examine additional hypothetical scenarios. The second team listed in each pair is
                                              the home team."),
                                            p("After filling out all 56 Ivy League Games, click the submit button and scroll 
                                              down to see the \"Season Standings\", and explanations for how/why each tie is broken."),
                                            p(strong("NOTE: "), "For simplicity in the third tiebreaker (analytics), I use my NCAA College Basketball Model's
                                              ", a(href = "http://sports.sites.yale.edu/ncaa-mens-basketball-power-rankings", "YUSAG coefficients"), "(which generally parallels other ranking systems like ESPN BPI or KenPom) 
                                              for the men and",  a(href = "http://www.ncaa.com/rankings/basketball-women/d1/ncaa-womens-basketball-rpi", "NCAA RPI rankings"),
                                              "for the women."),
                                            p("Be sure to follow my Ivy League/NCAA Hoops coverage on Twitter ", 
                                              a("@YaleSportsGroup", href = "https://twitter.com/YaleSportsGroup"), 
                                              "and", a("@recspecs730", href = "https://twitter.com/recspecs730"), "."),
                                            p(align = "center",
                                              img(src = "Square.png", height = 300, width = 300),
                                              img(src = "http://cdn.bleacherreport.net/images/team_logos/328x328/ivy_league_basketball.png", height = 300, width = 300),
                                              img(src = "https://s-media-cache-ak0.pinimg.com/originals/cb/7e/83/cb7e83c79d2e73dbd5f5918ef3f1bb1a.jpg", height = 300, width = 300),
                                              img(src = "http://www.upenn.edu/almanac/volumes/v63/n21/images/palestra-90th-logo-resized.jpg", height = 300, width = 300),
                                              img(src = "https://s3.amazonaws.com/media.dpn/58946_theivyleaguef.jpg", height = 300, width = 300),
                                              img(src = "http://images.huffingtonpost.com/2013-10-15-IvyLeague.jpg", heigh = 300, width = 300),
                                              img(src = "https://sports-images.vice.com/images/highlights/meta/2017/03/12/yale-bulldog-pupper-makes-for-the-best-good-boy-celebration-1489342903.jpg?crop=0.961111111111111xw:1xh;center,center&resize=1050:*", height = 300, width = 300))
                                          ),
                                          mainPanel(### Jan 12
                                            fluidRow(h3("January 12th"),
                                                     column(3, radioButtons("wgame_44", label = h5("Columbia @ Princeton"),
                                                                            choices = list("Columbia" = "Columbia", "Princeton" = "Princeton"), selected = wgames$winner[44])),
                                                     column(3, radioButtons("wgame_38", label = h5("Cornell @ Penn"),
                                                                            choices = list("Cornell" = "Cornell", "Penn" = "Penn"), selected = wgames$winner[38])),
                                                     column(3, radioButtons("wgame_50", label = h5("Brown @ Yale"),
                                                                            choices = list("Brown" = "Brown", "Yale" = "Yale"), selected = wgames$winner[50]))
                                                     
                                            ),
                                            
                                            ### Jan 13
                                            fluidRow(h3("January 13th"),
                                                     column(3, radioButtons("wgame_45", label = h5("Cornell @ Princeton"),
                                                                            choices = list("Cornell" = "Cornell", "Princeton" = "Princeton"), selected = wgames$winner[45])),
                                                     column(3, radioButtons("wgame_37", label = h5("Columbia @ Penn"),
                                                                            choices = list("Columbia" = "Columbia", "Penn" = "Penn"), selected = wgames$winner[37]))
                                                     
                                            ),
                                            
                                            ### Jan 19
                                            fluidRow(h3("January 19th"),
                                                     column(3, radioButtons("wgame_7", label = h5("Yale @ Brown"),
                                                                            choices = list("Yale" = "Yale", "Brown" = "Brown"), selected = wgames$winner[7]))
                                            ),
                                            
                                            ### Jan 20
                                            fluidRow(h3("January 20th"),
                                                     column(3, radioButtons("wgame_9", label = h5("Cornell @ Columbia"),
                                                                            choices = list("Cornell" = "Cornell", "Columbia" = "Columbia"), selected = wgames$winner[9]))
                                            ),
                                            
                                            ### Jan 26
                                            fluidRow(h3("January 26th"),
                                                     column(3, radioButtons("wgame_35", label = h5("Yale @ Harvard"),
                                                                            choices = list("Yale" = "Yale", "Harvard" = "Harvard"), selected = wgames$winner[35])),
                                                     column(3, radioButtons("wgame_22", label = h5("Brown @ Dartmouth"),
                                                                            choices = list("Brown" = "Brown", "Dartmouth" = "Dartmouth"), selected = wgames$winner[22]))
                                            ),
                                            
                                            ### Jan 27
                                            fluidRow(h3("January 27th"),
                                                     column(3, radioButtons("wgame_16", label = h5("Columbia @ Cornell"),
                                                                            choices = list("Columbia" = "Columbia", "Cornell" = "Cornell"), selected = wgames$winner[16])),
                                                     column(3, radioButtons("wgame_29", label = h5("Brown @ Harvard"),
                                                                            choices = list("Brown" = "Brown", "Harvard" = "Harvard"), selected = wgames$winner[29])),
                                                     column(3, radioButtons("wgame_28", label = h5("Yale @ Dartmouth"),
                                                                            choices = list("Yale" = "Yale", "Dartmouth" = "Dartmouth"), selected = wgames$winner[28]))
                                            ),
                                            
                                            ### Feb 02
                                            fluidRow(h3("February 2nd"),
                                                     column(3, radioButtons("wgame_30", label = h5("Columbia @ Harvard"),
                                                                            choices = list("Columbia" = "Columbia", "Harvard" = "Harvard"), selected = wgames$winner[30])),
                                                     column(3, radioButtons("wgame_24", label = h5("Cornell @ Dartmouth"),
                                                                            choices = list("Cornell" = "Cornell", "Dartmouth" = "Dartmouth"), selected = wgames$winner[24])),
                                                     column(3, radioButtons("wgame_5", label = h5("Penn @ Brown"),
                                                                            choices = list("Penn" = "Penn", "Brown" = "Brown"), selected = wgames$winner[5])),
                                                     column(3, radioButtons("wgame_56", label = h5("Princeton @ Yale"),
                                                                            choices = list("Princeton" = "Princeton", "Yale" = "Yale"), selected = wgames$winner[56]))
                                            ),
                                            
                                            ### Feb 03
                                            fluidRow(h3("February 3rd"),
                                                     column(3, radioButtons("wgame_31", label = h5("Cornell @ Harvard"),
                                                                            choices = list("Cornell" = "Cornell", "Harvard" = "Harvard"), selected = wgames$winner[31])),
                                                     column(3, radioButtons("wgame_23", label = h5("Columbia @ Dartmouth"),
                                                                            choices = list("Columbia" = "Columbia", "Dartmouth" = "Dartmouth"), selected = wgames$winner[23])),
                                                     column(3, radioButtons("wgame_6", label = h5("Princeton @ Brown"),
                                                                            choices = list("Princeton" = "Princeton", "Brown" = "Brown"), selected = wgames$winner[6])),
                                                     column(3, radioButtons("wgame_55", label = h5("Penn @ Yale"),
                                                                            choices = list("Penn" = "Penn", "Yale" = "Yale"), selected = wgames$winner[55]))
                                            ),
                                            
                                            ### Feb 09
                                            fluidRow(h3("February 9th"),
                                                     column(3, radioButtons("wgame_14", label = h5("Yale @ Columbia"),
                                                                            choices = list("Yale" = "Yale", "Columbia" = "Columbia"), selected = wgames$winner[14])),
                                                     column(3, radioButtons("wgame_15", label = h5("Brown @ Cornell"),
                                                                            choices = list("Brown" = "Brown", "Cornell" = "Cornell"), selected = wgames$winner[15])),
                                                     column(3, radioButtons("wgame_39", label = h5("Dartmouth @ Penn"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Penn" = "Penn"), selected = wgames$winner[39])),
                                                     column(3, radioButtons("wgame_47", label = h5("Harvard @ Princeton"),
                                                                            choices = list("Harvard" = "Harvard", "Princeton" = "Princeton"), selected = wgames$winner[47]))
                                            ),
                                            
                                            ### Feb 10
                                            fluidRow(h3("February 10th"),
                                                     column(3, radioButtons("wgame_8", label = h5("Brown @ Columbia"),
                                                                            choices = list("Brown" = "Brown", "Columbia" = "Columbia"), selected = wgames$winner[8])),
                                                     column(3, radioButtons("wgame_21", label = h5("Yale @ Cornell"),
                                                                            choices = list("Yale" = "Yale", "Cornell" = "Cornell"), selected = wgames$winner[21])),
                                                     column(3, radioButtons("wgame_40", label = h5("Harvard @ Penn"),
                                                                            choices = list("Harvard" = "Harvard", "Penn" = "Penn"), selected = wgames$winner[40])),
                                                     column(3, radioButtons("wgame_46", label = h5("Dartmouth @ Princeton"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Princeton" = "Princeton"), selected = wgames$winner[46]))
                                            ),
                                            
                                            ### Feb 16th
                                            fluidRow(h3("February 16th"),
                                                     column(3, radioButtons("wgame_4", label = h5("Harvard @ Brown"),
                                                                            choices = list("Harvard" = "Harvard", "Brown" = "Brown"), selected = wgames$winner[4])),
                                                     column(3, radioButtons("wgame_53", label = h5("Dartmouth @ Yale"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Yale" = "Yale"), selected = wgames$winner[53])),
                                                     column(3, radioButtons("wgame_12", label = h5("Penn @ Columbia"),
                                                                            choices = list("Penn" = "Penn", "Columbia" = "Columbia"), selected = wgames$winner[12])),
                                                     column(3, radioButtons("wgame_20", label = h5("Princeton @ Cornell"),
                                                                            choices = list("Princeton" = "Princeton", "Cornell" = "Cornell"), selected = wgames$winner[20]))
                                            ),
                                            
                                            ### Feb 17th
                                            fluidRow(h3("February 17th"),
                                                     column(3, radioButtons("wgame_3", label = h5("Dartmouth @ Brown"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Brown" = "Brown"), selected = wgames$winner[3])),
                                                     column(3, radioButtons("wgame_54", label = h5("Harvard @ Yale"),
                                                                            choices = list("Harvard" = "Harvard", "Yale" = "Yale"), selected = wgames$winner[54])),
                                                     column(3, radioButtons("wgame_13", label = h5("Princeton @ Columbia"),
                                                                            choices = list("Princeton" = "Princeton", "Columbia" = "Columbia"), selected = wgames$winner[13])),
                                                     column(3, radioButtons("wgame_19", label = h5("Penn @ Cornell"),
                                                                            choices = list("Penn" = "Penn", "Cornell" = "Cornell"), selected = wgames$winner[19]))
                                                     
                                            ),
                                            
                                            ### Feb 23
                                            fluidRow(h3("February 23rd"),
                                                     column(3, radioButtons("wgame_1", label = h5("Columbia @ Brown"),
                                                                            choices = list("Columbia" = "Columbia", "Brown" = "Brown"), selected = wgames$winner[1])),
                                                     column(3, radioButtons("wgame_52", label = h5("Cornell @ Yale"),
                                                                            choices = list("Cornell" = "Cornell", "Yale" = "Yale"), selected = wgames$winner[52])),
                                                     column(3, radioButtons("wgame_33", label = h5("Penn @ Harvard"),
                                                                            choices = list("Penn" = "Penn", "Harvard" = "Harvard"), selected = wgames$winner[33])),
                                                     column(3, radioButtons("wgame_27", label = h5("Princeton @ Dartmouth"),
                                                                            choices = list("Princeton" = "Princeton", "Dartmouth" = "Dartmouth"), selected = games$winner[27]))
                                                     
                                            ),
                                            
                                            ### Feb 24
                                            fluidRow(h3("February 24th"),
                                                     column(3, radioButtons("wgame_2", label = h5("Cornell @ Brown"),
                                                                            choices = list("Cornell" = "Cornell", "Brown" = "Brown"), selected = wgames$winner[2])),
                                                     column(3, radioButtons("wgame_51", label = h5("Columbia @ Yale"),
                                                                            choices = list("Columbia" = "Columbia", "Yale" = "Yale"), selected = wgames$winner[51])),
                                                     column(3, radioButtons("wgame_34", label = h5("Princeton @ Harvard"),
                                                                            choices = list("Princeton" = "Princeton", "Harvard" = "Harvard"), selected = wgames$winner[34])),
                                                     column(3, radioButtons("wgame_26", label = h5("Penn @ Dartmouth"),
                                                                            choices = list("Penn" = "Penn", "Dartmouth" = "Dartmouth"), selected = wgames$winner[26]))
                                            ),
                                            
                                            ### Mar 2
                                            fluidRow(h3("March 2nd"),
                                                     column(3, radioButtons("wgame_42", label = h5("Yale @ Penn"),
                                                                            choices = list("Yale" = "Yale", "Penn" = "Penn"), selected = wgames$winner[42])),
                                                     column(3, radioButtons("wgame_43", label = h5("Brown @ Princeton"),
                                                                            choices = list("Brown" = "Brown", "Princeton" = "Princeton"), selected = wgames$winner[43])),
                                                     
                                                     column(3, radioButtons("wgame_18", label = h5("Harvard @ Cornell"),
                                                                            choices = list("Harvard" = "Harvard", "Cornell" = "Cornell"), selected = wgames$winner[18])),
                                                     column(3, radioButtons("wgame_10", label = h5("Dartmouth @ Columbia"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Columbia" = "Columbia"), selected = wgames$winner[10]))
                                            ),
                                            
                                            ### Mar 3
                                            fluidRow(h3("March 3rd"),
                                                     column(3, radioButtons("wgame_17", label = h5("Dartmouth @ Cornell"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Cornell" = "Cornell"), selected = wgames$winner[17])),
                                                     column(3, radioButtons("wgame_11", label = h5("Harvard @ Columbia"),
                                                                            choices = list("Harvard" = "Harvard", "Columbia" = "Columbia"), selected = wgames$winner[11])),
                                                     column(3, radioButtons("wgame_36", label = h5("Brown @ Penn"),
                                                                            choices = list("Brown" = "Brown", "Penn" = "Penn"), selected = wgames$winner[36])),
                                                     column(3, radioButtons("wgame_49", label = h5("Yale @ Princeton"),
                                                                            choices = list("Yale" = "Yale", "Princeton" = "Princeton"), selected = wgames$winner[49]))
                                                     
                                                     
                                            ),
                                            
                                            ### Date TBD
                                            fluidRow(h3("Date TBD"),
                                                     column(3, radioButtons("wgame_25", label = h5("Harvard @ Dartmouth"),
                                                                            choices = list("Harvard" = "Harvard", "Dartmouth" = "Dartmouth"), selected = wgames$winner[25])),
                                                     column(3, radioButtons("wgame_32", label = h5("Dartmouth @ Harvard"),
                                                                            choices = list("Dartmouth" = "Dartmouth", "Harvard" = "Harvard"), selected = wgames$winner[32])),
                                                     column(3, radioButtons("wgame_41", label = h5("Princeton @ Penn"),
                                                                            choices = list("Princeton" = "Princeton", "Penn" = "Penn"), selected = wgames$winner[41])),
                                                     column(3, radioButtons("wgame_48", label = h5("Penn @ Princeton"),
                                                                            choices = list("Penn" = "Penn", "Princeton" = "Princeton"), selected = wgames$winner[48]))
                                            ),
                                            
                                            ### Load js for submit
                                            tags$head(tags$script(src = "message.js")),
                                            fluidRow(column(2, offset = 4, actionButton("wresults", "Submit Schedule"))),
                                            fluidRow(column(6, offset = 3, h2(textOutput("wtitle")))),
                                            fluidRow(column(3, offset = 3, tableOutput("wtable"))),
                                            p(align = "center", uiOutput("wexplanations"))
                                            
                                          )
                            )
                   )
                   
))
