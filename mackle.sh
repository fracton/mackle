networksetup -setairportpower en1 off
sudo scutil --set ComputerName "`randWord`"
sudo scutil --set LocalHostName "`randWord`"
sudo scutil --set HostName "`randWord`"
networksetup -setairportpower en1 on

first="0"
second="0"
while [ $first = $second ] ; do
	sudo airport -z
	first=`ifconfig en1 | grep ether | tail -c 19 | head -c 17`
	echo "Starting with " $first 
	openssl rand -hex 1 | tr '[:lower:]' '[:upper:]' | xargs echo "obase=2;ibase=16;" | bc | cut -c1-6 | sed 's/$/00/' | xargs echo "obase=16;ibase=2;" | bc | sed "s/$/:$(openssl rand -hex 5 | sed 's/\(..\)/\1:/g; s/.$//' | tr '[:lower:]' '[:upper:]')/" | xargs sudo ifconfig en1 ether
	second=`sudo ifconfig en1 | grep ether | tail -c 19 | head -c 17`
done
echo "nao " $second
