pipeline {
    agent any
    environment {
        BASH = 'C:\\Users\\Anirudh\\AppData\\Local\\Programs\\Git\\bin\\bash.exe'
        AWS_CREDS = 'anirudh-aws-creds'
    }
    stages {
        stage('Build') {
            steps {
                echo "Starting build process..."
                bat 'npm install'
                bat 'npm run build'
                echo "Build completed, dist/ folder created."
            }
        }
        stage('Terraform Ops') {
            steps {
                script {
                    withAws(credentials: AWS_CREDS){
                        bat "${env.BASH} scripts/terraform-deploy.sh"
                    }
                }
            }
        }
        stage('Output URL') {
            steps {
                script {
                    bat 'terraform output website_url'
                }
            }
        }
    }
}
