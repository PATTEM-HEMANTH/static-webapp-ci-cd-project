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
                    // Hardcoded credentials (for demonstration purposes only)
                    def dockerUsername = 'hemanthpattem'
                    def dockerPassword = 'Dockerhub@7870'

                    sh """
                    echo $dockerPassword | docker login -u $dockerUsername --password-stdin
                    """

                    def app = docker.image("hemanthpattem/static-web-app/static-webapp:${env.BUILD_ID}")
                    app.push("${env.BUILD_ID}")
                    app.push("latest")

                    // Logout from Docker
                    sh 'docker logout'
                }
            }
        }
    }
}
