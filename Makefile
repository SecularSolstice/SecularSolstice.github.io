DIRS=$(patsubst %/Makefile,%,$(wildcard */Makefile))

allindex:
	for i in ${DIRS}; do (cd $$i && make all); done

index.html: allindex
	./scripts/create-main-index.sh > index.html

all: index.html
