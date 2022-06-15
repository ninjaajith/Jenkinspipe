pipeline {
    
    environment {
    dockerimage = ''
    registryCredential='dockerhub_Ajith'
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
                        
                        dockerimage.push("${env.BUILD_ID}")
                     }
                    }
                } 
            }
           stage("Deploy to kubernete"){
             steps {
                 sshagent(['jenkins_agent_key']) {
                // some block
                   }
                }
            }
        } 
    }
