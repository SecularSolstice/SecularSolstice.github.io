all: $(foreach f, $(wildcard */Makefile), ${f}.all)
	echo done $(foreach f, $(wildcard */Makefile), ${f}.all)

clean: $(foreach f, $(wildcard */Makefile), ${f}.clean)
	echo done

%/Makefile.all: %/Makefile
	echo  "%%%  making $(@D) %%%" && cd $(@D) && make -j all

%/Makefile.clean: %/Makefile
	cd $(@D) && make clean
