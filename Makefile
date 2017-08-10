all:
	@if [ ! -d bin ]; then mkdir bin; fi

	csc -c grammar.scm  -o bin/grammar.o
	csc -c client.scm   -o bin/client.o
	csc -c api-auth.scm -o bin/api-auth.o

	csc photon.scm \
				bin/grammar.o \
				bin/client.o \
				bin/api-auth.o \
			-o bin/photon

clean:
	@if [ -d bin ]; then rm -rf bin; fi
