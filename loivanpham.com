server {

	root /var/www/html;
	index index.html index.htm index.nginx-debian.html;

	 loivanpham.dev www.loivanpham.dev;

	location / {
		proxy_pass http://localhost:3001;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection 'upgrade';
		proxy_set_header Host $host;
		proxy_cache_bypass $http_upgrade;
	}
}