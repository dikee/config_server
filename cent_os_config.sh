# Sets up directory with python 2.7, python 3.3, pip, virtualenv, development tools, and mongodb

/usr/sbin/adduser demouser
echo "nigeria" | passwd demouser --stdin
# Add user to wheel root group
gpasswd -a demouser wheel
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "AllowUsers demouser" >> /etc/ssh/sshd_config
service sshd reload

# Install python
yum -y update
yum groupinstall -y "development tools"
yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel
cd /tmp
wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tar.xz
wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tar.xz
xz -d Python-2.7.10.tar.xz
xz -d Python-3.4.3.tar.xz

tar -xvf Python-2.7.10.tar
tar -xvf Python-3.4.3.tar

cd /tmp/Python-2.7.10
./configure
make && make altinstall

cd /tmp/Python-3.4.3
./configure
make && make altinstall

wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz
tar -xvf setuptools-1.4.2.tar.gz
cd setuptools-1.4.2
python2.7 setup.py install
curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | python2.7 -
pip install virtualenv

# Install Mongo
cat > /etc/yum.repos.d/mongodb.repo <<- EOM
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
EOM

yum -y install mongo-10gen mongo-10gen-server
service mongod start

