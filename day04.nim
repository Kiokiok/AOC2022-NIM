import std/parseutils

let file = open("sources/day04.txt")
var line : string 
var 
    counterContains : int = 0
    counterOver : int = 0

type
    SectionRange = object
        min : int
        max : int

proc contains(self : var SectionRange, other : SectionRange) : bool =
    return other.min >= self.min and other.max <= self.max

proc overlaps(self : var SectionRange, other : SectionRange) : bool =
    return self.min <= other.max and self.max >= other.max

proc makeSectionRange(raw : string) : SectionRange =
    var 
        numToken : string
        minVal : int
        maxVal : int

    var len = raw.parseUntil(numToken, '-', 0)

    var cnt = numToken.parseInt(minVal, 0)

    len = raw.parseUntil(numToken, "\r\n", len + 1)

    cnt = numToken.parseInt(maxVal,0)

    return SectionRange(min : minVal, max : maxVal)

while readLine(file, line) : 

    var token : string
    var len : int = line.parseUntil(token, ',', 0)
    var first : SectionRange = makeSectionRange(token)
    len = line.parseUntil(token, "\r\n", len + 1 )

    var second : SectionRange = makeSectionRange(token) 

    if first.contains(second) or second.contains(first) :
        counterContains += 1

    if first.overlaps(second) or second.overlaps(first):
        counterOver += 1

echo counterContains
echo counterOver