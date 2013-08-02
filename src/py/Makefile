OPTS = -Wundef  -shared -pthread -fPIC -fwrapv -g -fno-strict-aliasing 
INCS = -I ../cpp/\
	   -I /home/jimenc/data/share/epd-7.3-1-rh5-x86_64/include/python2.7/\
	   -I /home/jimenc/data/share/epd-7.3-1-rh5-x86_64/lib/python2.7/site-packages/numpy/core/include\
	   -I /usr/include/python2.7/\
	   -I /Applications/Canopy.app/appdata/canopy-1.0.3.1262.macosx-x86_64/Canopy.app/Contents/lib/python2.7/site-packages/numpy/core/include

fake:
	make all ARCH=$$( echo $${OSTYPE}_$$(uname -m) | sed 's/-/_/g')
	

all:  pyxtc_${ARCH}.so
	python test.py


pyxtc_${ARCH}.so: pyxtc_${ARCH}.cpp
	#g++ -lpython2.7 ${OPTS} ${INCS} -L ../cpp/  pyxtc_${ARCH}.cpp -Wl,--whole-archive   -lccxtc_${ARCH} -Wl,--no-whole-archive   -o pyxtc_${ARCH}.so
	g++ -L /Applications/Canopy.app/appdata/canopy-1.0.3.1262.macosx-x86_64/Canopy.app/Contents/lib/ -lpython2.7 ${OPTS} ${INCS} -L ../cpp/  pyxtc_${ARCH}.cpp -lccxtc_${ARCH}   -o pyxtc_${ARCH}.so



pyxtc_${ARCH}.cpp: pyxtc_${ARCH}.pyx
	cython --cplus pyxtc_${ARCH}.pyx


pyxtc_${ARCH}.pyx: pyxtc.template.pyx
	cat pyxtc.template.pyx  | sed -e s/ARCH/${ARCH}/g > $@

pyxtc.template.pyx:


.PHONY: clean all


clean:
	rm -f *cpp *so  *pyc pyxtc_*
