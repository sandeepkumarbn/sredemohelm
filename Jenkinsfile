#!groovy

pipeline {
  agent none
  stages {
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t sandeep1983/nginx_demo:1.0 .'
      }
    }
    stage('Docker Push') {
      agent none
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'docker-hub-credentialsPassword', usernameVariable: 'docker-hub-credentialsUser')]) {
          sh "docker login -u ${env.docker-hub-credentialsUser} -p ${env.docker-hub-credentialsPassword}"
          sh 'docker push sandeep1983/nginx_demo:1.0'
        }
      }
    }
  } 
}