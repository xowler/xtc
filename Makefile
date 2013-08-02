.PHONY: clean all deps src install


tgts = deps src

all: ${tgts}
	mkdir -p install
	cp src/lib*a install
	cp src/ccxtc.h install
	

clean:
	-cd deps; make clean
	-cd src; make clean

deps: 
	cd deps; make

src: deps
	cd src; make


install:
