pipeline {
    agent any
    
    stages {
        
        stage('Git Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jawherlaben/terraform-pipeline']]])

            }
        }
        
        stage('Set Kubernetes Config') {
            steps {
                sh 'export KUBECONFIG=/var/jenkins_home/.kube/config'
            }
        }


        stage('Terraform init') {
            steps {
                dir("./terraform") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform plan') {
            steps {
                dir("./terraform") {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform apply') {
            steps {
                dir("./terraform") {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
