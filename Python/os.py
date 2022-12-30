import os

def line():
    print("-"*15)

line()
print("Current OS name: " + os.name)
print("CPU count: " + str(os.cpu_count()))
print("Load average: " + str(os.getloadavg()))
line()
print("Current Working Directory: " + str(os.getcwd()))
print("User number: " + str(os.getuid()))
print("Groups: " + str(os.getgroups()))
line()