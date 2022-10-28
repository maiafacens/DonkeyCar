#Home directory
cd ~

echo -e '          \033[04;37;44mMAIA\033[0;m'
echo 'Donkey Car Software Installer'

#Check if projects folder doesn't exist
if([!-d"./projects/"]
#Create projects folder
	mkdir projects
fi
else
#Projects directory
	cd ./projects
fi

#Download archives of latest donkeycar from github
git clone https://github.com/autorope/donkeycar

#Donkeycar directory
cd ./donkeycar
git checkout main

#Faster install
conda install mamba -n base -c conda-forge
mamba env create -f install/envs/ubuntu.yml
conda activate donkey
pip install -e .[pc]

#Install tensorflow library
conda install tensorflow-gpu==2.2.0
#install Cuda SDK
conda install cudatoolkit=<CUDA Version> -c pytorch

#Create your local working directory
donkey createcar --path ~/mycar

#After closing the prompt, qhen you open it again, you will need to type
#conda activate donkey
#to re-enable the mappings to donkey specific Python libraries
