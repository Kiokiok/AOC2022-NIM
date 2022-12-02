import std/strutils

let winValues : seq[int] = @[6,11,13]
 
proc computeScore(opponent : int, player : int) : int =
    
    if(opponent == player): return 3 + player

    int result = (opponent) shl 2
    result = result or (player)

    if(winValues.contains(result)): return 6 +  player
   
    return 0 + player


let file = open("sources/day02.txt")
var line : string 

var playerScore : int = 0


while readLine(file, line) : 

    var opponent : int = line[0].toOctal.parseInt - 100
    var player : int = line[2].toOctal.parseInt

    var outcome : int = player - 131
    
    outcome = (opponent + outcome)
    if outcome == 0 : outcome = 3
    if outcome == 4 : outcome = 1

    playerScore += computeScore(opponent, outcome)

echo playerScore

close file










