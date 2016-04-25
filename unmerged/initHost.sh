sudo apt-get install build-essential screen vim

sudo apt-get remove nano pico vim-tiny

sudo mkdir -p /package/source

sudo chown `whoami` /package/source

urls="$urls http://cr.yp.to/daemontools/daemontools-0.76.tar.gz"
urls="$urls http://cr.yp.to/ucspi-tcp/ucspi-tcp-0.88.tar.gz"
urls="$urls http://cr.yp.to/publicfile/publicfile-0.52.tar.gz"

for url in $urls; do
  wget "$url"
done

#...
