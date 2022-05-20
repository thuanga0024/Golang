#!/bin/bash
#Day la script Dung De Tim Kiem File Da Duoc Tao Ra Cach Day 1 Nam
#ls -lt --time-style=+%d-%m-%y | awk -F' ' '{print $6"-"$7}'

check_time(){
	dungluong=$(echo $xyz | awk -F'-' '{print $1}')
	nam=$(echo $xyz | awk -F'-' '{print $4}')
	file_name=$(echo $xyz | awk -F'-' '{print $5}')
	
	echo $dungluong $nam $file_name

	#if [ $[$(date +%y) - $nam ] -ge 1  ] 
	if [ $[ 23 - $nam ] -ge 1  ] 
	then
		echo "File Duoc Tao Ra Hon 1 Nam"
		check_file
	else
		echo "File Duoc Tao Ra Chua Toi 1 Nam"
	fi
}

check_file(){

check=$(echo $file_name | awk -F'.' '{print $2}')
case "$check" in
	sh)
		shell="$shell $file_name"
		echo "Day La File Script"
		echo $shell
		;;
	docx|doc)
		word="$word $file_name"
                echo "Day La File Word"
		;;
	pdf)	
		pdf="$pdf $file_name"
                echo "Day La File PDF"
		;;
	*)
		more="$more $file_name"
		echo "Cac Dinh Dang Chua Xac Dinh"
esac
}

abc=$(ls -ltdh *  --time-style=+%d-%m-%y | awk -F' ' '{print $5"-" $6"-"$7}')

i=1
value='$'

while true
do	
	xyz=$(echo $abc | awk -F' ' '{print '"${value}$i"'}')
	if [ -z $xyz ]
	then
		echo "Da Tim Kiem Het File"
		exit 1
	else
		check_time
		let 'i+=1'
	fi
done

echo $shell

#echo $abc
