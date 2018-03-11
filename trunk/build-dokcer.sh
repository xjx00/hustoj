
docker build -f docker/dev/Dockerfile -t hustoj  ./

#docker rm -f -v /hustoj-dev
#docker rm -f -v /hustoj-cpp 
#docker run -d -it --privileged --name hustoj-cpp -p 8080:80 hustoj-cpp
#docker rm -f /hustoj-cpp 
#docker run -d -it --privileged --name hustoj-cpp -p 8080:80 -v /home/hustoj-cpp/:/data/ hustoj-cpp
#docker exec -i -t hustoj-cpp /bin/bash

