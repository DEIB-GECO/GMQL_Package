#!/bin/sh
# author: Abdulrahman Kaitoua
# PhD candidate at Politecnico di Milano, Department of Electronics, Information, and Biomedical Engineering.
# email: abdulrahman dot kaitoua at polimi dot it

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
echo $SCRIPT_DIR

cd $(dirname $0)

if [ "$#" -ne 1 ]; then
  echo "Usage: $0  LOCAL|MAPREDUCE " >&2
  echo "The datasets should first be added to GMQL repository, running createInputDataSets.sh script"
  echo "Example: ./runScriptExamples.sh"
  exit 1
fi

Script1="../bin/GMQL-Submit-R -scriptpath $SCRIPT_DIR/scripts/script1.GMQL"
Script2="GMQLScriptManager compilerun $1 $SCRIPT_DIR/scripts/script2.GMQL"
Script3="GMQLScriptManager compilerun $1  $SCRIPT_DIR/scripts/script3.GMQL"
Script4="GMQLScriptManager compilerun $1 $SCRIPT_DIR/scripts/script4.GMQL"
showall="repositoryManagerV1 list all"

echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Register Username: $USER"
echo "Executing Command: $registeruser"
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"
$registeruser
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Executing Command: $Script1"
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"
$Script1
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Executing Command: $Script2"
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"
$Script2
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Executing Command: $Script3"
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"
$Script3
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Executing Command: $Script4"
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"
$Script4
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Executing Command: $showall"
echo "-------------------------------------------"
echo "-------------------------------------------"
$showall

