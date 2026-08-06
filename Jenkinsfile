pipeline{
    agent any
    environment {
        APP_NAME = "hello-app"
        IMAGE_NAME= "hello-image"
        DOCKER_HUB_REPO= "hothaifaz11/hello-app"
        
    }
    stages{
        stage('BUILD'){
            steps{
                echo '============ building docker image =============='
                sh 'echo ========== ${IMAGE_NAME}:v${BUILD_NUMBER}'
                sh 'docker build -t ${IMAGE_NAME}:v${BUILD_NUMBER} .'
                echo '============ verify docker image ==============' 
                sh 'docker images | grep -i ${IMAGE_NAME} '
            }

        }
        stage('Test'){
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