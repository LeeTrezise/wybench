import whiley.io.*

[int] sort([int] items):
    if |items| > 1:
        pivot = |items| / 2
        lhs = sort(items[..pivot])
        rhs = sort(items[pivot..])
        l,r,i = (0,0,0)
        while i < |items| && l < |lhs| && r < |rhs|:
            if lhs[l] <= rhs[r]:
                items[i] = lhs[l] 
                l=l+1
            else:
                items[i] = rhs[r] 
                r=r+1
            i=i+1
        while l < |lhs|:
            items[i] = lhs[l]
            i=i+1 
            l=l+1
        while r < |rhs|:
            items[i] = rhs[r] 
            i=i+1 
            r=r+1
    return items

(int,int) parseInt(int pos, string input):
    start = pos
    while pos < |input| && isDigit(input[pos]):
        pos = pos + 1
    if pos == start:
        throw "Missing number"
    return str2int(input[start..pos]),pos

int skipWhiteSpace(int index, string input):
    while index < |input| && isWhiteSpace(input[index]):
        index = index + 1
    return index

bool isWhiteSpace(char c):
    return c == ' ' || c == '\t' || c == '\n' || c == '\r'

void System::main([string] args):
    file = this.openReader(args[0])
    input = ascii2str(file.read())
    pos = 0
    data = []
    pos = skipWhiteSpace(pos,input)
    // first, read data
    while pos < |input|:
        i,pos = parseInt(pos,input)
        data = data + i
        pos = skipWhiteSpace(pos,input)
    // second, sort data    
    data = sort(data)
    // third, print output
    out.print(str(data))