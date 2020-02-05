#!/bin/bash
echo "-------------------------------" |
echo "USERNAME          EXP DATE     " |
echo "-------------------------------" |
while read expired
do
        Account="$(echo $expired | cut -d: -f1)"
        ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $Account | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 1000 ]]; then
        printf "%-17s %2s\n" "$Account" "$exp"
        fi
done < /etc/passwd
Amount="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "-------------------------------" |
echo "Total Account: $Amount user"
echo "-------------------------------" |
echo -e ""
