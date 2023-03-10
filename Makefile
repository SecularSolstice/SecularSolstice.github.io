all: $(foreach f, $(wildcard */Makefile), ${f}.all)
	echo done

clean: $(foreach f, $(wildcard */Makefile), ${f}.clean)
	echo done

%/Makefile.all: %/Makefile
	cd $(@D) && make -j all

%/Makefile.clean: %/Makefile
	cd $(@D) && make clean
