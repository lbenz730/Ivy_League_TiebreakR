library(XML)

games <- read.csv("games.csv", as.is = T)
wgames <- read.csv("wgames.csv", as.is = T)


tiebreak <- function(data, gender, winners) {
  ivy <- unique(data$home)
  messages <- vector()

  
  ### Set winners and losers
  data$winner <- winners
  data$loser <- NA
  for(i in 1:nrow(data)) {
    if(data$winner[i] == data$home[i]) {
      data$loser[i] <- data$away[i]
    }
    else{
      data$loser[i] <- data$home[i]
    }
  }
  
  # get team win totals 
  wins <- vector()
  for(i in 1:8) {
    wins[i] <- sum(data$winner == ivy[i])
  }
  
  # H2H records (Row Team Wins Over Column Team)
  head2head <- matrix(nrow = 8, ncol = 8)
  colnames(head2head) <- ivy
  rownames(head2head) <- ivy
  for(i in 1:8) {
    for(k in 1:8) {
      head2head[i,k] <- sum(data$winner == ivy[i] & data$loser == ivy[k])
    }
  }
  
  # Get order of finish Pre-Tiebreak
  preBreak <- sort(wins, decreasing = T)
  prebreak_pos <- vector()
  for(z in 1:8) {
    prebreak_pos[z] <- c(1:length(ivy))[preBreak == wins[z]][1]
  }
  
  # Break any ties
  for(i in 1:(length(ivy) - 1)) {
    sub_message_1 <- vector()
    sub_message_2 <- vector()
    if(sum(prebreak_pos == i) > 1){
      # Get teams to between which to break tie
      teams <- ivy[prebreak_pos == i]
      tie <- length(teams)
      teamIDs <- c(1:length(ivy))[is.element(ivy, teams)]
      
      # Tiebreak 1 (H2H)
      h2h <- rep(0, length(teams))
      for(z in 1:length(teams)) {
        h2h[z] <- sum(head2head[teams[z], teams[-z]])
      }
      if(sum(h2h == max(h2h)) == 1) {
        winner <- teams[grep(max(h2h), h2h)]
        winnerID <- teamIDs[grep(max(h2h), h2h)]
        # Winner wins tie-break
        wins[winnerID] <- wins[winnerID] + 0.1 * tie
        # Change current standing of losers
        change <- teams[teams != winner]
        prebreak_pos[is.element(ivy, change)] <- i + 1
        
        # Return explanation
        j <- length(change)
        if(j == 1) {
          losers <- change
        }else{ 
          losers <- paste(paste(change[-j], collapse = ", "), "and", change[j], sep = " ")
        }
        message <- paste(winner, "beats", losers, "in Tiebreak 1 (Head To Head)", sep = " ")
        messages <- c(messages, message)
        next
      }
      else if(sum(h2h == max(h2h)) > 1 & sum(h2h == max(h2h)) < length(teams)){
        change <- setdiff(teams, teams[grep(max(h2h), h2h)])
        teams <- teams[grep(max(h2h), h2h)]
        j <- length(change)
        if(j == 1) {
          eliminated <- change
        }else{ 
          eliminated <- paste(paste(change[-j], collapse = ", "), "and", change[j], sep = " ")
        }
        sub_message_1 <- paste(eliminated, "eliminated in Tiebreak 1 (Head To Head)", sep = " ")
        prebreak_pos[is.element(ivy,change)] <- i + 1
      }
      
      # Tiebreak 2 (Record vs. 1-8, descending order)
      for(z in 1:length(ivy)) {
        if(z == i) {
          next
        }
        comp_teams <- ivy[prebreak_pos == z]
        comp_teamsIDs <- c(1:length(ivy))[is.element(ivy, comp_teams)]
        
        h2h <- rep(0, length(teams))
        for(k in 1:length(teams)) {
          h2h[k] <- sum(head2head[teams[k], comp_teams])
        }
        
        if(sum(h2h == max(h2h)) == 1) {
          winner <- teams[grep(max(h2h), h2h)]
          winnerID <- teamIDs[grep(max(h2h), h2h)]
          # Winner wins tie-break
          wins[winnerID] <-  wins[winnerID] + 0.1 * tie
          # Change current standing of losers
          change <- teams[teams != winner]
          prebreak_pos[is.element(ivy, change)] <- i + 1
          
          j <- length(change)
          m <- length(comp_teams)
          if(j == 1) {
            losers <- change
          }
          else{
            losers <- paste(paste(change[-j], collapse = ", "), ", and ", change[j], sep = "")
          }
          if(m == 1) {
            comps <- comp_teams
          }
          else{
            comps <- paste(paste(comp_teams[-m], collapse = ", "), ", and ", comp_teams[m], sep = "")
          }
          message <- paste(winner, "beats", losers, "
                           in Tiebreak 2 (Record vs. 1-8, descending order) by virture of better record against", comps, sep = " ")
          if(length(sub_message_1) == 1) {
            message <- paste(message, " [", sub_message_1, "]", sep = "")
          }
          messages <- c(messages, message)
          break
        }
        else if(sum(h2h == max(h2h)) > 1 & sum(h2h == max(h2h)) < length(teams)){
          change <- setdiff(teams, teams[grep(max(h2h), h2h)])
          teams <- teams[grep(max(h2h), h2h)]
          j <- length(change)
          if(j == 1) {
            eliminated <- change
          }else{ 
            eliminated <- paste(paste(change[-j], collapse = ", "), "and", change[j], sep = " ")
          }
          sub_message_2 <- paste(eliminated, "eliminated in Tiebreak 2 (Head To Head)", sep = " ")
          prebreak_pos[is.element(ivy,change)] <- i + 1
        }
      }
      if(z < 8){
        next
      }
      
      # Tiebreak 3 (Analytics)
      if(gender == "M") {
        powranks <- read.csv("https://raw.githubusercontent.com/lbenz730/NCAA_Hoops/master/2.0_Files/Power_Rankings/Powerrankings.csv",
                             as.is = T)
        tmp <- powranks[is.element(powranks$Team, teams),]
        tmp <- tmp[order(tmp$Team),]
        winner <- tmp$Team[grep(max(tmp$YUSAG_Coefficient), tmp$YUSAG_Coefficient)]
      }
      else{
        url <- "http://www.ncaa.com/rankings/basketball-women/d1/ncaa-womens-basketball-rpi"
        tmp <- as.data.frame(readHTMLTable(url)[[1]], stringsAsFactors = F)
        tmp$SCHOOL <- as.character(tmp$SCHOOL)
        tmp$rank <- 1:nrow(tmp)
        tmp <- tmp[is.element(tmp$SCHOOL, teams),]
        tmp <- tmp[order(tmp$SCHOOL),]
        winner <- tmp$SCHOOL[grep(min(tmp$rank), tmp$rank)]
      }
      
      
      # Winner wins tie-break
      winnerID <- c(1:8)[ivy == winner]
      wins[winnerID] <- wins[winnerID] + 0.1 * length(teams)
      # Change current standing of losers
      change <- teams[teams != winner]
      prebreak_pos[is.element(ivy, change)] <- i + 1
      
      j <- length(change)
      if(j == 1) {
        losers <- change
      }else{ 
        losers <- paste(paste(change[-j], collapse = ", "), ", and ", change[j], sep = "")
      }
      message <- paste(winner, "beats", losers, "in Tiebreak 3 (Analytics)", sep = " ")
      if(length(sub_message_1) == 1) {
        message <- paste(message, " [", sub_message_1, "]", sep = "")
      }
      if(length(sub_message_2) == 1) {
        message <- paste(message, " [", sub_message_2, "]", sep = "")
      }
      messages <- c(messages, message)
      next
    }
  }
  
  if(length(messages) == 0){
    messages <- "No Tiebreaks!"
  }
  
  
  
  return(list("team" = ivy[order(prebreak_pos)],
              "wins" = floor(wins[order(prebreak_pos)]),
              "messages" = messages))
}

