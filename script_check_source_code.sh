#!/bin/bash

# Set your pod name and the path to the file inside the container
POD_NAME="www-beg-7c8b859fbc-7b5vp"
FILE_PATH="/rails/app/views/main/_footer.html.erb"

# Display the file contents
kubectl exec -it "$POD_NAME" -- cat "$FILE_PATH"
