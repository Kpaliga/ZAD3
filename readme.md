Aby poprawnie uruchomić aplikację, należy uprzednio wykonać dwie instrukcje:
    ```sudo nano /etc/hosts``` 
    ```127.0.0.1 test.com```

Oraz:

```
docker build -t zad3flask . 
docker build -t zad3express . 

odpowiednio w folderach z plikami flask oraz express


docker container run -d --name postgres --label traefik.port=5432 -v "/home/kali/zad3tbk/db":/docker-entrypoint-initdb.d -v pg-data:/var/lib/postgresql/data -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_DB=db postgres:11.5-alpine
docker container run --rm -d --name express --label traefik.enable=true --label traefik.port=3000 --label traefik.priority=1 --label traefik.http.routers.express.rule="Host(\"test.com\")" zad3express  
docker container run --rm -d --name flask --label traefik.enable=true --label traefik.port=5000 --label traefik.priority=10 --label traefik.http.routers.flask.rule="Host(\"test.com\") && PathPrefix(\"/cars\")" zad3flask

docker run -d --name traefik -p 8080:8080 -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock traefik:latest --api.insecure=true --providers.docker
```

PRZYKŁADOWE ZAPYTANIE:
* ```{
  "model": "BMW E46 PO SWAPIE NA 2.0",
  "year": 2002,
  "details": "brak"
  }```)


DOSTĘPNE ENDPOINTY:
* http://test.com/cars
* http://test.com/cars?year=2020
* http://test.com/addCar  
