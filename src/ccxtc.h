#ifndef _cxtc_h
#define _cxtc_h

namespace ccxtc{
    class xtc{
      public:
    	// Constructor/Destructor
      	xtc(const char fname[]); 
      	~xtc(); 
    
    	int next();	
    
    	// Atributes
    	int natoms;
    	float (*x)[3];
    	float time;
    
      private:
    	void *fp; // File pointer to the xtcfile, attribute is private and needs not to be seen by user. See pimpl idea
    };
}
#endif
