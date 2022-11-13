const orgName = "Mishko"
const appName = "Game of Life"
const windowSize = [128, 128]
const windowScale = 6
const fullscreen = false

const fieldWidth = windowSize[0]
const fieldHeight = windowSize[1]

type 
    Cell = ref object
        toUpd: bool
        alive: bool
    Field = array[fieldWidth+1, array[fieldHeight+1, Cell]]
    
proc newCell(tou: bool = true, ali: bool = true): Cell =
    return Cell(toUpd: tou, alive: ali)