import commands
arch = commands.getoutput("echo ${OSTYPE}_$(uname -m) | sed 's/-/_/g'")

exec('from pyxtc_%s import pyxtc_%s as pyxtc'%(arch,arch))
