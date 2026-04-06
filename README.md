🚀 CI/CD Pipeline with AWS EKS, Docker & CodePipeline
This project demonstrates a complete end-to-end CI/CD pipeline for deploying a containerized application on AWS using:
•	EC2 
•	Docker 
•	Amazon ECR 
•	Amazon EKS 
•	AWS CodeBuild 
•	AWS CodePipeline 
The pipeline automates building, pushing, and deploying the application to Kubernetes.
________________________________________
📌 Architecture Overview
1.	Developer pushes code to GitHub 
2.	CodePipeline triggers 
3.	CodeBuild builds Docker image 
4.	Image pushed to ECR 
5.	Kubernetes deployment updated in EKS 
6.	Application exposed via LoadBalancer 
________________________________________
⚙️ Step-by-Step Implementation
Step 1: Launch EC2 Instance
•	Create an EC2 instance from AWS Console 

![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/EC2_instance.png)

•	Configure Security Group Inbound Rules: 
o	SSH (22) 
o	HTTP (80) 
o	Custom port- 3000
 
________________________________________
Step 2: Connect to EC2 & Clone Repository
git clone https://github.com/Vennilavanguvi/Brain-Tasks-App.git
cd Brain-Tasks-App

![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/Cloning_repo.png)

________________________________________
Step 3: Install Docker & Create Dockerfile to build the image
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/docker_install.png)

________________________________________
Step 4: Install eksctl & kubectl

![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/eksctl_version.png)
![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/kubectl_version.png)

________________________________________
Step 5: Create EKS Cluster
eksctl create cluster --name my-cluster --region us-east-1

![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/EKS_cluster.png)

•	Attach required IAM roles for cluster access 
![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/EKS_cluster_IAMroles.png)
________________________________________
Step 6: Create ECR Repository
![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/ECR_repo.png)

•	Authenticate Docker to ECR 
•	Tag and push the Docker image in buildspec.yaml file
________________________________________
Step 7: Create Kubernetes Manifests
Create the following files:
•	deployment.yaml 
•	service.yaml 
________________________________________
Step 8: Setup CodeBuild
•	Create buildspec.yml 
•	Configure CodeBuild project: 
o	Source: GitHub 
o	Environment: Managed image 
o	IAM Role: With ECR & EKS permissions 

![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/CodeBuild.png)
![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/CodeBuild_config1.png)
![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/CodeBuild_config2.png)

________________________________________
Step 9: Attach IAM Role to CodeBuild
Ensure permissions:
•	AmazonEC2ContainerRegistryFullAccess 
•	AmazonEKSClusterPolicy 
•	CloudWatchLogsFullAccess 
________________________________________
Step 10: Create CodePipeline
Pipeline stages:
1.	Source – GitHub repository 
2.	Build – CodeBuild project 
3.	Deploy – Kubernetes (EKS)

![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/CodePipeline.png)
![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/CodePipeline_conf.png)
________________________________________
✅ Deployment Output
After successful execution:
•	✅ Docker image built successfully 
![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/docker_image.png)

•	✅ Image pushed to Amazon ECR 
![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/image_push.png)

•	✅ Kubernetes Deployment created 
![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/resources_1.png)

•	✅ Service exposed via LoadBalancer 
________________________________________
🌐 Access Application
Get external URL:
kubectl get svc
•	Copy the EXTERNAL-IP from LoadBalancer 
•	Open it in browser 
![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/Loadbalancer_ARN.png)
________________________________________

Step 11: Go to CloudWatch
Check logs for build and deploy
![EC2 Instance](https://github.com/Aditikhare31/mindtrack-project/blob/main/MindTrack/CloudWatch_logs.png)
