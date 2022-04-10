pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
              sh '''
              echo "Planning infrastructure"
              cd terraform
              terraform init
              terraform plan
              '''
            }
        }
    stage('Deploy') {
        steps {
            sh '''
            echo "Deploying infrastructure..."
            cd terraform
            terraform destroy -auto-approve
            '''
            }
        }
    stage('finish') {
        steps {
            sh '''
           echo "pipeline finished"
            '''
            }
        }
    }
    post {
      always {
        deleteDir()
      }
    }
}