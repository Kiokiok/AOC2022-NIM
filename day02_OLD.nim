
import tables

type PlayChoice = enum
    Rock = 1, Paper = 2, Scissors = 3

let winValues : seq[int] = @[6,11,13]

let moveTable : Table[char,PlayChoice] = {'A':Rock, 'B':Paper,'C':Scissors,'X':Rock, 'Y':Paper,'Z':Scissors}.toTable


proc computeScore(opponent : PlayChoice, player : PlayChoice) : int =

    if(opponent == player): return 3 + ord player

    int result = (ord opponent) shl 2
    result = result or (ord player)

    if(winValues.contains(result)): return 6 + ord player
   
    return 0 + ord player


let file = open("sources/day02.txt")
var line : string 

var playerScore : int = 0


while readLine(file, line) : 
    playerScore += computeScore(moveTable[line[0]], moveTable[line[2]])

echo playerScore

close file










