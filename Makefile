LUA_CLIB_DIR = ./luaclib

SHARED = -fPIC --shared
CFLAGS = -g -O2 -Wall 	

# lua
LUA_INC ?= 3rd/lua
LUA_TARGET ?= lua

# math3d
MATH3D_DIR = .
MATH3D_OBJS = $(MATH3D_DIR)/libmath.o
MATH3D_TARGET = $(LUA_CLIB_DIR)/math3d.so


all: $(LUA_TARGET) $(MATH3D_TARGET)

.PHONY: all clean

.c.o:
	$(CC) -c $(SHARED) $(CFLAGS) -I$(LUA_INC) $(BUILD_CFLAGS) -o $@ $<

$(LUA_TARGET): 
	cd 3rd/lua && make linux
$(MATH3D_TARGET): $(MATH3D_OBJS)
	$(CC) $(CFLAGS) -I$(LUA_INC) $(SHARED) $^ -o $@
	

clean:
	rm -f $(LUA_CLIB_DIR)/*
	rm -f *.o
	cd 3rd/lua && make clean
