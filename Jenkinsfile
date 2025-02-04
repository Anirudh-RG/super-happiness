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
        stage('S3 ops through command line') {
            steps {
                echo "started s3 ops"
                script {
                    bat "${env.BASH} scripts/aws_s3_script.sh"    
                }
                echo "finished with s3 ops"
            }
        }
        stage('Output URL') {
            steps {
                echo "http://data-store-02.s3-website-ap-south-1.amazonaws.com"
            }
        }
    }
}
