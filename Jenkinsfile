pipeline {
    agent any
    environment {
        BASH = 'C:\\Users\\Anirudh\\AppData\\Local\\Programs\\Git\\bin\\bash.exe'
        
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
                    bat "${env.BASH} scripts/terraform-deploy.sh"    
                }
            }
        }
        stage('Output URL') {
            steps {
                script {
                    // Ensure terraform apply was run and output is available
                    def websiteUrl = bat(script: 'terraform output -raw website_url', returnStdout: true).trim()
                    
                    // Concatenate the URL with "http://"
                    def fullUrl = "http://${websiteUrl}"
                    echo "The website is live at: ${fullUrl}"
                }
            }
        }
    }
}
