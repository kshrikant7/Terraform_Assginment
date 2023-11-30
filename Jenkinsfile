pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    SSH_PUBLIC_KEY        = credentials('SSH')
  }

  stages {
    stage('Terraform Init') {
      steps {
        script {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        script {
          // Pass SSH public key as a Terraform variable
          sh 'terraform apply -auto-approve -var="ssh_public_key=${env.SSH_PUBLIC_KEY}"'
        }
      }
    }
  }

  post {
    always {
      script {
        // Pass SSH public key for destroy as well
        sh 'terraform destroy -auto-approve -var="ssh_public_key=${env.SSH_PUBLIC_KEY}"'
      }
    }
  }
}
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code from the Git repository
                git 'https://github.com/kshrikant7/Terraform_Assignment.git'
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Show what Terraform will do
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply the Terraform configuration
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
