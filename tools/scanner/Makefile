# belak's makefile
# v. 0.5

PROG = scan
OBJS = main.o
LIBS = taglib

CC = g++
CFLAGS = -Werror $(shell taglib-config --cflags) -ggdb
LDFLAGS = -lboost_system -lboost_regex -lboost_filesystem -lboost_program_options $(shell taglib-config --libs)

all: ${PROG}

${MODULES}:
	@make -C $@

${PROG}: ${OBJS}
	@echo ${CC} -o $@
	@${CC} -o $@ $+ ${LDFLAGS}

%.o: %.cpp
	@echo ${CC} -c $@
	@${CC} -c ${CFLAGS} $< -o $@

run: ${PROG}
	@./${PROG}

clean:
	rm -f ${PROG} ${OBJS}

.PHONY: all clean
