#!/usr/bin/env bash

echo -ne "\n\e[33mCheck Angular folder ...\e[0m\n\n"

npm-check

npm-check --specials --no-color --no-emoji | grep 'A package.json was not found at /home/node/angular/package.json' &> /dev/null

if [ $? == 0 ]
then

   cd /

   echo -ne "\n\e[33mAngular folder is empty!\e[0m\n\n"

   echo -ne "\e[33mInstalling Angular ...\e[0m\n\n"

   ng new $APP_NAME --force --directory /home/node/angular

   echo -ne "\n\e[33mAngular Installed ...\e[0m\n\n"

   rm -rf /home/node/angular/.git

   echo -ne "\n\e[33m '.git' directory removed  ...\e[0m\n\n"

   cp /etc/extras/.eslintrc /home/node/angular/.eslintrc

   echo -ne "\n\e[33m '.eslintrc' file copied ...\e[0m\n\n"

else
   echo -ne "\n\e[33mAngular folder not empty ...\e[0m\n\n"
fi

cd /home/node/angular

yarn install
