#! /bin/sh
# execute this from your AA cross-compilation directory

#---------------------------------------------------------------
# WARNING: 'make dirclean' is a full clean of your build system.
make dirclean
#---------------------------------------------------------------

cp feeds.conf.default feeds.conf
echo "src-git printing git://github.com/Vladdrako/openwrt-printing-packages.git" >> feeds.conf

# Remove downloaded/generated files.
./scripts/feeds clean

# Update all feeds listed within feeds.conf.
./scripts/feeds update -a

# Uninstall all packages
./scripts/feeds uninstall -a

# Mark all packages from 'printing' to be installed as 'm'
./scripts/feeds install bzip2 libcurl
./scripts/feeds install -a -p printing -d m

make defconfig

# You should select the correct target architecture here
make menuconfig

echo "\n\n"
echo "Assuming you selected the right architecture, you should be all set"
echo "Issue 'make' and go drink some coffee as it takes a while..."
