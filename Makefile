DIRS=$(patsubst %/Makefile,%,$(wildcard */Makefile))

all:
	for i in ${DIRS}; do (cd $$i && make all); done
