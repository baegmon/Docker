# Serpico

This dockerfile will create a minimal alpine image with ruby and install the latest version of Serpico directly from GitHub.  
Source: https://github.com/SerpicoProject/Serpico

# Instructions

1. Modify the port to run on (currently runs internally on 8443, accessible externally on 443).
2. Build the image using docker-compose up -d --build
3. Obtain the initial user password using docker logs serpico

# Comparisons

The image created is smaller than the current version found within the original repository.

```
baegmon@baegmon:~/Docker/Serpico$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
serpico             latest              9593945cbe48        13 seconds ago      844MB
baegmon/serpico     latest              50da93519403        26 minutes ago      308MB
```