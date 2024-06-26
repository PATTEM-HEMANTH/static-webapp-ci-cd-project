pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
               git branch: 'main', url: 'https://github.com/PATTEM-HEMANTH/static-webapp-ci-cd-project.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    def app = docker.build("hemanthpattem/static-web-app/static-webapp:${env.BUILD_ID}")
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def app = docker.build("hemanthpattem/static-web-app/static-webapp:${env.BUILD_ID}")
                    app.push("hemanthpattem/static-web-app/static-webapp:latest")
                }
            }
        }
    }
}
