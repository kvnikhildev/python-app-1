create app.py --provided 
create requirements.txt --- need flask dependency for this python app
create docker file --provided
create ec2 instances enable ssh port 
install jenkin in ec2 instaces using ansible steps below
create ssh-keygen
  ssh-keygen
copy public key to ec2 instance autherised key 
 scp -i /home/nik/KeypairCLI.pem  /home/nik/.ssh/id_rsa.pub ubuntu@54.90.75.171:~/.ssh/authorized_key
(scp -i yourkeypair  yoursshkey ubuntu@publiip:~/.ssh/autherised_key)
install java and jenkin docker using ansible playbook -- file provided
check the version using adhock cmd
  ansible all -i inventry -b -m shell -a "jenkins --version" 
  ansible all -i inventry -b -m shell -a "java --version"
  ansible all -i inventry -b -m shell -a "ps -ef | grep jenkin"  #  jenkin port check 
open port for jenkin in ec2 instance using aws-cli 
  aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId,SecurityGroups[]]"
  aws ec2 authorize-security-group-ingress --group-id sg-090fa41497d09cb6c --protocol tcp --port 8080 --cidr 0.0.0.0/0   # for jenkin
  aws ec2 authorize-security-group-ingress --group-id sg-090fa41497d09cb6c --protocol tcp --port  5000 --cidr 0.0.0.0/0   # for python app

acess jenkin in browser using public ip port 8080
  ansible all -i inventry -b -m shell -a "cat /var/lib/jenkins/secrets/initialAdminPassword "  # to check jenkin first time pass

add plugin 
 docker pipeline
 give access to the jenkin user
 ansible all -i inventry -b -m shell -a "usermod -aG docker jenkins"
 ansible all -i inventry -b -m shell -a "systemctl restart docker"
 ansible all -i inventry -b -m shell -a "docker run hello-world"

 create jenkin pipline
 upload all you file from your local to git hub 
  git init
  git branch -m main
  git add all you file and commit 
  git branch -m main
  git remote add origin https://github.com/kvnikhildev/python-app-1.git   # use yourrepositry
  git push -u origin main
