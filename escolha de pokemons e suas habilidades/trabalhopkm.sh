#! /bin/bash

for ((i = 0; i == 0; i++)); do
    if [[ -e pokemon ]]; then
        rm -r pokemon
    fi
done

read -p "Digite seu pokemon numero 1 " digitado1
read -p "Digite seu pokemon numero 2 " digitado2

while [ $digitado1 = $digitado2 ]; do

    echo "Seus pokemons são iguais, comece denovo!"
    read -p "Digite seu pokemon numero 1 " digitado1
    read -p "Digite seu pokemon numero 2 " digitado2

done

while [ -z $digitado1 ]; do
    read -p "Digite seu pokemon numero 1 " digitado1
done

while [ -z $digitado2 ]; do
    read -p "Digite seu pokemon numero 2 " digitado2
done

pkm1="${digitado1,,}"
pkm2="${digitado2,,}"

mkdir pokemon

if [[ $pkm1 != $pkm2 ]]; then

    if [[ -n $pkm1 ]]; then
        touch "$pkm1.txt"
        mv ./"$pkm1.txt" ./pokemon

        list_pkm1=$(grep "${pkm1^}" ./pkm.txt)
        read -a tipo1 <<< "$list_pkm1"

        tipo1_pkm1=$(grep "${tipo1[2]}" ./pkmAdv.txt)
        read -a fraqueza1_pkm1 <<< "$tipo1_pkm1"
        
        tipo2_pkm1=$(grep "${tipo1[3]}" ./pkmAdv.txt)
        read -a fraqueza2_pkm1 <<< "$tipo2_pkm1"

        grep "${pkm1^}" ./pkm.txt >>./pokemon/"$pkm1.txt"

        espec_pkm1=$(grep "${pkm1^}" ./pkmStats.txt)
        read -a id1 <<<"$espec_pkm1"

        echo " " >>./pokemon/"$pkm1.txt"
        echo "HP : ${id1[2]}" >>./pokemon/"$pkm1.txt"
        echo "Attack : ${id1[6]}" >>./pokemon/"$pkm1.txt"
        echo "Speed : ${id1[9]}" >>./pokemon/"$pkm1.txt"

        echo "fraqueza : ${fraqueza1_pkm1[0]}, ${fraqueza2_pkm1[0]}" >>./pokemon/"$pkm1.txt"

    fi

    if [[ -n $pkm2 ]]; then

        touch "$pkm2.txt"
        mv ./"$pkm2.txt" ./pokemon


        list_pkm2=$(grep "${pkm2^}" ./pkm.txt)
        read -a tipo2 <<< "$list_pkm2"

        tipo1_pkm2=$(grep "${tipo2[2]}" ./pkmAdv.txt)
        read -a fraqueza1_pkm2 <<< "$tipo1_pkm2"
        
        tipo2_pkm2=$(grep "${tipo2[3]}" ./pkmAdv.txt)
        read -a fraqueza2_pkm2 <<< "$tipo2_pkm2"

        grep "${pkm2^}" ./pkm.txt >>./pokemon/"$pkm2.txt"

        espec_pkm1=$(grep "${pkm2^}" ./pkmStats.txt)
        read -a id2 <<<"$espec_pkm1"

        echo " " >>./pokemon/"$pkm2.txt"
        echo "HP : ${id2[2]}" >>./pokemon/"$pkm2.txt"
        echo "Attack : ${id2[6]}" >>./pokemon/"$pkm2.txt"
        echo "Speed : ${id2[9]}" >>./pokemon/"$pkm2.txt"

        echo "fraqueza : ${fraqueza1_pkm2[0]}, ${fraqueza2_pkm2[0]}" >>./pokemon/"$pkm2.txt"
    fi
fi
echo "OS ARQUIVOS PARA CORREÇÃO DO TRABALHO, ESTÃO NA PASTA 'POKEMON'"
