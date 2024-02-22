#!/bin/bash
 
sudo apt update
 
#docker setup
echo "Installing docker"
sudo apt install ca-certificates curl gnupg wget apt-transport-https -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 
#minikube setup
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
echo "source <(minikube completion bash)" >> ~/.bashrc
source ~/.bashrc
 
#kubectl setup
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
echo "source <(kubectl completion bash)" >> ~/.bashrc
source ~/.bashrc
 
#git setup 
git clone https://github.com/nodejs/examples
 
#starting minikubes
minikube start --force
minikube addons enable ingress
 
#building image
minikube image build -t faurecia-app -f ./Dockerfile .
 
#deploying app
kubectl apply -f Deployment.yaml
kubectl wait --for=condition=available faurecia-app --timeout=5m
kubectl expose deployment faurecia-app --type=NodePort --port=3000
 
#creating ingress
kubectl apply -f Ingress.yaml
 
#get minikube ip
minikubeIP=$(minikube ip)
echo "Minikube IP "= $minikubeIP
 
#assign custom local domain
echo "$minikubeIP  challenge.local.faurecia-aptoide.com" | sudo tee -a /etc/hosts

#acessing url
sleep 3
curl challenge.local.faurecia-aptoide.com