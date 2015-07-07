server {
    listen 80;    

    server_name p-10-200-189-177.energyplus.com; 

    access_log  /var/log/nginx/access.log;
    error_log  /var/log/nginx/error.log;

    location / {
        proxy_pass         http://127.0.0.1:8081/;
        proxy_redirect     off;

        proxy_set_header   Host             $host;
        proxy_set_header   X-Real-IP        $remote_addr;
        proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
 proxy_connect_timeout 30;
 proxy_read_timeout 30;
    }

}