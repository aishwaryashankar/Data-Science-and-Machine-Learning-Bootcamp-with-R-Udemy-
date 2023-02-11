library(dplyr)

batting <- read.csv("Batting.csv")

# head of batting dataframe
print(head(batting))

# structure of batting dataframe
print(str(batting))

# head of AB (At Bats) column
print(head(batting$AB))

# head of X2B (doubles) column
print(head(batting$X2B))

# creating batting average (BA) column = H (Hits) / AB (At Base)
batting$BA <- batting$H / batting$AB
# checking last 5 entries of BA column
print(tail(batting$BA,5))

# creating on base percentage (OBP) column = (H + BB + HBP)/(AB + BB + HBP + SF)
batting$OBP <- ((batting$H + batting$BB + batting$HBP) / (batting$AB + batting$BB + batting$HBP + batting$SF))
# checking last 5 entries of OBP column
print(tail(batting$OBP,5))

# creating singles (X1B) column = H-2B-3B-HR
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR
# checking last 5 entries of X1B column
print(tail(batting$X1B,5))

# creating slugging percentage (SLG) column = ((X1B) + (2 X X2B) + (3 X X3B) + (4 X HR)) / AB
batting$SLG <- ((batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR)) / batting$AB
# checking last 5 entries of SLG column
print(tail(batting$SLG,5))

# checking the structure of the dataframe
print(str(batting))

# loading Salaries.csv into a dataframe
sal <- read.csv("Salaries.csv")

# using subset() to reassign batting to only contain data from 1985 onwards, instead of from 1871
batting <- subset(batting, yearID >= 1985)
# checking the year values now present in the dataframe
print(distinct(select(batting,yearID)))
print(summary(batting))

# merging batting data with the salary data
combo <- merge(batting, sal, by=c('playerID','yearID'))
print(summary(combo))

# creating dataframe lost_players (Jason Giambi, Johnny Damon, and Rainer Olmedo)
lost_players <- subset(combo, playerID %in% c('giambja01','damonjo01','saenzol01'))
print(lost_players)

# grabbing rows from the year 2001 and reducing dataframe's columns
lost_players <- subset(lost_players,yearID == 2001)
lost_players <- lost_players[,c('playerID','H','X2B','X3B','HR','OBP','SLG','BA','AB')]
print(head(lost_players))

# finding replacement players for the 3 "lost players"
# Constraints: 
# - The total combined salary of the three players can not exceed 15 million dollars.
# - Their combined number of At Bats (AB) needs to be equal to or greater than the lost players.
# - Their mean OBP had to equal to or greater than the mean OBP of the lost players
find_reps <- filter(combo, yearID==2001)
find_reps <- filter(find_reps, salary < 8000000, OBP>0,AB>=500)
find_reps <- head(arrange(find_reps,desc(OBP)),10)
print(find_reps)
print(find_reps[2:4,])
