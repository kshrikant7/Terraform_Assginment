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
        stage('Print Workspace Directory') {
            steps {
                script {
                    echo "Workspace Directory: ${workspace}"
                }
            }
        }
    }
}
