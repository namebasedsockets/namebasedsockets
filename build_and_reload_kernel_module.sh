echo "killing namestackd"
kill $(pidof namestackd)

echo "unloading kernel module"
sudo rmmod namestack.ko

echo "building kernel module"
cd module
make 
cd ..

echo "inserting kernel module"
sudo insmod module/namestack.ko

echo "starting namestackd"
screen -dmS daemon ./daemon/namestackd

