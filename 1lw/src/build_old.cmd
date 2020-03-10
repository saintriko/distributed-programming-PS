@echo off
docker build -t backendapi:%1 -f Dockerfile.backendapi .
docker build -t frontendtask:%1 -f Dockerfile.frontendtask .

md ..\build\build_%1
cp start.cmd ..\build\build_%1
cp stop.cmd ..\build\build_%1
cp delete.cmd ..\build\build_%1
cp config.cmd ..\build\build_%1
