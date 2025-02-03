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
                // Disable color output from terraform
                withEnv(["TF_CLI_ARGS=-no-color"]) {
                    // Get the website URL from terraform output
                    def websiteUrl = bat(script: 'terraform output -raw website_url', returnStdout: true).trim()
                    
                    // Check if the URL is fetched correctly
                    if (websiteUrl) {
                        def fullUrl = "http://${websiteUrl}"
                        echo "The website is live at: ${fullUrl}"
                    } else {
                        error "No URL found. Terraform output may be missing or incorrect."
                    }
                }
            }
        }
    }

    }
}
