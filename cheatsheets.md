Cheatsheets
=============

### See what is running on each port
```
netstat -tulpn
```

### Set up sites-available / sites-enables in Redhat/Centos for Nginx

Create the files
```
mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled
```

Add link below into http block of /etc/nginx/nginx.conf
```
include /etc/nginx/sites-enabled/*;
```
