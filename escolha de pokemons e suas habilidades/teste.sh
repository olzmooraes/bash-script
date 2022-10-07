#! /bin/bash

read -p "Digite seu pokemon " teste1

teste2=$(grep "${teste1^}" ./pkmStats.txt)
read -a id <<< "$teste2"
echo ${id[0]}
