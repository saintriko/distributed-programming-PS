@echo off
docker build -t backendapi%1 -f Dockerfile.backendapi .
docker build -t frontendtask%1 -f Dockerfile.frontendtask .