library(shiny)
source("global.R")

shinyServer(function(input, output, session) {
  v <- reactiveValues(Rank = NULL, Team = NULL, Wins = NULL, Losses = NULL, text = NULL, html = NULL)
  wv <- reactiveValues(Rank = NULL, Team = NULL, Wins = NULL, Losses = NULL, text = NULL, html = NULL) 
  
  ### Men
  observeEvent(input$results, {
    winners <- c(input$game_1, input$game_2, input$game_3, input$game_4,
                 input$game_5, input$game_6, input$game_7, input$game_8,
                 input$game_9, input$game_10, input$game_11, input$game_12,
                 input$game_13, input$game_14, input$game_15, input$game_16,
                 input$game_17, input$game_18, input$game_19, input$game_20,
                 input$game_21, input$game_22, input$game_23, input$game_24,
                 input$game_25, input$game_26, input$game_27, input$game_28,
                 input$game_29, input$game_30, input$game_31, input$game_32,
                 input$game_33, input$game_34, input$game_35, input$game_36,
                 input$game_37, input$game_38, input$game_39, input$game_40,
                 input$game_41, input$game_42, input$game_43, input$game_44,
                 input$game_45, input$game_46, input$game_47, input$game_48,
                 input$game_49, input$game_50, input$game_51, input$game_52,
                 input$game_53, input$game_54, input$game_55, input$game_56)
    
    if(length(winners) < 56)  {
      v$Rank <- NULL
      v$Team <- NULL
      v$Wins <- NULL
      v$Losses <- NULL 
      v$text <- NULL
      v$messages <- ""
      v$vs <- NULL
      
      session$sendCustomMessage(type = "message",
                                message = "Error: Please choose a winner for each game")
    }
    else{
      tmp <- tiebreak(games, "M", winners)
      v$Rank <- 1:8
      v$Team <- tmp$team
      v$Wins <- as.character(tmp$wins)
      v$Losses <- as.character(14 - tmp$wins)
      v$text <- "Season Standings"
      messages <- tmp$messages
      v$html = "<ul>"
      for(i in 1:length(messages)) {
        v$html <- paste(v$html, "<li>", messages[i], "</li>", sep = "")
      }
      v$html <- paste(v$html, "</ul>", sep = "")
    }
    
  })
  
  output$title <- renderText(v$text)
  output$mtable <- renderTable({data.frame("Rank" = v$Rank, 
                                           "Team" = v$Team,
                                           "Wins" = v$Wins,
                                           "Losses" = v$Losses,
                                           stringsAsFactors = F)})
  output$explanations <- renderUI(HTML(v$html))
 
  
  
  ### Women
  observeEvent(input$wresults, {
    wwinners <- c(input$wgame_1, input$wgame_2, input$wgame_3, input$wgame_4,
                  input$wgame_5, input$wgame_6, input$wgame_7, input$wgame_8,
                  input$wgame_9, input$wgame_10, input$wgame_11, input$wgame_12,
                  input$wgame_13, input$wgame_14, input$wgame_15, input$wgame_16,
                  input$wgame_17, input$wgame_18, input$wgame_19, input$wgame_20,
                  input$wgame_21, input$wgame_22, input$wgame_23, input$wgame_24,
                  input$wgame_25, input$wgame_26, input$wgame_27, input$wgame_28,
                  input$wgame_29, input$wgame_30, input$wgame_31, input$wgame_32,
                  input$wgame_33, input$wgame_34, input$wgame_35, input$wgame_36,
                  input$wgame_37, input$wgame_38, input$wgame_39, input$wgame_40,
                  input$wgame_41, input$wgame_42, input$wgame_43, input$wgame_44,
                  input$wgame_45, input$wgame_46, input$wgame_47, input$wgame_48,
                  input$wgame_49, input$wgame_50, input$wgame_51, input$wgame_52,
                  input$wgame_53, input$wgame_54, input$wgame_55, input$wgame_56)
    
    if(length(wwinners) < 56)  {
      wv$Rank <- NULL
      wv$Team <- NULL
      wv$Wins <- NULL
      wv$Losses <- NULL 
      wv$text <- NULL
      wv$messages <- ""
      session$sendCustomMessage(type = "message",
                                message = "Error: Please choose a winner for each game")
    }
    else{
      wtmp <- tiebreak(games, "W", wwinners)
      wv$Rank <- 1:8
      wv$Team <- wtmp$team
      wv$Wins <- as.character(wtmp$wins)
      wv$Losses <- as.character(14 - wtmp$wins)
      wv$text <- "Season Standings"
      wmessages <- wtmp$messages
      wv$html = "<ul>"
      for(i in 1:length(wmessages)) {
        wv$html <- paste(wv$html, "<li>", wmessages[i], "</li>", sep = "")
      }
      wv$html <- paste(wv$html, "</ul>", sep = "")
    }
    
  })
  
  output$wtitle <- renderText(wv$text)
  output$wtable <- renderTable({data.frame("Rank" = wv$Rank, 
                                           "Team" = wv$Team,
                                           "Wins" = wv$Wins,
                                           "Losses" = wv$Losses,
                                           stringsAsFactors = F)})
  output$wexplanations <- renderUI(HTML(wv$html))
})
