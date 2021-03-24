echo "Please Enter the directory path To cereate Files: "
read var1

mkdir $var1
touch $var1/test{1..10}
echo "files got created in given location"
