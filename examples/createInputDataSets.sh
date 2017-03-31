#!/bin/sh
# author: Abdulrahman Kaitoua
# PhD candidate at Politecnico di Milano, Department of Electronics, Information, and Biomedical Engineering.
# email: abdulrahman dot kaitoua at polimi dot it

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
echo $SCRIPT_DIR

cd "$(dirname "$0")"
registeruser="../bin/repositoryManager registeruser"
annotationDataset="../bin/repositoryManager createds HG19_ANN BED $SCRIPT_DIR/data/annotations/"
narrowPeakDataSet="../bin/repositoryManager createds HG19_PEAK NARROWPEAK $SCRIPT_DIR/data/peaks/"
rnaDataSet="../bin/repositoryManager createds HG19_RNA $SCRIPT_DIR/data/RNA/test.schema $SCRIPT_DIR/data/RNA/"
mutationsDataset="../bin/repositoryManager createds HG19_MUT $SCRIPT_DIR/data/mutations/test.schema $SCRIPT_DIR/data/mutations/"
showall="../bin/repositoryManager list all"

echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Register Username: $USER"
echo "Executing Command: $registeruser"
echo "-------------------------------------------"
echo "-------------------------------------------"
$registeruser
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Executing Command: $annotationDataset"
echo "-------------------------------------------"
echo "-------------------------------------------"
$annotationDataset
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Executing Command: $narrowPeakDataSet"
echo "-------------------------------------------"
echo "-------------------------------------------"
$narrowPeakDataSet
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Executing Command: $rnaDataSet"
echo "-------------------------------------------"
echo "-------------------------------------------"
$rnaDataSet
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Executing Command: $mutationsDataset"
echo "-------------------------------------------"
echo "-------------------------------------------"
$mutationsDataset
echo "-------------------------------------------"
echo "-------------------------------------------"
echo "Executing Command: $showall"
echo "-------------------------------------------"
echo "-------------------------------------------"
$showall

