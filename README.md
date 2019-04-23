# dockerize-ASP.NET-Core
This repo contains a short sample of a .NET Core ASP.NET application running in docker.
The build process is being done in a container (multi-stages build).
The resulting image is around 300MB.
# requirements:
- Docker Engine (version > 17) installed on your machine
# Steps to use it:
1. First, fork/clone this repo on your machine
2. build the image from the Dockerfile
    * `docker build -t mycoolsite:v0.1 .`
3. run this image
   * `docker run -d -p 8080:80 --name mycoolsite mycoolsite:v0.1`
4. then browse your Cool Site on [http://localhost:8080](http://localhost:8080)
