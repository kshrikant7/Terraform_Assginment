pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
    }
  stages {
        stage('Init/Plan/Apply') {
            steps {
                script {
                    withAWS(region: AWS_REGION, credentials: 'AWS') {
                        sh 'terraform init'
                        sh 'terraform plan'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
        stage('Get private key') {
            steps {
                script {
                    sh "sudo chmod 400 /var/lib/jenkins/workspace/'Terraform Assignment'/private_key.pem"
                    sh "sudo cp /var/lib/jenkins/workspace/'Terraform Assignment'/private_key.pem /home/sigmoid/"
                }
            }
        }
    }
}
