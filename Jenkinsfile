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
                
                    // Create our project directory.
                    sh 'cd ${GOPATH}/src'
                    sh 'mkdir -p ${GOPATH}/src/hello-world'
                    // Copy all files in our Jenkins workspace to our project directory.
                    sh 'cp -r ${WORKSPACE}/* ${GOPATH}/src/hello-world'
                    // Build the app.
                    sh 'go build'
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
        } 
    }
