pipeline{
  agent any
  environment{
    PASS=credentials('DockerHub')
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
          sh "docker -H ssh://ec2-user@172.31.24.7 run -d -p 8080:8080 vidyaaydiv/maven-project"
      }
    }
  }
}
