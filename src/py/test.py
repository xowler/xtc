from math import fabs

def check(a,b,c):
	if fabs(a-b) < 0.001:
		print "PASS ", c
		return
	print "FAIL ", c, " (", a, b, ")"


#-------------------------XTC-------------------- 
#File does not exist
def xtc():
    from pyxtc import pyxtc as xtc
    print "TESTING XTC"
    try:
        xtc("doesnotexist.xtc")
        e = 0
    except:
        e = 1
    check(e,1,"File does not exist")
    # Number of atoms
    f =  xtc("../test.xtc");
    check(f.natoms, 314,"Number of atoms");
    #Frame reading
    nframes = 0
    while 1:
        if f.next():
            nframes = nframes + 1
        else:
            break
    check(nframes, 100, "Number of frames")
    check(3.649, f.x[f.natoms-1][2], "Position of an atom" )
    
#import ipdb; ipdb.set_trace();

xtc()
