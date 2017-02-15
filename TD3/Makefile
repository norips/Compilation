CC=gcc
CFLAGS:= -std=gnu99
LDFLAGS:= -lfl
SRCS = $(wildcard *.l)

PROGS = $(patsubst %.auto.l,%,$(SRCS))

all: $(PROGS)

%: %.auto.l %.auto.y
	bison --file-prefix=$@.auto.y -d $@.auto.y
	$(CC) $(CFLAGS) -c -o $@.auto.y.o $@.auto.y.tab.c
	flex -o $@.auto.c $< 
	$(CC) $(CFLAGS) -c -o $@.auto.o $@.auto.c $(LDFLAGS)
	$(CC) $(CFLAGS) -o $@ $@.auto.o $@.auto.y.o

clean :
	rm -f *.tab.*
	rm -f *.o
