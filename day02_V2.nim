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

    var opponent = line[0]
    var player  = line[2]

    playerScore += computeScore( opponent.toOctal.parseInt - 100, player.toOctal.parseInt - 129)

echo playerScore

close file










