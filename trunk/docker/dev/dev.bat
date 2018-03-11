docker rm -f hustoj
docker run -d -it  --privileged -v /D/docker/hustoj1/:/data -v /D/githome/hustoj/trunk/web:/home/judge/src/web  --name hustoj -p 80:80 hustoj
docker ps
pause
