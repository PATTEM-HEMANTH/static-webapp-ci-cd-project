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
                  def app = docker.image("hemanthpattem/static-web-app/static-webapp:${env.BUILD_ID}")
                        // Push the image with the build ID tag
                        app.push("${env.BUILD_ID}")
                        // Push the image with the latest tag
                        app.push("latest")
                }
            }
        }
    }
}
