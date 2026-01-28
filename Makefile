CC      ?= gcc
RM      ?= rm -f

CFLAGS  ?= -Wall -O2
LDFLAGS ?=
LDLIBS  ?= -lcupsimage -lcups

TARGET  := rastertozj
SRCS    := rastertozj.c
OBJS    := $(SRCS:.c=.o)

# Avoids up-to-date issues
.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	$(RM) $(TARGET) $(OBJS)
