pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'PATTEM-HEMANTH', url: 'https://github.com/PATTEM-HEMANTH/static-webapp-ci-cd-project.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    def app = docker.build("PATTEM-HEMANTH/static-webapp:${env.BUILD_ID}")
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def app = docker.build("PATTEM-HEMANTH/static-webapp:${env.BUILD_ID}")
                    app.push("/static-webapp:latest")
                }
            }
        }
    }
}
