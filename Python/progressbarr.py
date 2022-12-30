import progress.bar as b
from time import sleep

PB = b.PixelBar("PixelBar: ", max=100)
for i in range(100):
    PB.next()
    sleep(.1)

PB.finish()