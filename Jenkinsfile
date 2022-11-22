node {
    def mavenHome = tool name : "maven3.8.6"
    def buildnumber = BUILD_NUMBER
stage('CheckOut_Code') {
  git credentialsId: '4735d413-1ac8-4b65-867c-23e03607e5d1', url: 'https://github.com/Deep0511/java-web-app-docker.git'    
}    
stage ('Build') {
    sh "${mavenHome}/bin/mvn clean package"
}    
stage ('Build-Docker-Image') {
    sh "docker build -t 623158369342.dkr.ecr.ap-south-1.amazonaws.com/java-web-application:${buildnumber} ."
}
stage ('Login to ECR') {
    sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 623158369342.dkr.ecr.ap-south-1.amazonaws.com"
}
stage ('Push To ECR') {
   sh "docker push 623158369342.dkr.ecr.ap-south-1.amazonaws.com/java-web-application:${buildnumber}"   
}

stage ('Deploy-On-Container-On-Server'){
 sshagent(['ssh-agent']) {
sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.38.68 ./run_script.sh "
        
    }
}
}
