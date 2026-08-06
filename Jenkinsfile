pipeline{
    agent any
    environment {
        APP_NAME = "hello-app"
        IMAGE_NAME= "hello-image"
        DOCKER_HUB_REPO= "hothaifaz11/hello-app"
        
    }
    stages{
        stage('stage A'){
            steps{
                sh 'echo stage 1'
                sh "echo ${APP_NAME} is the app name"
            }

        }
        stage('BUILD'){
            steps{
                sh 'echo building docker image ${IMAGE_NAME}:v1.0.${BUILD_NUMBER}'
            }
        }
        stage('stage C'){
            steps{
                sh 'echo stage 3'
            }
        }
        stage('stage D'){
            steps{
                sh 'echo stage 4'
            }
        }
    }
}