import strutils
import tables

let file = open("sources/day03.txt")
var line : string 

var charScores : string = "abcdefghijklmnopqrstuvwxyz"

var totalCount : int

proc calcCharValue(c : char) : int = 
    if c.isLowerAscii : 
        return charScores.find(c) + 1
    else :
       return charScores.find(c.toLowerAscii()) + 27
       


proc firstPart(line : string) =
    var halfLen : int = int(line.len() / 2)
    var firstHalf : string = line.substr(0, halfLen - 1)
    var secondHalf : string = line.substr(halfLen, line.len)
    
    var dupChar : char

    for i in 0..halfLen :
        if firstHalf.contains(secondHalf[i]):
            dupChar = secondHalf[i]
            break

    
    totalCount += calcCharValue(dupChar)


var lineCount : int = 0
var group : seq[string]

proc secondPart(line : string) = 
    group.add(line)
    lineCount += 1

    if lineCount == 3 :
        # for the three lines
        var charFinder : Table[char,int]
        for line in group :
            # for the current line
            var onceCounter : seq[char]
            for c in line :
                if charFinder.hasKey(c) and (not onceCounter.contains(c)):
                    charFinder[c] = charFinder[c] + 1
                    onceCounter.add(c)
                else :
                    if not onceCounter.contains(c):
                        onceCounter.add(c)
                        charFinder[c] = 1
        var
            highestCount : int = 0
            commonChar : char
        for k,v in pairs(charFinder) :
            if v > highestCount :
                highestCount = v
                commonChar = k
        
        #echo commonChar, " = ", highestCount
        totalCount += calcCharValue(commonChar)
        lineCount = 0
        group.setLen(0)



while readLine(file, line) : 
    #firstPart(line)
    secondPart(line)
   
    

echo totalCount    