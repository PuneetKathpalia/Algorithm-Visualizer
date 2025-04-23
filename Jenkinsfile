pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "bunny543/algorithm-visualizer:latest"
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code from GitHub
                git branch: 'main', url: 'https://github.com/PuneetKathpalia/Algorithm-Visualizer.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat 'echo Building Docker image: %DOCKER_IMAGE%'
                    bat 'docker build -t %DOCKER_IMAGE% .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        bat 'echo Logging in to Docker Hub...'
                        bat 'echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin'
                        bat 'docker push %DOCKER_IMAGE%'
                    }
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    bat 'echo Deploying container using image: %DOCKER_IMAGE%'
                    bat 'docker pull %DOCKER_IMAGE%'
                    bat 'docker stop Algorithm-Visualizer || exit 0'
                    bat 'docker rm Algorithm-Visualizer || exit 0'
                    bat 'docker run -d -p 90:90 --name Algorithm-Visualizer %DOCKER_IMAGE%'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}
