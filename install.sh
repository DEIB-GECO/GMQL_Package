#!/bin/bash

# stop bash in case of error
set -e

cd "$(dirname "$0")"

git clone https://github.com/DEIB-GECO/GMQL.git
cd GMQL/
mvn clean
mvn install

# Copy output dependencies to execution folder
cp ./GMQL-Cli/target/GMQL-Cli-*-jar-with-dependencies.jar ../lib/
cp ./GMQL-Repository/target/GMQL-Repository-*-jar-with-dependencies.jar ../lib/
cp ./GMQL-SManager/target/GMQL-SManager-*-jar-with-dependencies.jar ../lib/
