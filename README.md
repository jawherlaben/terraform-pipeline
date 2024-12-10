
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

### 3. **Deploy with Terraform**
user Jenkins file
