import strutils
import std/sequtils


let file = open("sources/day01.txt")
let source : string = readAll(file)

var splitStr : seq[string] = rsplit(source,"\r\n\r\n")
var splitMore : seq[seq[string]]

for temp in splitStr :
    splitMore.add rsplit(temp, "\r\n")

var highest : int

var topThree : seq[int] = @[0,0,0]

for x in splitMore:

    var collector : int = 0

    for y in x :
        collector = collector + parseInt(y)

    for i in 0..2:    
        if collector > topThree[i] : 
            topThree.insert(collector, i)    
            topThree.delete(3)
            break


echo topThree

var total = topThree.foldl(a+b)

echo highest
echo total




