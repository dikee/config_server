#!/bin/sh

sudo yum -y update

sudo yum groupinstall -y development

sudo yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel

cd /var/tmp/

wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tar.xz

xz -d Python-3.4.3.tar.xz

tar -xvf Python-3.4.3.tar

cd Python-3.4.3

./configure

make

sudo make install

cd

mkdir pypiserver

cd pypiserver

virtualenv venv-pypi

source venv-pypi/bin/activate

pip install pypiserver

mkdir packages

pip install passlib

sudo yum install -y httpd-tools

htpasswd -sc .htaccess nrguser

# type in password: wearenrg

cat <<EOF > /home/ec2-user/pypiserver/start_pypi_server.sh

#!/bin/bash

PIDFILE=/home/ec2-user/pypiserver/do_not_delete_nrgpypiserver.pid

case $1 in
   start)
       # source /home
       # Launch your program as a detached process
       /home/ec2-user/pypiserver/venv-pypi/bin/python /home/ec2-user/pypiserver/venv-pypi/bin/pypi-server -p 8081 -P /home/ec2-user/pypiserver/.htaccess /home/ec2-user/pypiserver/packages/ &
       # Get its PID and store it
       THE_PID=$!
       sudo echo $THE_PID > ${PIDFILE}
       echo $THE_PID
   ;;
   stop)
      sudo kill -9 `cat ${PIDFILE}`
      # Now that it's killed, don't forget to remove the PID file
      sudo rm ${PIDFILE}
      echo "Stopped PyPiServer"
   ;;
   *)
      echo "usage: nrg-pypiserver {start|stop}" ;;
esac
exit 0
EOF

sudo chmod -R 777 start_pypi_server.sh

echo "\n"

sudo yum install -y yum







