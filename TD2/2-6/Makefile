CC=gcc
CFLAGS:= -std=gnu99 -g -O0
LDFLAGS:= -lfl
SRCS = $(wildcard *.l)

PROGS = $(patsubst %.l,%,$(SRCS))

all: $(PROGS)

%: %.l
	flex -o $@.yy.c $<
	$(CC) $(CFLAGS) -c environ.c -o environ.o
	$(CC) $(CFLAGS) -c bilquad.c -o bilquad.o
	$(CC) $(CFLAGS) -o $@ $@.yy.c bilquad.o environ.o $(LDFLAGS)

clean :
	rm $(PROGS) $(PROGS).yy.c *.o
