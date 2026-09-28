#!usr/bin/env/bash
set -euo pipefail
"/mnt/c/Program Files/Docker/Docker/Docker Desktop.exe" > /dev/null 2>&1 || true
echo "waiting for docker deamon"
for i in {1..60}; do
  if docker info > /dev/null 2>&1; then
    echo "docker ready"
    exit 0
  fi  
  sleep 2
done

echo "docker not ready"
exit 1
