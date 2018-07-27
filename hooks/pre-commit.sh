#!/bin/bash
echo -ne "\n\e[33m  pre-commit hook starting ...\e[0m\n\n"

if [[ $(docker inspect -f {{.State.Running}} projectname_angular) == 'false' ]]
then
  echo -ne "\n\e[33m  run 'docker-compose up' command!\e[0m\n\n"
  echo -ne "\n\e[33m  pre-commit hook can not run without angular container!\e[0m\n\n"
  exit 1
fi

echo -ne "\n\e[33m  yarn lint ...\e[0m\n\n"

TSLINT_RESULT=$(docker exec projectname_angular yarn lint PROJECT-NAME --fix)

echo $TSLINT_RESULT

if [[ $TSLINT_RESULT =~ .*ERROR.* ]]
then
  echo -ne "\n\e[33m  Check failed!\e[0m\n\n"
  exit 1
fi

echo -ne "\n\e[33m  eslint ...\e[0m\n\n"

ESLINT_RESUL=$(docker exec projectname_angular eslint /home/node/angular/** --fix --quiet  )

echo $ESLINT_RESUL

if [[ $ESLINT_RESUL =~  .*problem.*  ]]
then
  echo -ne "\n\e[33m  Check failed!\e[0m\n\n"
  exit 1
fi

echo -ne "\n\e[33m  Committing ...\e[0m\n\n"
exit 0
