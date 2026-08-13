#!/bin/bash


if docker ps --filter "name=${CONTAINER_NAME}" --filter "status=running"| grep -q "${CONTAINER_NAME}" ; then
    echo "pass"
else
    echo "applciation failed to start"
    exit 1
fi