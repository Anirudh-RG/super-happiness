pipeline {
    agent any
    environment {
        BASH = 'C:\\Users\\Anirudh\\AppData\\Local\\Programs\\Git\\bin\\bash.exe'
    }
    stages {
        stage('Verify Environment') {
            steps  {
                bat 'echo %BASH%'
                bat 'echo %PATH%'
            }
    }
        stage('Install and run vite ') {
            steps {
                echo "starting with installation"
                bat "${env.BASH} scripts/stage1.sh"
                echo "done with install"
            }
        }
        stage('Wait for user termination'){
            steps{
                input message: 'Click OK to terminate server',parameters:[]

            }
        }
        stage('Stop dev server'){
            steps{
                script{
                    bat "${env.BASH} scripts/kill.sh"
                }
            }
        }
    }
}
