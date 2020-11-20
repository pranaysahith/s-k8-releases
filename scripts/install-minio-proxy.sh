git clone https://github.com/k8-proxy/k8-reverse-proxy.git --recursive
cd k8-reverse-proxy/stable-src
rm -rf gwproxy.env
cat > gwproxy.env <<EOF
ALLOWED_DOMAINS=minio.server.local.glasswall-icap.com
# ICAP server url
ICAP_URL=icap://3.139.22.215:1344/gw_rebuild
# Root domain , the domain appended to the original website domain
ROOT_DOMAIN=glasswall-icap.com
SQUID_IP=127.0.0.1
SUBFILTER_ENV="minio.server,minio.server.local.glasswall-icap.com"
EOF
docker-compose up -d
echo "192.168.56.90 minio.server" >> /etc/hosts