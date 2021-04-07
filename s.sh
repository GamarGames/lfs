export LFS=/mnt/lfs
mkdir -pv $LFS
mount /dev/hda2 $LFS
swapon /dev/hda1
ln -sv $LFS/tools/
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources
su - lfs
cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF
cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL PATH
EOF
source ~/.bash_profile
declare -x HOME="/home/lfs"
declare -x LC_ALL="POSIX"
declare -x LFS="/mnt/lfs"
declare -x OLDPWD
declare -x PATH="/tools/bin:/bin:/usr/bin"
declare -x PS1=" \\u:\\w\\\$ "
declare -x PWD="/home/lfs"
declare -x SHLVL="1"
declare -x TERM="linux"
cd $LFS/sources
tar xvf /lfs-sources/binutils-2.17.tar.bz2
cd binutils-2.17