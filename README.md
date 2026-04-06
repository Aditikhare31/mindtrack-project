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
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/ec2_instance.png)

•	Configure Security Group Inbound Rules: 
o	SSH (22) 
o	HTTP (80) 
o	Custom port- 3000
 
________________________________________
Step 2: Connect to EC2 & Clone Repository
git clone https://github.com/Vennilavanguvi/Brain-Tasks-App.git
cd Brain-Tasks-App
________________________________________
Step 3: Install Docker & Create Dockerfile to build the image
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
________________________________________
Step 4: Install eksctl & kubectl
________________________________________
Step 5: Create EKS Cluster
eksctl create cluster --name my-cluster --region ap-south-1
•	Attach required IAM roles for cluster access 
________________________________________
Step 6: Create ECR Repository
aws ecr create-repository --repository-name your-repo-name
•	Authenticate Docker to ECR 
•	Tag and push the Docker image 
________________________________________
Step 7: Create Kubernetes Manifests
Create the following files:
•	deployment.yaml 
•	service.yaml 
Apply them:
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
________________________________________
Step 8: Setup CodeBuild
•	Create buildspec.yml 
•	Configure CodeBuild project: 
o	Source: GitHub 
o	Environment: Managed image 
o	IAM Role: With ECR & EKS permissions 
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
________________________________________
✅ Deployment Output
After successful execution:
•	✅ Docker image built successfully 
•	✅ Image pushed to Amazon ECR 
•	✅ Kubernetes Deployment created 
•	✅ Service exposed via LoadBalancer 
________________________________________
🌐 Access Application
Get external URL:
kubectl get svc
•	Copy the EXTERNAL-IP from LoadBalancer 
•	Open it in browser 
________________________________________
📊 Result
✔ Fully automated CI/CD pipeline
✔ Scalable Kubernetes deployment
✔ Cloud-native architecture
✔ Continuous delivery enabled
________________________________________

