import std/strutils
import std/sequtils
type
    Stack = object
         val : seq[char]



var storage : seq[Stack]

proc printStorage() =  
    var prnt : string
    for stck in storage:
        for c in stck.val:
            prnt.add(c)
    echo prnt, " - ", prnt.len()


let file = open("sources/day05_2.txt")
var line : string 

var count : int = 0

while readLine(file, line) : 
    storage.add(Stack(val : newSeq[char]()))
    for c in line :
        storage[count].val.add(c)
    count += 1

file.close()

var file2 = open("sources/day05.txt")
var source : string = readAll(file2)
file2.close()

source.stripLineEnd()

let tokens : seq[string] = source.split({' ', '\n', '\r'})


printStorage()

var currentCommand : array[4,int] = [0,0,0,0]
# 0 = index, 1 = AmountToMove, 2 = from, 3 = to

proc clear() = 
    currentCommand = [0,0,0,0]

proc tryParseNum(str : string) =
    if str.contains(Digits):
        var val = str.parseInt()

        currentCommand[currentCommand[0]] = (if currentCommand[0] == 1 : val else: (val - 1 ))
    
proc exec() =
    if currentCommand == [0,0,0,0]: return

    var
        amount = currentCommand[1]
        fromContainer = currentCommand[2]
        toContainer = currentCommand[3]
    #echo "move ", amount, " from ", fromContainer + 1 , " to ", toContainer  + 1
    
    #part 1 
    #for i in 0..amount-1:
    #   storage[toContainer].val.add(storage[fromContainer].val.pop()) 
    
    var ln : int = storage[fromContainer].val.len()
    var rnge = ln-amount..ln-1
    storage[toContainer].val.add(storage[fromContainer].val[rnge])
    storage[fromContainer].val.delete(rnge)


for tok in tokens :
    case tok :
        of "move":
            exec()
            clear()
            currentCommand[0] = 1
        of "from":
            currentCommand[0] = 2
        of "to" :
            currentCommand[0] = 3
        else :
            tryParseNum(tok)

exec()

var result : string

for stck in storage:
    if stck.val.len() > 0:
        result.add(stck.val[stck.val.len() - 1])

printStorage()
echo result