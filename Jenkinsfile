pipeline{
    agent any
    environment{
        BASH = 'C:\\Users\\Anirudh\\AppData\\Local\\Programs\\Git\\bin\\bash.exe'
    }
    stages{
        stage('install'){
            steps{
                echo "starting install"
                bat "npm install"
                echo "installatoon done"
            }
        }
        stage('Build'){
            steps{
                echo "building"
                bat "npm run dev"
                echo "done"
            }
        }
    }
}