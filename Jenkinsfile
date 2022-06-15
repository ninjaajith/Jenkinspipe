
pipeline {
    
    environment {
    dockerimage=''
    }
    agent any

    stages {
        stage('Check Out from SCM') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ninjaajith/Jenkinspipe.git']]])
            }
        }
         stage('Build docker image') {
            steps {
                   dockerimage = docker.build "ninjaajith/godocker" + ":$BUILD_NUMBER"
              
            }
        }
         stage('Stage 3') {
            steps {
                echo 'Hello Venus'
            }
        }
        stage('Stage 4') {
            steps {
                echo 'Hello Earth'
            }
        }
        stage('Stage 5') {
            steps {
                echo 'Hello Moon'
            }
        }
        
    }
}


