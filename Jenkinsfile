pipeline {
  agent any

  environment {
    IMAGE_NAME = 'python-jenkins-app'
    DOCKERHUB_REPO = 'yourdockerhub/python-jenkins-app'
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/yourusername/python-jenkins-app.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Test') {
      steps {
        sh 'python3 -m unittest discover tests'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
            echo $PASSWORD | docker login -u $USERNAME --password-stdin
            docker tag $IMAGE_NAME $DOCKERHUB_REPO
            docker push $DOCKERHUB_REPO
          '''
        }
      }
    }

    stage('Deploy') {
      steps {
        sh './deploy.sh'
      }
    }
  }
}
// This Jenkinsfile defines a CI/CD pipeline for a Python application using Docker.
// It includes stages for checking out the code, building a Docker image, running tests,