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
                bat "${env.BASH} scripts/stage1.sh"
            }
        }
    }
}
