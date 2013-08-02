import sys
cimport cython
import numpy as np
cimport numpy as np


cdef extern from "ccxtc.h" namespace "ccxtc":
    cdef cppclass xtc:
        xtc(char []) except +
        int next()
        int natoms
        float (*x)[3]
        float time

cdef extern from "string.h":# namespace "std":
    void *memcpy(void *, void *, size_t )

cdef class pyxtc_ARCH:
    cdef xtc *thisptr
    cpdef np.ndarray xx

    def __cinit__(self, char fname[]):
        try:
            self.thisptr = new xtc(fname)
        except Exception, e:
            raise Exception('File not found - %s\n'%fname)

        self.xx = np.zeros([self.thisptr.natoms,3], dtype=np.float)

    def __dealloc__(self):
        del self.thisptr

    property natoms:
        def __get__(self):
            return self.thisptr.natoms

    property time:
        def __get__(self):
            return self.thisptr.time

    property x:
        def __get__(self):
            return self.xx

    @cython.boundscheck(False)
    def next(self):
        cdef np.ndarray dd = np.zeros([self.natoms,3],np.float32, order='C')
        res = self.thisptr.next()

        if res==0:
            memcpy(dd.data, self.thisptr.x,12*self.natoms)
            self.xx = dd[:]
        
        return res
    
    @cython.boundscheck(False)
    def nextx(self):
        res = self.next()
        if res == 11:
            raise Exception('Reached end of file')
        return self.xx

    @cython.boundscheck(False)
    def traj(self, atoms=None, frm=0, end=-1, stride=1):
        """
            traj(self, atoms=None, frm=0, end=-1, stride=1)
        """
        [self.next() for i in range(frm)]
        xs = []
        i = frm
        while self.next()==0:
            if i%stride==0:
                xs.append(self.xx)
            if i==end and not end==-1:
                break
            i = i + 1
        
        if atoms==None:
            return np.array(xs)
        else:
            return np.array(xs)[:,atoms]
