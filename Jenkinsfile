pipeline {

  environment {
    registry = "10.7.16.1:5000/myweb"
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/Zl-hammou/jenkins.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker . build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( "" ) {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy App') {
      steps {
	      script {
          	sh "chmod a+x changeTag.sh"
		sh "./changeTag.sh $BUILD_NUMBER"
		kubernetesDeploy(kubeconfigId: 'mykubeconfig', configs: 'mywebtagVersion.yml')
        }
      }
    }

  }

}
