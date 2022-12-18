### To Build DockerFile

```
docker-compose build
```

### To RUN Docker-Compose File

```
docker-compose up
```

### To Execute Makemigrations, Migration and to Create SuperUser, first Enter Docker Shell 

##### (Note:- The Server Must Be In Running State)

#### For MAC or Windows
1. Open Docker Desktop
2. Go to Containers Tab
3. Search cloud-storage-backend
4. Inside cloud-storage-backend, find cloud-storage-backend_web_1
5. Against cloud-storage-backend_web_1, click on CLI button

#### For Linux
1. List All Containers
```
docker container ls
```
2. Copy the Container ID of cloud-storage-backend_web
3. Run Docker Execution Command
```
docker exec -it {{CONTAINER_ID}} /bin/sh
```

##### This Will Open Shell Inside the Docker Container

#### Note:- All Commands Below Need to be executed inside docker container shell

### To Make Migration
```
python manage.py makemigrations
```

### To Migrate
```
python manage.py migrate
```

### To Create Superuser
```
python manage.py createsuperuser
```
