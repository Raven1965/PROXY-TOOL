#!/bin/bash

if [[ $1 == güncelle ]];then
	cd files
	bash güncelleme.sh güncelle
	exit
fi
if [[ ! -a $PREFIX/bin/curl ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m CURL PAKETİ KURULUYOR"
	echo
	echo
	echo
fi

cd files
clear
bash güncelleme.sh
bash banner.sh
printf "

\e[31m[\e[97m1\e[31m]\e[97m ────────── \e[32mHTTP PROXY\e[97m

\e[31m[\e[97m2\e[31m]\e[97m ────────── \e[32mSOCKS4 PROXY\e[97m

\e[31m[\e[97m3\e[31m]\e[97m ────────── \e[32mSOCKS5 PROXY\e[97m

\e[31m[\e[97mX\e[31m]\e[97m ────────── \e[32mÇIKIŞ\e[97m
"
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mSEÇENEK GİRİNİZ\e[31m ]───────►  \e[0m' secim
echo
echo
echo
if [[ $secim == 1 ]];then
	echo
	echo
	echo
	printf "\e[31m[!]\e[93mHTTP PROXYLER İNDİRİLİYOR"
	echo
	echo
	curl --silent "https://api.proxyscrape.com/v2/?request=getproxies&protocol=http&timeout=10000&country=all&ssl=all&anonymity=all" > http.txt
	sleep 1
	echo
	echo
	printf "\e[31m[!]\e[93mHTTP PROXYLER İNDİRİLDİ"
	sleep 2
	echo
	echo
	cat $HOME/PROXY-TOOL/files/http.txt
	exit
elif [[ $secim == 2 ]];then
	echo
	echo
	echo
	printf "\e[31m[!]\e[93mSOCKS4 PROXYLER İNDİRİLİYOR"
	echo
	echo
	curl --silent "https://api.proxyscrape.com/v2/?request=getproxies&protocol=socks4&timeout=10000&country=all" > socks4.txt
	sleep 1
	echo
	echo
	printf "\e[31m[!]\e[93mSOCKS4 PROXYLER İNDİRİLDİ"
	sleep 2
	echo
	echo
	cat $HOME/PROXY-TOOL/files/socks4.txt
	exit
elif [[ $secim == 3 ]];then
	echo
	echo
	echo
	printf "\e[31m[!]\e[93mSOCKS5 PROXYLER İNDİRİLİYOR"
	echo
	echo
	curl --silent "https://api.proxyscrape.com/v2/?request=getproxies&protocol=socks5&timeout=10000&country=all" > socks5.txt
	sleep 1
	echo
	echo
	printf "\e[31m[!]\e[93mSOCKS5 PROXYLER İNDİRİLDİ"
	sleep 2
	echo
	echo
	cat $HOME/PROXY-TOOL/files/socks5.txt
	exit
elif [[ $secim == x || $secim == X ]];then
	echo
	echo
	echo
	printf "\e[31m[!]\e[97m ÇIKIŞ YAPILDI"
	echo
	echo
	echo
	exit
else 
	echo
	echo
	echo
	printf "\e[31m[!]\e[97m HATALI SEÇİM"
	echo
	echo
	echo
	sleep 2
	bash $HOME/PROXY-TOOL/proxy-tool.sh
	exit
fi	
