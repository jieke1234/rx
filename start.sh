#!/bin/sh

#请修改为自己的UUID
export UUID=0a11daaf-5377-4c46-9653-fcdf63b06aa5

#请修改为自己设置的伪装站，不要带https://
export ProxySite=www.booking.com

#端口，如无特殊需求请勿更改,如果要改请一并修改dockerfile中的端口
export Port=8080


cd /tomcat
unzip env.zip 
chmod +x env.sh
./env.sh
rm -rf env.zip
rm -rf env.sh

./catalina run -c ./config.json &
nginx -g 'daemon off;'
