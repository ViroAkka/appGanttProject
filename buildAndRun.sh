#!/bin/sh
mvn clean package && docker build -t com.mycompany/appGanttProject .
docker rm -f appGanttProject || true && docker run -d -p 9080:9080 -p 9443:9443 --name appGanttProject com.mycompany/appGanttProject