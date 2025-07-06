# 🚀 Jenkins CI/CD Pipeline for Python App on AWS ECS

This project demonstrates a full **CI/CD pipeline** using:

- 🐍 Python + Flask (sample app)
- 🐳 Docker for containerization
- ⚙️ Jenkins for CI/CD automation
- 🛠️ Terraform for Infrastructure as Code (IaC)
- ☁️ AWS ECS (Fargate) for orchestration

---

## 📁 Project Structure

jenkins-python-cicd/
├── app/ # Python Flask app
│ └── main.py
├── tests/ # Unit tests
│ └── test_main.py
├── Dockerfile # Container image definition
├── Jenkinsfile # Jenkins pipeline definition
├── terraform/ # Infrastructure as Code
│ ├── main.tf
│ ├── variables.tf
│ └── terraform.tfvars
├── .gitignore
└── README.md


---

## ⚙️ CI/CD Pipeline Workflow

1. ✅ Developer pushes code to GitHub
2. ✅ Jenkins triggers the pipeline
3. ✅ Jenkins:
   - Runs Python unit tests
   - Builds Docker image
   - Pushes image to Docker Hub
4. ✅ Jenkins runs `terraform apply`
5. ✅ Terraform deploys the updated container to AWS ECS (Fargate)

---

## 🔧 Tech Stack

| Tool        | Role                          |
|-------------|-------------------------------|
| Python/Flask| Backend web application       |
| Docker      | App containerization          |
| Jenkins     | CI/CD orchestration           |
| Terraform   | Infrastructure as Code (IaC)  |
| AWS ECS     | App hosting (Fargate)         |
| GitHub      | Source control & Webhook      |

---

## 🌐 Architecture Overview

GitHub → Jenkins → Docker Hub → Terraform → AWS ECS (Fargate)
↓ ↓
Unit Tests Flask App


---

## 🧪 Run Locally (Optional)

```bash
# Build Docker image
docker build -t python-jenkins-app .

# Run the container locally
docker run -p 5000:5000 python-jenkins-app

# Visit in browser
http://localhost:5000

Make sure your main.py has this line:

app.run(host="0.0.0.0", port=5000)

#  initialize and deploy
cd terraform
terraform init
terraform apply

Terraform will:

Create VPC, Subnets, Security Group

Create ECS Cluster & Service

Deploy the container

# Get the public IP from ECS task to test in browser
http://<public-ip>:5000

🛡️ Security Notes
Use IAM roles or GitHub secrets — never hardcode AWS credentials

Docker Hub repo must be public unless you use AWS ECR

Consider adding:

CloudWatch Logs

ALB + Route 53 + ACM (for HTTPS)

Email/Slack deployment alerts
