pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/kshrikant7/Terraform-Assignment.git'
            }
        }

        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}