proc checkSurrounding(field: Field, x: int, y: int, debug: bool = false): int =
    var count: int = 0
    var xIter: HSlice[int, int]
    var yIter: HSlice[int, int]

    if x <= 0: xIter = x..x+1
    elif x >= fieldWidth: xIter = x-1..x
    else: xIter = x-1..x+1

    if y <= 0: yIter = y..y+1
    elif y >= fieldHeight: yIter = y-1..y
    else: yIter = y-1..y+1
    
    for i in xIter:
        for j in yIter:
            if field[i][j].alive:
                count += 1

    if field[x][y].alive: return count-1
    else: return count