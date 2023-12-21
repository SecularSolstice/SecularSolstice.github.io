all: $(foreach f, $(wildcard */Makefile), ${f}.all)
	echo done making songs

clean: $(foreach f, $(wildcard */Makefile), ${f}.clean)
	echo done

%/Makefile.all: %/Makefile
	cd $(@D) && make all

%/Makefile.clean: %/Makefile
	cd $(@D) && make clean
