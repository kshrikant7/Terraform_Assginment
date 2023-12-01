pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        AWS_ACCESS_KEY_ID_FILE = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY_FILE = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Setup AWS Credentials') {
            steps {
                script {
                    // Read AWS access key ID and secret access key from files
                    AWS_ACCESS_KEY_ID = readFile(env.AWS_ACCESS_KEY_ID_FILE).trim()
                    AWS_SECRET_ACCESS_KEY = readFile(env.AWS_SECRET_ACCESS_KEY_FILE).trim()

                    // Mask the credentials in the Jenkins logs
                    maskPasswords([$class: 'SecretBuildWrapper', credentials: [[$class: 'FileSecretCredentialBinding', secretBytes: hudson.util.Secret.fromString(AWS_ACCESS_KEY_ID), fileName: 'AWS_ACCESS_KEY_ID'], [$class: 'FileSecretCredentialBinding', secretBytes: hudson.util.Secret.fromString(AWS_SECRET_ACCESS_KEY), fileName: 'AWS_SECRET_ACCESS_KEY']]])

                    // Set AWS credentials as environment variables
                    env.AWS_ACCESS_KEY_ID = AWS_ACCESS_KEY_ID
                    env.AWS_SECRET_ACCESS_KEY = AWS_SECRET_ACCESS_KEY

                    sh 'echo $AWS_ACCESS_KEY_ID'
                    sh 'echo $AWS_SECRET_ACCESS_KEY'
                }
            }
        }

        stage('Init/Plan/Apply') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh 'terraform init'
                    sh 'terraform plan'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
