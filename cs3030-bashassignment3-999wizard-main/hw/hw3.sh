#!/usr/bin/bash

# DO NOT UPDATE
server_loc="http://icarus.cs.weber.edu/~dweidman/CS3030/"   # DO NOT CHANGE
custFolder="presidentData"  # DO NOT CHANGE

unset DFILE     # Data file
unset SFILE     # Sed File 
unset AFILE     # AWK Fie

################################################################################
# Help                                                                         #
################################################################################
Usage()
{
    echo "Usage: $0 [-s sedsrc] [-a awksrc] [-f inputFile]"
    exit 1
}

################################################################################
# Get file using WGET from icarus server and timestamp the file
################################################################################
GetFile()
{
  printf "Task 2: Checking for data structure\n"
  mkdir -p $custFolder/$(date +"%m")
  wget -q -O "$custFolder/$(date +"%m")/presidents.csv" $server_loc/presidents.csv
}

################################################################################
# Update Date Format Using Sed
################################################################################
UpdateFile()
{
  printf "Task 3: Updating date format\n"
  sed -i.bak -f hw3.sed presidentData/$(date +"%m")/presidents.csv

}

################################################################################
# Create Files based on century
################################################################################
SplitFile()
{
  printf "Task 4: Spliting file based on century\n"
  awk -F, -v month="$(date +"%m")" -f hw3.awk presidentData/$(date +"%m")/presidents.csv
}


################################################################################
#  Main Script
################################################################################
# Check to see if help was called
sused=false
aused=false
fused=false
while getopts ":s:a:f:h" opt; do 
   case $opt in
      h)
      Usage
      exit 0
      ;;
      s)
      sused=true
      ;;
      a)
      aused=true
      ;;
      f)
      fused=true
      ;;
      \?) # invalid entry
      echo "Invalid option: -$OPTARG"
      Usage
      ;;
      :) # requrie argument is missing
      echo "Option -$OPTARG requires an argument"
      Usage
      ;;
   esac
done


if [ $sused = false ] || [ $fused = false ] || [ $aused = false ]
then
  # echo "$sused $fused $aused"
  echo "Missing required parameters"
  Usage
  exit 1;
fi


#### Task 1: capture user options using getopts
GetFile
#### Task 2: Function to wget file from icarus WEB server, create folder and rename it
UpdateFile
#### Task 3: Update Date format using SED 
SplitFile
#### Task 4: Create files based on Century using SED

#### Task 5: Function to apply awk script 


echo "Bye"
exit 0
