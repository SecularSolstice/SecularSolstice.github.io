DIRS=$(patsubst %/Makefile,%,$(wildcard */Makefile)) $(patsubst %/Makefile,%,$(wildcard songs/*/Makefile))

all:
	set -eu && for i in ${DIRS}; do (cd $$i && make all); done
