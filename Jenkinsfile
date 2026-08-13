pipeline{
    agent any
    environment{
        IMAGE_NAME= 'hello-app'
        IMAGE_TAG= "${BUILD_NUMBER}"
        FULL_IMAGE= "hothaifaz11/${IMAGE_NAME}:V${IMAGE_TAG}"

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
        stage("start container")
        {
            steps{
                sh "docker network create jenkins-net"
                sh "docker run --name ${CONTAINER_NAME} -d -p 5001:5000 ${FULL_IMAGE}"
                sh "docker network connect jenkins-net jenkins"
                sh "docker network connect jenkins-net ${CONTAINER_NAME}"
                
            }
        }
        stage("test"){
            parallel{
                stage("smoke test"){
                    steps{
                         echo "++++++++++++docker image verify ++++++++++++"
                         sh """
                                chmod +x tests/smoke.sh
                                ./tests/smoke.sh
                         """    
                    }
                }
                stage("api test"){
                    steps{
                        echo "++++++++++++n docker image verify ++++++++++++"
                        sh "curl --fail --silent ${CONTAINER_NAME}:5000/"
                    }
                }
            }
        }
        stage("deploy artifacts"){
            steps{
                echo "++++++++++++docker build ++++++++++++"
                withCredentials([
                    usernamePassword(
                        credentialsId:"docker-cred",
                        usernameVariable: "DOCKER_USER",
                        passwordVariable: "PAT"
                    ){
                        sh'''
                        echo "${PAT}" | docker login \
                        -u "${DOCKER_USER}"\
                        --password-stdin

                        docker push "${FULL_IMAGE}"

                        docker logout
                        '''
                    }
                ])
            }
        }

    }
    post{
        always{
            sh 'docker rm -f ${CONTAINER_NAME}'
            sh "docker rmi ${FULL_IMAGE}"
            sh 'docker network disconnect jenkins-net jenkins'
            sh 'docker network rm jenkins-net '
            cleanWs()
        }
    }
}