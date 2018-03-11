docker rm -f hustoj
docker run -d -it  --privileged -v /D/docker/hustoj1/:/data  --name hustoj -p 80:80 hustoj
docker ps
pause
