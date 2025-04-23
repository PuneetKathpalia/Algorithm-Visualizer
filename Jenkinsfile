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
                    // Build the Docker image using the Dockerfile
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

     stage('Push Docker Image') {
    steps {
        script {
            withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                sh 'docker push bunny543/algorithm-visualizer:latest'
            }
        }
    }
}


        stage('Deploy Docker Container') {
            steps {
                script {
                    // Pull the latest Docker image and run the container
                    sh 'docker pull $DOCKER_IMAGE'
                    sh 'docker stop Algorithm-Visualizer || true'
                    sh 'docker rm Algorithm-Visualizer || true'
                    sh 'docker run -d -p 90:90 --name Algorithm-Visualizer $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}