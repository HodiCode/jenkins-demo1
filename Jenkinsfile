pipeline{
    agent any
    environment{
        IMAGE_NAME= 'hello-app'
        IMAGE_TAG= "${BUILD_NUMBER}"
        FULL_IMAGE= "${IMAGE_NAME}:V${IMAGE_TAG}"

        CONTAINER_NAME = "application"
        
    }
    stages{
        stage("docker build"){
            steps{
                echo "++++++++++++docker build ++++++++++++"
                sh "docker build -t ${FULL_IMAGE}  applicaiton/ " 
            }
        }
        stage("docker verify"){
            steps{
                echo "++++++++++++docker image verify ++++++++++++"
                sh "docker images | grep ${IMAGE_NAME}"
            }
        }
        stage("test"){
            parallel{
                stage("smoke test"){
                    steps{
                         echo "++++++++++++docker image verify ++++++++++++"
                    }
                }
                stage("api test"){
                    steps{
                        echo "++++++++++++docker image verify ++++++++++++"
                    }
                }
            }
        }
        stage("deploy artifacts"){
            steps{
                echo "++++++++++++docker build ++++++++++++"
            }
        }

    }
}