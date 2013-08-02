
CPP = g++ -Wall -O3

fake:
	make all ARCH=$$( echo $${OSTYPE}_$$(uname -m) | sed 's/-/_/g')

all: test_${ARCH}
	./test_${ARCH}

ccxtc_$(ARCH).o: ccxtc.cc ccxtc.h
	@echo Compiling $@
	@${CPP} -fPIC -I ../../deps/xdrfile-1.1.1/include -c ccxtc.cc  -o $@

ccxtc.h:
ccxtc.cc:

libccxtc_${ARCH}.a: ccxtc_${ARCH}.o xdrfile_${ARCH}.o
	@echo Packing ccxtc lib
	@ar rcs libccxtc_${ARCH}.a xdrfile_trr_${ARCH}.o xdrfile_xtc_${ARCH}.o xdrfile_${ARCH}.o ccxtc_${ARCH}.o

xdrfile_${ARCH}.o:
	@echo "Extracting xdr libs"
	echo ${ARCH}
	@ar x ../../deps/xdrfile-1.1.1/${ARCH}/lib/libxdrfile.a
	@mv xdrfile.o xdrfile_${ARCH}.o
	@mv xdrfile_trr.o xdrfile_trr_${ARCH}.o
	@mv xdrfile_xtc.o xdrfile_xtc_${ARCH}.o



test_${ARCH}: test.cc libccxtc_${ARCH}.a
	@ echo Compiling tests
	@${CPP} -o $@ test.cc -lccxtc_${ARCH} -L.
	

test.cc: 

.PHONY: clean

clean:
	rm -f *o *a test_* __.SYMD*
