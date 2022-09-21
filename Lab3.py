
asize = [4, 4, 2, 2]

frame = [0, 0, 1, 2,
         0, 0, 3, 4,
         0, 0, 0, 0, 
         0, 0, 0, 0]

window = [1, 2,
          3, 4]

# frame = [1, 2, 3, 4,
#          12, 13, 14, 5,
#          11, 16, 15, 6, 
#          10, 9, 8, 7]

# asize = [5, 8, 2, 2]

# frame = [1, 2, 3, 4, 39, 40, 41, 42,
#          18, 19, 20, 21, 31, 32, 43, 44,
#          17, 28, 29, 22, 33, 34, 45, 46,
#          16, 27, 26, 23, 35, 36, 5, 6,
#          15, 14, 13, 24, 37, 38, 7, 8]
          
# window = [1, 2,
#           3, 4]

# asize = [32, 32, 8, 4 ]

# frame = [1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 
#         1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 
#         1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 
#         1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 
#         1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 
#         1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 
#         1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 
#         1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 
#         1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
#         1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8 ]

# window = [9, 9, 9, 9, 
#           9, 9, 9, 9, 
#           9, 9, 9, 9, 
#           9, 9, 9, 9, 
#           9, 9, 9, 9, 
#           9, 9, 9, 9, 
#           9, 9, 9, 9, 
#           9, 9, 9, 9]

fheight = asize[0]
fwidth = asize[1]
wheight = asize[2]
wwidth = asize[3]

foffset = fwidth
woffset = wwidth

print("Frame dimensions: ", fheight, "x", fwidth)
print("Window dimensions: ", wheight, "x", wwidth)

fSize = fwidth*fheight
wsize = wwidth*wheight


def checkImage(i, min, min_position):
    iLocal = i
    sum = 0
    
    
    iLocal = i
    for h in range(wheight):
        for w in range(wwidth):
            print("Frame i: ", frame[iLocal + w + h*foffset], "window i: ", window[w + h*woffset])
            sum = sum + (frame[iLocal + w + h*foffset] - window[w + h*woffset])

    print("sum: ", sum)
    print()

    if (abs(sum) < abs(min)):
            min = sum
            min_position = i

    return min, min_position
    


def leftToRight(i, fheight, fwidth, min, min_position):
    isDone = False 
    localIndex = 0
    maxTravel = fwidth - wwidth

    if (maxTravel < 0):
        fheight = fheight - 1
        isDone = True
        return fheight, i, isDone, min, min_position
    
    while (localIndex <= maxTravel): 
        i = i+1
        print(frame[i])
        min, min_position = checkImage(i, min, min_position)
        localIndex = localIndex + 1

    fheight = fheight - 1
    return fheight, i, isDone , min, min_position



def upToDown(i, fheight, fwidth, foffset, min, min_position):
    isDone = False 
    localIndex = 0
    maxTravel = fheight - wheight

    if (maxTravel < 0):
        fwidth = fwidth - 1
        isDone = True
        return fwidth, i, isDone, min, min_position

    while (localIndex <= maxTravel): 
        i = i + foffset
        print(frame[i])
        min, min_position = checkImage(i, min, min_position)
        localIndex = localIndex+1

    fwidth = fwidth - 1
    return fwidth, i, isDone, min, min_position


def rightToLeft(i, fheight, fwidth, min, min_position):
    isDone = False
    localIndex = (fwidth - wwidth)
    maxTravel = fwidth - wwidth

    if (maxTravel < 0):
        fheight = fheight - 1
        isDone = True
        return fheight, i, isDone, min, min_position

    
    while (localIndex >= 0):
        i = i - 1 
        print(frame[i])
        min, min_position = checkImage(i, min, min_position)
        localIndex = localIndex - 1

    fheight = fheight - 1
    return fheight, i, isDone, min, min_position


def downToUp(i, fheight, fwidth, foffset, min, min_position):
    isDone = False
    localIndex = (fheight - wheight)
    maxTravel = fheight - wheight

    if (maxTravel < 0):
        fwidth = fwidth - 1
        isDone = True
        return fwidth, i, isDone, min, min_position

    while (localIndex >= 0):
        i = i - foffset 
        print(frame[i])
        min, min_position = checkImage(i, min, min_position)
        localIndex = localIndex - 1

    fwidth = fwidth - 1
    return fwidth, i, isDone, min, min_position
    
i = -1
done = False
min = 1000
min_position = 0

while (done == False):

    #print("L2R")
    l2r = leftToRight(i, fheight, fwidth, min, min_position)
    fheight = l2r[0]
    i = l2r[1]
    l2rDone = l2r[2]
    min = l2r[3]
    min_position = l2r[4]

    #print("U2D")
    u2d = upToDown(i, fheight, fwidth, foffset, min, min_position)
    fwidth = u2d[0]
    i = u2d[1]
    u2dDone = u2d[2]
    min = u2d[3]
    min_position = u2d[4]

    #print("R2L")
    r2l = rightToLeft(i, fheight, fwidth, min, min_position)
    fheight = r2l[0]
    i = r2l[1]
    r2lDone = r2l[2]
    min = r2l[3]
    min_position = r2l[4]

    #print("D2U")
    d2u = downToUp(i, fheight, fwidth, foffset, min, min_position)
    fwidth = d2u[0]
    i = d2u[1]
    d2uDone = d2u[2]
    min = d2u[3]
    min_position = d2u[4]
    

    if (l2rDone == True and u2dDone == True and r2lDone == True and d2uDone == True):
        break
            

print("Minimum Value: ", min, "Position: ", min_position)
print("Done!")


        
    
