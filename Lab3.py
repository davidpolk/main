
asize = [4, 4, 2, 2]

frame = [0, 0, 1, 2,
         0, 0, 3, 4,
         0, 0, 0, 0, 
         0, 0, 0, 0]

# frame = [1, 2, 3, 4,
#          12, 13, 14, 5,
#          11, 16, 15, 6, 
#          10, 9, 8, 7]

# frame = [1, 2, 3, 4, 39, 40, 41, 42,
#          18, 19, 20, 21, 31, 32, 43, 44,
#          17, 28, 29, 22, 33, 34, 45, 46,
#          16, 27, 26, 23, 35, 36, 5, 6,
#          15, 14, 13, 24, 37, 38, 7, 8]
          
window = [1, 2,
          3, 4]


fwidth = asize[1]
fheight = asize[0]
wwidth = asize[3]
wheight = asize[2]
foffset = fwidth
woffset = wwidth

print("Frame dimensions: ", fheight, "x", fwidth)
print("Window dimensions: ", wheight, "x", wwidth)

fSize = fwidth*fheight
wsize = wwidth*wheight
pathArray = []

for j in range(fSize):
    pathArray.append(0)



def checkImage(i, min):
    iLocal = i
    sum = 0
    for w in range(wwidth):
        sum = sum + (frame[iLocal] - window[w])
        iLocal = iLocal + 1
    
    iLocal = i
    for h in range(wheight):
        sum = sum + (frame[iLocal + h*foffset] - window[h + h*woffset])
        iLocal = iLocal + 1

    if (abs(sum) < abs(min)):
            min = sum

    return min


def leftToRight(i, fheight, fwidth, min):
    isDone = False 
    if (fwidth < 0):
        return fheight, i, isDone, min

    localIndex = 0
    rightBound = localIndex + (wwidth)
    while (rightBound <= fwidth):
        if (pathArray[i+1] == 1): 
            isDone = True
            return fheight, i, isDone, min
 
        i = i+1
        pathArray[i] = 1
        print(frame[i], " ")
        min = checkImage(i, min)

        localIndex = localIndex + 1
        rightBound = localIndex + (wwidth)

    fheight = fheight - 1

    return fheight, i, isDone , min



def upToDown(i, fheight, fwidth, foffset, min):
    isDone = False
    if (fheight < 0):
        return fwidth, i, isDone, min

    localIndex = 0
    lowerBound = localIndex + (wheight)
    while (lowerBound <= fheight): 
        if (pathArray[i+foffset] == 1): 
            isDone = True
            return fwidth, i, isDone, min

        i = i + foffset
        pathArray[i] = 1
        print(frame[i])
        min = checkImage(i, min)
        
        localIndex = localIndex+1
        lowerBound = localIndex + (wheight)

    fwidth = fwidth - 1
    return fwidth, i, isDone, min


def rightToLeft(i, fheight, fwidth, min):
    isDone = False
    if (fwidth < 0):
        return fheight, i, isDone, min

    localIndex = (fwidth - wwidth)
    while (localIndex >= 0):
        if (pathArray[i-1] == 1): 
            isDone = True
            return fheight, i, isDone, min

        i = i - 1 
        pathArray[i] = 1
        print(frame[i])
        min = checkImage(i, min)

        localIndex = localIndex - 1

    fheight = fheight - 1
    return fheight, i, isDone, min


def downToUp(i, fheight, fwidth, foffset, min):
    isDone = False
    if (fheight < 0):
        return fwidth, i, isDone, min

    localIndex = (fheight - wheight)
    while (localIndex >= 0):
        if (pathArray[i-foffset] == 1): 
            isDone = True
            return fwidth, i, isDone, min

        i = i - foffset 
        pathArray[i] = 1
        print(frame[i])
        min = checkImage(i, min)

        localIndex = localIndex + 1

    fwidth = fwidth - 1
    return fwidth, i, isDone, min
    
i = -1
done = False
min = 1000

while (done == False):
    

    l2r = leftToRight(i, fheight, fwidth, min)
    fheight = l2r[0]
    i = l2r[1]
    l2rDone = l2r[2]
    min = l2r[3]

    u2d = upToDown(i, fheight, fwidth, foffset, min)
    fwidth = u2d[0]
    i = u2d[1]
    u2dDone = u2d[2]
    min = u2d[3]

    r2l = rightToLeft(i, fheight, fwidth, min)
    fheight = r2l[0]
    i = r2l[1]
    r2lDone = r2l[2]
    min = r2l[3]

    d2u = downToUp(i, fheight, fwidth, foffset, min)
    fwidth = d2u[0]
    i = d2u[1]
    d2uDone = d2u[2]
    min = d2u[3]

    

    if (l2rDone == True and u2dDone == True and r2lDone == True and d2uDone == True):
        break
            

print("Minimum Value: ", min)
print("Done!")


        
    
