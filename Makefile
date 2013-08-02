.PHONY: clean all deps src install


tgts = deps src

all: ${tgts}
	mkdir -p install
	cp src/cpp/lib*a install
	cp src/cpp/ccxtc.h install
	

clean:
	-rm -Rf install
	-cd deps; make clean
	-cd src/cpp; make clean
	-cd src/py; make clean

deps: 
	cd deps; make

src: deps
	cd src; make


install:
