import nico
include constants
include utils

var field: Field
var frame: int = 0
var isPlaying: bool = false
var speed: int = 10
var color: int = 7

proc gameInit() =
    for x in 0..fieldWidth:
        for y in 0..fieldHeight:
            field[x][y] = newCell(false, false)

proc gameUpdate(dt: float32) =
    frame += 1

    if frame mod speed == 0 and isPlaying:
        for x in 0..fieldWidth:
            for y in 0..fieldHeight:
                var surr: int = field.checkSurrounding(x, y)
                case surr:
                of 3: field[x][y].toUpd = true
                of 2: discard
                else: field[x][y].toUpd = false

        for x in 0..fieldWidth:
            for y in 0..fieldHeight:
                field[x][y].alive = field[x][y].toUpd

    if mousebtnp(0):
        let coord = mouse()
        field[coord[0]][coord[1]] = newCell()
    
    if btnp(NicoButton.pcUp):
        isPlaying = not isPlaying
    if btnp(NicoButton.pcRight):
        speed = max(1, speed-1)
    if btnp(NicoButton.pcLeft):
        speed = min(30, speed+1)
    if btnp(NicoButton.pcDown):
        color = (color+1) mod 16

proc gameDraw() =
    cls()
    setColor(color)
    for x, a in field:
        for y, b in a:
            if b.alive:
                pset(x, y)

nico.init(orgName, appName)
nico.createWindow(appName, windowSize[0], windowSize[1], windowScale, fullscreen)
nico.run(gameInit, gameUpdate, gameDraw)