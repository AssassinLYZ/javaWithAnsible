#!/bin/sh
curl -s -XGET -L --user admin:11c253f35f1cc82972fccc6525d6a9e4a1 http://120.55.170.196:8080/job/springApplication/lastSuccessfulBuild/artifact/build/libs/demo1-0.0.1-SNAPSHOT.jar --output ~/springApplicationWithJinkens.jar
pgrep -f springApplicationWithJinkens.jar
retval=$?
if [ $retval -eq 0 ]; then
        kill $(pgrep -f springApplicationWithJinkens.jar)
fi

nohup java -jar ~/springApplicationWithJinkens.jar > ~/spring.log 2>&1 &