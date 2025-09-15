@echo off
call mvn clean package
call docker build -t com.mycompany/appGanttProject .
call docker rm -f appGanttProject
call docker run -d -p 9080:9080 -p 9443:9443 --name appGanttProject com.mycompany/appGanttProject