.PHONY: clean all


fake:
	make all ARCH=$$( echo $${OSTYPE}_$$(uname -m) | sed 's/-/_/g')

all: xdrfile-1.1.1/${ARCH}/lib/libxdrfile.a

clean:
	rm -Rf xdrfile-1.1.1/

xdrfile-1.1.1 :
	tar xf xdrfile-1.1.1.tar.gz


xdrfile-1.1.1/${ARCH}/lib/libxdrfile.a: xdrfile-1.1.1
	{ cd xdrfile-1.1.1;\
		mkdir ${ARCH};\
		./configure  --enable-static  --enable-shared --prefix=$$PWD/${ARCH} --with-pic;\
		make;\
		make install;\
		make test;\
	}

