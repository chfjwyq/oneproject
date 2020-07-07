#!/bin/sh
cd /usr/local/tomcat/bin/

  cp /etc/hosts /etc/hosts.temp
  find ../webapps/ -name hosts.properties | xargs sed 'a\' >> /etc/hosts.temp
  sed -i "s/.*$(hostname)/$DOCKER_IP $(hostname)/" /etc/hosts.temp
  cat /etc/hosts.temp > /etc/hosts

sh /usr/filebeat/filebeat.sh start

sh /usr/local/tomcat/bin/catalina.sh run

#exec /usr/filebeat/filebeat.sh start
