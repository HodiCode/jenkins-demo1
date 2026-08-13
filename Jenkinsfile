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
    }
}