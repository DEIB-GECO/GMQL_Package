Table of Contents
==============
[TOC]

***
GMQL QuickStart
================
GMQL is a **GenoMetric Query Language**, that runs over GDMS, **Genomic Data Management System**. This manual will help you to install GDMS to get started scripting GMQL. 

More information about [GDMS architecture](https://github.com/DEIB-GECO/GMQL/blob/master/docs/gmql_architecture.md) and and GDMS packages go to [GMQL](https://github.com/DEIB-GECO/GMQL/).

***
### GDMS Installation

#### Requirements 

- Linux (Ubuntu/Debian is recommended)
- JDK 8 or higher
- Hadoop Installation 2.7.x or higher (only in Cluster mode, check the [configurations](https://github.com/DEIB-GECO/GMQL/blob/master/docs/Configutations.md)).
	- Guide for Hadoop installation can be found in [Hadoop installation page](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html).
- Maven installation (3 or greater) : 
	- You can use this command in terminal (Ubuntu/Debian):  
	
			sudo apt-get install maven
			
	- Or go to [maven installation web page](https://maven.apache.org/install.html)
- Git installed: 
	- You can use this command in terminal (Ubuntu/Debian):
	- Or see [Git installation website](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
	
	
####Installation
The [engine configurations](https://github.com/DEIB-GECO/GMQL/blob/master/docs/Configutations.md) should be set first for the shell installation.

 - In case of Cluster installation (see [engine configurations](https://github.com/DEIB-GECO/GMQL/blob/master/docs/Configutations.md)), make sure that your Hadoop installation is configured and running.

 - Download [GMQL Package](https://github.com/DEIB-GECO/GMQL_Package), 
	- using the following terminal command: 		 

			Git clone https://github.com/DEIB-GECO/GMQL_Package.git
					
	-  Or, by downloading a Tar, you should extract the tar in this case.

 - Install GMQL by running the following GMQL command in GMQL installation directory: 

			./install.sh
	 
	 The installer will pull the latest code of GMQL from the [master branch of GMQL](https://github.com/DEIB-GECO/GMQL) and compile the code using maven, finally, copy the Jars to *lib/ directory*.

***
Quick Start Examples
==================

You will find in the package **bin/ folder** the following shell executables: 

- [repositoryManager](https://github.com/DEIB-GECO/GMQL_Package/blob/master/bin/repositoryManager)
	Run GMQL repository to find the user data sets installed. Inistially the user has no datasets in his repository and the user is not even registered. The first command to run is: 
	
		repositoryManager RegisterUser
	
	which will register the user in GMQL repository. The user data will be created in GMQL repository home folder (set this directory in the [repository configurations](https://github.com/DEIB-GECO/GMQL/blob/master/docs/Configutations.md) )
	
	For information about the repository manager see [repository shell APIs](https://github.com/DEIB-GECO/GMQL/blob/master/docs/SHELL_API.md).
- [GMQL-Submit](https://github.com/DEIB-GECO/GMQL_Package/blob/master/bin/GMQL-Submit)
	This executable is used to submit GMQL script to GDMS engine **without** the use of GDMS repository. For example code see [GMQL examples](https://github.com/DEIB-GECO/GMQL/blob/master/docs/example.md). The selection in this case is from a dataset directories and the materialization is to output directories. This is useful for trying GDMS without installing repository but not suggested for long use of GDMS, where a huge number of datasets are generated and the user starts to loose track of the generated datasets. 
	
	Submit Example: 

		 bin/GMQL-Submit -scriptpath /home/user/GMQL/examples/GMQL_Submit_Example_LOCAL.gmql 

	Another example that will read from HDFS and store in HDFS: 

		bin/GMQL-Submit -scriptpath /home/user/GMQL/examples/GMQL_Submit_Example_HDFS.gmql

	
- [GMQL-Submit-R](https://github.com/DEIB-GECO/GMQL_Package/blob/master/bin/GMQL-Submit-R)
	This executable is used to submit GMQL script to GDMS engine **with** the use of GDMS repository. For example code see [GMQL examples](https://github.com/DEIB-GECO/GMQL/blob/master/docs/example.md). The selection in this case is using dataset names from the repository and the materialization is to datasets in repository. This is simpler to track generated datasets and manage the data in the system.
	The following example read datasets from the repository and write the result in the repository: 
	
			bin/GMQL-Submit-R -scriptpath /home/user/GMQL/examples/GMQL_Submit_Repository_Example.gmql

	The datasets mentioned in the code (ann, and exp) should be added to the repository first using repositoryManager command. You can find a sample data in examples/data/ann and examples/data/exp	folders.

***
One click Start
============
We provided a shell code that adds four datasets to GDMS repository and another shell script to run four scripts on those daatasets. 

This code will add four datasets to the repository, run the code form GDMS installation folder:
		
	examples/createInputDataSets.sh

This code will run four scripts of GMQL, the result will be found in the repository,  run the code form GDMS installation folder:

	examples/runScriptExamples.sh
