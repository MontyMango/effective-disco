import os

print("Current Working Directory: " + str(os.getcwd()))
print("Current OS name: " + os.name)
print("CPU count: " + str(os.cpu_count()))
print("Load average: " + str(os.getloadavg()))
