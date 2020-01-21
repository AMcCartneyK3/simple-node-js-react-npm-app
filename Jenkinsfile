pipeline {
    agent {
        docker {
            image 'node:6-alpine'
            label 'k3-cd-demo'
            args '-p 3000:3000 -u 0:0'
        }
    }
    triggers {
        cron('H */4 * * 1-5')
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                echo 'Proceeding with build'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                echo 'Executing tests'
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver Development') {
            when {
                branch 'master'
            }
            steps {
                echo 'Launching application server'
                sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                echo 'Shutting down application server'
                sh './jenkins/scripts/kill.sh'
            }
        }
        stage('Deliver Production') {
            when {
                branch 'production'
            }
            steps {
                echo 'Launching application server'
                sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                echo 'Shutting down application server'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
