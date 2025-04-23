pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "bunny543/algorithm-visualizer:latest"
        APP_PORT = "90"
    }

    stages {
        stage('Checkout Code') {
            steps {
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

        stage('Deploy Docker Container') {
            steps {
                script {
                    bat 'echo Deploying container on port %APP_PORT%'
                    bat 'docker stop Algorithm-Visualizer || exit 0'
                    bat 'docker rm Algorithm-Visualizer || exit 0'
                    bat 'docker run -d -p %APP_PORT%:%APP_PORT% --name Algorithm-Visualizer %DOCKER_IMAGE%'
                }
            }
        }
    }

    post {
        success {
            script {
                echo "✅ Pipeline completed successfully!"
                echo "🌐 Application is running at: http://localhost:${env.APP_PORT}"
            }
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}
