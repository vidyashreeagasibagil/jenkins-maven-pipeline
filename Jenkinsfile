pipeline{
  agent any
  environment{
    PASS=credentials('DockerHub')
    dockerRun='docker run -p 8080:8080 -d --name maven-project vidyaaydiv/maven-project:2'
  }
  stages{
    stage('Build'){
      steps{
        sh '''
            ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
            ./jenkins/build/build.sh
           '''
      }
    }
    stage('Test'){
      steps{
        sh '''
           ./jenkins/test/mvn.sh

           '''
      }
    }
    stage('Push'){
      steps{
        sh '''
           ./jenkins/push/push.sh
           '''
      }
    }
    stage('Deploy'){
      steps{
          sh "ssh -o StrictHostKeyChecking=no ec2-user@184.72.65.174 ${dockerRun}"
      }
    }
  }
}
