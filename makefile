#
#	Compiler
#
CC = g++
#
#	Project files
#
SOURCES = $(wildcard *.cpp) $(wildcard */*.cpp) $(wildcard */*/*.cpp)
OBJECTS = $(SOURCES:.cpp=.o)
EXE = analog

#
#	Debug settings
#
DEBUG ?= 0
ifeq ($(DEBUG), 1)
    CFLAGS = -ansi -pedantic -Wall -std=c++11 -g -DMAP
else
	CFLAGS = -ansi -pedantic -Wall -std=c++11
endif

#
#	Build rules
#
$(EXE): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(CFLAGS)

%.o : %.cpp
	$(CC) -o $@ -c $< $(CFLAGS)


#
#	Other rules
#
all: $(EXE)

image:
	./$(EXE) > ./image.pnm

clean:
	rm -f $(OBJECTS) $(EXE)

remake: clean all

debug:
	$(MAKE) DEBUG=1 all

#
#	Valgrind rules (for debugging)
#

valgrind: $(EXE)
	valgrind --leak-check=full --track-origins=yes --show-reachable=yes ./$(EXE)

valgrind-debug:
	$(MAKE) DEBUG=1 valgrind
