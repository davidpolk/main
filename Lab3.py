
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
offset = fwidth

print("Frame dimensions: ", fheight, "x", fwidth,)
print("Window dimensions: ", wheight, "x", wwidth,)

arraysize = fwidth*fheight
pathArray = []

for j in range(arraysize):
    pathArray.append(0)



def leftToRight(i, fheight, fwidth):
    isDone = False 
    if (fwidth < 0):
        return fheight, i, isDone

    localIndex = 0
    rightBound = localIndex + (wwidth)
    while (rightBound <= fwidth):
        if (pathArray[i+1] == 1): 
            isDone = True
            return fheight, i, isDone
 
        i = i+1
        pathArray[i] = 1
        print(frame[i], " ")

        localIndex = localIndex + 1
        rightBound = localIndex + (wwidth)

    fheight = fheight - 1

    return fheight, i, isDone 



def upToDown(i, fheight, fwidth, offset):
    isDone = False
    if (fheight < 0):
        return fwidth, i, isDone

    localIndex = 0
    lowerBound = localIndex + (wheight)
    while (lowerBound <= fheight): 
        if (pathArray[i+offset] == 1): 
            isDone = True
            return fwidth, i, isDone

        i = i + offset
        pathArray[i] = 1
        print(frame[i])
        
        localIndex = localIndex+1
        lowerBound = localIndex + (wheight)

    fwidth = fwidth - 1
    return fwidth, i, isDone


def rightToLeft(i, fheight, fwidth):
    isDone = False
    if (fwidth < 0):
        return fheight, i, isDone

    localIndex = (fwidth - wwidth)
    while (localIndex >= 0):
        if (pathArray[i-1] == 1): 
            isDone = True
            return fheight, i, isDone

        i = i - 1 
        pathArray[i] = 1
        print(frame[i])
        localIndex = localIndex - 1

    fheight = fheight - 1
    return fheight, i, isDone


def downToUp(i, fheight, fwidth, offset):
    isDone = False
    if (fheight < 0):
        return fwidth, i, isDone

    localIndex = (fheight - wheight)
    while (localIndex >= 0):
        if (pathArray[i-offset] == 1): 
            isDone = True
            return fwidth, i, isDone

        i = i - offset 
        pathArray[i] = 1
        print(frame[i])
        localIndex = localIndex + 1

    fwidth = fwidth - 1
    return fwidth, i, isDone
    
i = -1
done = False

while (done == False):
    l2r = leftToRight(i, fheight, fwidth)
    fheight = l2r[0]
    i = l2r[1]
    l2rDone = l2r[2]

    u2d = upToDown(i, fheight, fwidth, offset)
    fwidth = u2d[0]
    i = u2d[1]
    u2dDone = u2d[2]

    r2l = rightToLeft(i, fheight, fwidth)
    fheight = r2l[0]
    i = r2l[1]
    r2lDone = r2l[2]

    d2u = downToUp(i, fheight, fwidth, offset)
    fwidth = d2u[0]
    i = d2u[1]
    d2uDone = d2u[2]



    if (l2rDone == True and u2dDone == True and r2lDone == True and d2uDone == True):
        break
            


print("Done!")


        
    
