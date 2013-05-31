.PHONY: clean all

all: xdrfile-1.1.1/x86_64/lib/libxdrfile.a

clean:
	rm -Rf xdrfile-1.1.1/

xdrfile-1.1.1 :
	tar xf xdrfile-1.1.1.tar.gz


xdrfile-1.1.1/x86_64/lib/libxdrfile.a: xdrfile-1.1.1
	{ cd xdrfile-1.1.1;\
		mkdir $$(uname -m);\
		./configure  --enable-static  --enable-shared --prefix=$$PWD/$$(uname -m) --with-pic;\
		make;\
		make install;\
		make test;\
	}

