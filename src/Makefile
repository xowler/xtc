ARCH = x86_64
CPP = g++ -Wall -O3

all: test_${ARCH}
	./test

test_${ARCH}: test.cc libccxtc_${ARCH}.a
	${CPP} -o test test.cc -lccxtc_${ARCH} -L.
	

test.cc: 

libccxtc_${ARCH}.a: ccxtc_${ARCH}.o xdrfile_${ARCH}.o
	ar rcs libccxtc_${ARCH}.a xdrfile_trr_${ARCH}.o xdrfile_xtc_${ARCH}.o xdrfile_${ARCH}.o ccxtc_${ARCH}.o

xdrfile_${ARCH}.o: ../deps/xdrfile-1.1.1/${ARCH}/lib/libxdrfile.a
	ar x ../deps/xdrfile-1.1.1//${ARCH}/lib/libxdrfile.a
	mv xdrfile.o xdrfile_${ARCH}.o
	mv xdrfile_trr.o xdrfile_trr_${ARCH}.o
	mv xdrfile_xtc.o xdrfile_xtc_${ARCH}.o


ccxtc_${ARCH}.o: ccxtc.cc ccxtc.h
	${CPP} -fPIC -I ../deps/xdrfile-1.1.1/include -c ccxtc.cc  -o $@

ccxtc.h:
ccxtc.cc:

.PHONY: clean

clean:
	rm -f *o *a test
