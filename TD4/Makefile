CC=gcc
CFLAGS:= -std=gnu99
LDFLAGS:= -lfl
SRCS = $(wildcard *.l)

PROGS = $(patsubst %.l,%,$(SRCS))

all: $(PROGS)

%: %.l %.y environ.c environ.h
	bison --file-prefix=$@.y -d $@.y
	$(CC) $(CFLAGS) -c -o $@.y.o $@.y.tab.c
	flex -o $@.c $< 
	$(CC) $(CFLAGS) -c -o $@.o $@.c $(LDFLAGS)
	$(CC) $(CFLAGS) -c -o environ.o environ.c
	$(CC) $(CFLAGS) -o $@ $@.o $@.y.o environ.o

clean :
	rm -f $(PROGS) *.o *.tab*
