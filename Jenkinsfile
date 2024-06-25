     pipeline {
         agent any

         stages {
             stage('Checkout') {
                 steps {
                     git 'https://github.com/yourusername/static-webapp-ci-cd-project.git'
                 }
             }

             stage('Build') {
                 steps {
                     script {
                         def app = docker.build("yourusername/static-webapp:${env.BUILD_ID}")
                     }
                 }
             }

             stage('Deploy') {
                 steps {
                     script {
                         app.push()
                     }
                 }
             }
         }
     }
     
