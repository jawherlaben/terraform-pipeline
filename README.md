
# Terraform Pipeline with Jenkins and Azure

This project illustrates how to integrate **Jenkins**, **Terraform**, and **Azure AKS** to deploy a containerized application in a Kubernetes cluster.

## **Prerequisites**

Before starting, make sure you have installed:
- **Docker**: To build and run the custom Jenkins image.
- **Terraform**: To manage Kubernetes resources.
- **Azure CLI**: To configure the kubeconfig file and access the AKS cluster.
- An Azure account with the necessary permissions to create resources.

---

## **Project Structure**
- **`Dockerfile`**:
  - Defines a Jenkins Docker image with Terraform, Docker CLI, and kubectl preinstalled.
- **`./terraform/main.tf`**:
  - Describes the Kubernetes resources (namespace, deployments).
- **`./terraform/providers.tf`**:
  - Configures the Terraform provider for Kubernetes via Azure AKS.
- **Jenkins Pipeline**:
  - Automates the Terraform steps: `init`, `plan`, and `apply`.

---

## **Project Steps**

### 1. **Create and Run the Jenkins Docker Image**
```bash
docker build . -t jenkins-image:v1
docker run -d -p 8080:8080 -p 50000:50000   -v ~/.kube:/var/jenkins_home/.kube   -v jenkins_home:/var/jenkins_home   --name jenkins-instance jenkins-image:v1
```

### 2. **Configure the Kubernetes Cluster**
Create a virtual machine on Azure.
Initialize the Kubernetes cluster using kubeadm.
![image](https://github.com/user-attachments/assets/27cc1a28-981e-4dd7-86c3-d0abcddf4ddc)


### 3. **Deploy with Terraform**
user Jenkins file
![image](https://github.com/user-attachments/assets/e0f757a9-9fa8-4510-8993-e9d4cfcf03c7)


![image](https://github.com/user-attachments/assets/dfb08194-ba87-4f6d-9e33-57bb4c2a7d33)
