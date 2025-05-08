#!/bin/bash

# Define variables
POD_NAME="www-beg-redis-7466757696-zbmfq"
# REDIS_PASSWORD="FO2Tag42DlWI"

# Execute Redis flush command inside the pod
kubectl exec -it "$POD_NAME" -- redis-cli FO2Tag42DlWI
