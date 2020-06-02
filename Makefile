CC = gcc
PKGCONFIG = $(shell which pkg-config)
CFLAGS = $(shell $(PKGCONFIG) --cflags gtk+-3.0)
LIBS = $(shell $(PKGCONFIG) --libs gtk+-3.0)
SRC = src/main.c
OBJS = src/main.o

all: main

%.o: %.c
	$(CC) -c -o $(OBJS) $(CFLAGS) $<

main: $(OBJS)
	$(CC) -o $(@F) $(OBJS) $(LIBS)
	rm -f $(OBJS)

clean:
	rm -f $(OBJS)
	rm -f main