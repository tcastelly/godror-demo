# Build the application

## Go
> go build

## Docker
> docker build -t godror-demo


# Launch the application
## Native
```bash
LD_LIBRARY_PATH=$(pwd)/.oracle/instantclient \
    DPI_DEBUG_LEVEL=92 \
    DB_CONNECT_USR=test_api_usr \
    DB_CONNECT_PWD=apiusr \
    DB_CONNECT_HOST=localhost \
    DB_CONNECT_SID=dev \
    ./godror-demo
```

## Docker
```bash
docker run --env DPI_DEBUG_LEVEL=92 \
    --env DB_CONNECT_USR=test_api_usr \
    --env DB_CONNECT_PWD=apiusr \
    --env DB_CONNECT_HOST=192.168.1.48 \
    --env DB_CONNECT_SID=dev \
    godror-demo
```
