
asize = [4, 4, 2, 2]

# frame = [0, 0, 1, 2,
#          0, 0, 3, 4,
#          0, 0, 0, 0, 
#          0, 0, 0, 0,]

frame = [1, 2, 3, 4,
         12, 13, 14, 5,
         11, 16, 15, 6, 
         10, 9, 8, 7,]

# frame = [1, 2, 3, 4, 5, 6,
#          18, 19, 20, 21, 22, 7, 
#          17, 28, 29, 30, 23, 8,
#          16, 27, 26, 25, 24, 9,
#          15, 14, 13, 12, 11, 10,]

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
        return fheight, i

    localIndex = 0
    i = i + 1
    rightBound = localIndex + (wwidth)
    #print("rightbount: ", rightBound)
    while (rightBound <= fwidth):
        if (pathArray[i+1] == 1): 
            isDone = True
            return fheight, i, isDone
 

        pathArray[i] = 1
        print(frame[i], " ")
        i= i+1

        localIndex = localIndex + 1
        rightBound = localIndex + (wwidth)

    fheight = fheight - 1

    return fheight, i, isDone 



def upToDown(i, fheight, fwidth, offset):
    isDone = False
    if (fheight < 0):
        return fwidth, i, isDone

    localIndex = 0
    i = i-1
    lowerBound = localIndex + (wheight)
    #print("lowerBount: ", lowerBound)
    while (lowerBound <= fheight):
        if (pathArray[i+offset] == 1): 
            isDone = True
            return fwidth, i, isDone

        i = i + offset
        pathArray[i] = 1
        print(frame[i])
        
        localIndex = localIndex+1
        lowerBound = localIndex + (wwidth)

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
    #print(l2rDone)
    #print("height: ", fheight)

    u2d = upToDown(i, fheight, fwidth, offset)
    fwidth = u2d[0]
    i = u2d[1]
    u2dDone = u2d[2]
    #print(u2dDone)
    #print("width: ", fwidth)

    r2l = rightToLeft(i, fheight, fwidth)
    fheight = r2l[0]
    i = r2l[1]
    r2lDone = r2l[2]
    #print("height: ", fheight)

    d2u = downToUp(i, fheight, fwidth, offset)
    fwidth = d2u[0]
    i = d2u[1]
    d2uDone = d2u[2]
    #print("width: ", fwidth)



    if (l2rDone == True and u2dDone == True and r2lDone == True and d2uDone == True):
        break
            


print("Done!")




# passTotal = window.size()



# passCount = 0

# for i in window:
#     for j in frame:
#         if ((i - j) < 0.1):
#             passCount = passCount + 1
#             break
        
#     if (passCount == passTotal) :
#         break



# windowIndex = 0
# isTrack = False
# trackArray = []

# for framei in range(len(frame)):

#     if ( (frame[framei] - window[windowIndex]) < 0.1 ):
#         trackArray.append(window[windowIndex])

#         for tracki in range(len(trackArray)):
#             if ( (trackArray[trackArray.size()+1 -tracki] - frame[frame+1 -tracki]) < 0.1):
#                 isTrack = True

#             else:
#                 isTrack = False

        
    