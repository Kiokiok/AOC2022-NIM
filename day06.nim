import std/sequtils

let file = open("sources/day06.txt")
var source : string = readAll(file)

echo source.len()


var pcketStrt : seq[char]
var counter : int = 0


proc checkAllDiff() : bool =
    
    for c in pcketStrt:
        if pcketStrt.count(c) > 1:  return false
    echo pcketStrt
    return true

for c in source :
    pcketStrt.add(c)
    if pcketStrt.len() == 14:
        if checkAllDiff() :
            echo counter + 1
            break
        pcketStrt.delete(0)
    counter += 1

echo "done"