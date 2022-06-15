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
                script{
                   dockerimage = docker.build "ninjaajith/godocker" + ":$BUILD_NUMBER"
                }
              
            }
        }
         stage('Push docker image') {
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push("latest")
                        dockerImage.push("${env.BUILD_ID}")
                    }
                } 
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


