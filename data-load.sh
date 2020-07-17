#!/bin/bash

LD_LIBRARY_PATH=$(pwd)/.oracle/instantclient \
    DPI_DEBUG_LEVEL=92 \
    DB_CONNECT_USR=test_api_usr \
    DB_CONNECT_PWD=apiusr \
    DB_CONNECT_HOST=loclahost \
    DB_CONNECT_SID=dev \
    ./godror-demo

