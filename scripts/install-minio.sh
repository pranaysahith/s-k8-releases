git clone --single-branch --branch minio_server https://github.com/pranaysahith/s-k8-releases.git
cd s-k8-releases && docker-compose up -d
# sudo docker pull minio/minio:latest
# sudo docker run -d -p 80:9000 \
#   --name minio1 \
#   -v /mnt/data:/data \
#   -e "MINIO_ACCESS_KEY=user" \
#   -e "MINIO_SECRET_KEY=secret_password" \
#   minio/minio server /data