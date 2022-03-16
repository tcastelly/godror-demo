# Install oracle driver
```bash
./preinstall
```

# Launch the built application
## Native
```bash
LD_LIBRARY_PATH=$(pwd)/.oracle/instantclient \
    DPI_DEBUG_LEVEL=92 \
    DB_CONNECT_USR=usr \
    DB_CONNECT_PWD=pwd \
    DB_CONNECT_HOST=localhost \
    DB_CONNECT_SID=dev \
    ./godror-demo
```

## Docker
```bash
docker run --env DPI_DEBUG_LEVEL=92 \
    --env DB_CONNECT_USR=usr \
    --env DB_CONNECT_PWD=pwd \
    --env DB_CONNECT_HOST=192.168.1.48 \
    --env DB_CONNECT_SID=dev \
    godror-demo
```

# Build the application

## Go
> go build

## Docker
> docker build -t godror-demo


# Github Actions
Look throw `./.github/workflows/build.yaml` to see how build the application
