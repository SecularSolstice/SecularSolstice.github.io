all: $(foreach f, $(wildcard */Makefile), ${f}.all)
	echo completed deps: $(foreach f, $(wildcard */Makefile), ${f}.all)
	# These shouldn't do *much*, since they were alread made as deps
	# But we have deps on targets that need to happen in this order
	cd lists && make all && cd ..
	cd misc && make all && cd ..

clean: $(foreach f, $(wildcard */Makefile), ${f}.clean)
	echo done

%/Makefile.all: %/Makefile
	echo  "%%%  making $(@D) %%%" && cd $(@D) && make -j all

%/Makefile.clean: %/Makefile
	cd $(@D) && make clean
