# install dependencies
set -ex
#ymp repo --update --ignore-gpg
#ymp it make python3.11 python fontconfig py3-cairo brotli --upgrade --no-emerge
#pydefault 3.11
#python3.11 -m ensurepip
if which apt &>/dev/null && [[ -d /var/lib/dpkg && -d /etc/apt ]] ; then
    apt-get update
       echo "işlem başladı....."
     apt install mtools make python3 make -y
fi
#apt install python3 python make
pip3 install sphinx-build
pip3 install rst2pdf
pip3 install sphinx-sitemap
# install font
#wget https://github.com/dejavu-fonts/dejavu-fonts/releases/download/version_2_37/dejavu-fonts-ttf-2.37.zip -O font.zip
#unzip font.zip
#mv dejavu-*/ttf /usr/share/fonts/
#fc-cache -fv
# build
sh ./build.sh
mkdir /output -p
cp -r build/pdf/* /output
cp -r build/html/* /output
cp robots.txt /output
