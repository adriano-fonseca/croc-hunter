# croc-hunter

As go application...

```
go build
./croc-hunter
```

## Container form

To build an image.


```
docker image build -t adrianofonseca/croc-hunter:v1 .

```

To run as a container...

```
docker container run -e WORKFLOW_RELEASE=V1 -p 8080:8080  adrianofonseca/croc-hunter:v1
```


## Deploy as a service

```
docker service create --replicas 1 --name croc-hunter -p 8080:8080 -e WORKFLOW_RELEASE=v1  --update-delay 10s targettrust/croc-hunter:v1
```

## Rolling Update ##

```
docker service update --env-add WORKFLOW_RELEASE=v2  --image targettrust/croc-hunter:v2 croc-hunter
```
