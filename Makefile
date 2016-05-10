CFLAGS = -Wall -fPIC
INCLUDES := -I./
LDFLAGS :=
LIBS :=

CC := $(CROSS_COMPILE)gcc

SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

NAME := nx-scaler
LIB_TARGET := lib$(NAME).so

.c.o:
	$(CC) $(INCLUDES) $(CFLAGS) -c $^

$(LIB_TARGET):	$(OBJS)
	$(CC) $(LDFLAGS) -shared -Wl,-soname,$(TARGET) -o $@ $^ $(LIBS)

install: $(LIB_TARGET)
	cp $^ ../sysroot/lib
	cp nx-scaler.h ../sysroot/include

all: $(LIB_TARGET)

.PHONY:	clean

clean:
	rm -f *.o
	rm -f $(LIB_TARGET)
