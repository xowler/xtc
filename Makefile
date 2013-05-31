.PHONY: clean all deps src


tgts = deps src

all: ${tgts}

clean:
	-cd deps; make clean
	-cd src; make clean

deps: 
	cd deps; make

src: deps
	cd src; make
