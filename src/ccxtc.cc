#include <iostream>
#include "ccxtc.h"


extern "C" {
	#include "xdrfile_xtc.h"
	//#include "xdrfile_trr.h"
}


namespace ccxtc{
    using namespace std;
    
    // Constructor, opens the xdr file and creates the matrix
    xtc::xtc( const char fname[] ){
    	int res = read_xtc_natoms((char*) fname, &this->natoms);
        if( res != 0 ) {
            throw 1;
        	cerr << "ERROR: File " << fname << " doesn't exist" << endl;
        }
    	this->fp = xdrfile_open(fname, "r");
    	this->x = new float[natoms][3];
    }
    
    
    xtc::~xtc(){
    	xdrfile_close((XDRFILE*)this->fp);	
    }
    
    
    int xtc::next(){
    	int step;
    	float prec;
    	float box[3][3];
    
    	return read_xtc((XDRFILE*)this->fp, this->natoms, &step, &this->time, box, this->x, &prec);
    }

}
