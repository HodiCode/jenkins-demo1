pipeline{
    agent any
    stages{
        stage("check cred"){
            steps{
                echo "======= printing cred ========"
                withCredentials([
                    string(
                        credentialsId: 'demo-secret',
                        variable: 'TOKEN'
                    )
                ]){
                    //  TOKENis valid
                    sh 'echo "token: ${TOKEN}"'
                }
                //  not a valid secret
            }
        }
        stage("check username and password"){
            steps{
                echo "-------- printing the username and password cred --------"
                withCredentials([
                    usernamePassword(
                        credentialsId:'user1',
                        usernameVariable:'USER',
                        passwordVariable:'PASS'
                    )
                ])
                {
                    sh 'echo "logging to docker using"'
                    sh 'echo "docker login -u ${USER} -p ${PASS} hub.docker.com"'
                    
                }
            }
        }
        stage("ping google"){
            steps{
                echo 'pinging the google services'
                retry(5){
                    sh 'ping -c 5 8.8.8.8'
                    sh 'sleep 5'
                }
            }
        }
    }
}