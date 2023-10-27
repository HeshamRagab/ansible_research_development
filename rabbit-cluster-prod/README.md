
please look at ./vars.yml to change passwords
NOTE: please strong passwords its preffered length 25
NOTE: you could install a simple tool on linux to generate a strong passwords
CMD: apt update -y && apt install -y pwgen
CMD: pwgen -nc 25 1

on the root directory of project: run this command to run ansible

"ansible-playbook RMQCluster.yml -i inventory"
