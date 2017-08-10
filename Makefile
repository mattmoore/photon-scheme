all:
	@if [ ! -d bin ]; then mkdir bin; fi

	csc -c filters.scm  -o bin/filters.o
	csc -c config.scm   -o bin/config.o
	csc -c client.scm   -o bin/client.o
	csc -c api-auth.scm -o bin/api-auth.o

	csc photon.scm \
	    bin/filters.o bin/config.o bin/client.o bin/api-auth.o \
		  -o bin/photon

clean:
	@if [ -d bin ]; then rm -rf bin; fi
