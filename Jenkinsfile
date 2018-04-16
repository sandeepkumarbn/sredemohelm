#!groovy

pipeline {
  agent none
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t sredemo/nginx_demo:1.0 .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'docker-hub-credentialsPassword', usernameVariable: 'docker-hub-credentialsUser')]) {
          sh "docker login -u ${env.docker-hub-credentialsUser} -p ${env.docker-hub-credentialsPassword}"
          sh 'docker push sredemo/nginx_demo:1.0:1.0'
        }
      }
    }
    stage('Docker ClearImages') {
      agent any
      steps {
        sh 'docker rmi -f $(docker images -a -q)'
      }
    }    
}