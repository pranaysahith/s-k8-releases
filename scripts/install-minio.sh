sudo docker pull minio/minio:latest
sudo docker run -d -p 80:9000 \
  --name minio1 \
  -v /mnt/data:/data \
  -e "MINIO_ACCESS_KEY=user" \
  -e "MINIO_SECRET_KEY=secret_password" \
  minio/minio server /data