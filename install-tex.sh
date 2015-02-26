cd tex
rm -rf inst main local
cat texlive.profile.in | sed "s\\@PATH@\\$PWD\\g" > texlive.profile
mkdir -p inst
cd inst
rm * -rf
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -xzf install-tl-unx.tar.gz
rm install-tl-unx.tar.gz
cd install-tl-*
./install-tl --profile=../../texlive.profile
cd ..
rm * -rf
cd ..
cd ..
if [ -d tex/main/bin ]
then
	export PATH=$PWD/tex/main/bin/x86_64-linux:$PATH
	tlmgr install multirow xcolor xint ulem
	tlmgr install import standalone xkeyval currfile filehook filemod
	tlmgr install mex babel-polish polski
#	tlmgr install xcolor
#	tlmgr install xint
#	tlmgr install ulem
#	tlmgr install babel-polish
else
	Something went wrong !
	exit -1
fi

