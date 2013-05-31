#include <iostream>
#include "ccxtc.h"


using namespace std;
using namespace ccxtc;

#define abs(x) ((((x)>0)?(x):-(x) ))
#define check(a,b,c) { \
	if ( abs(a-b)<0.001 ){\
	 	cerr << "PASSED: " << c << endl; \
	} else { \
		cerr << "FAILED: " << c << "("<<a<<" "<<b<<")"<<endl;\
	}\
}

int main(void){

  { 
    cout << "TESTING XTC"  << endl; 
    int err = 0;
    try{
    	xtc x("doesnt_exist.xtc");
    }
    catch ( int i ){
        err = i;
    }
    check(err, 1, "Does not exist");


    xtc f("test.xtc");
	check(f.natoms, 314,"Number of atoms");
	

    int nframes=0;
    while(1){
        if(f.next() == 0)
            nframes = nframes + 1;
        else
            break;
    }
	check(nframes, 100, "Number of frames")
    check(3.649, f.x[f.natoms-1][2], "Position of an atom" );
  }

}

//
