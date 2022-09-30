DIRS=$(patsubst %/Makefile,%,$(wildcard */Makefile))

all:
	set -eu && for i in ${DIRS}; do (cd $$i && make all); done
