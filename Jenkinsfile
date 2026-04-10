pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/Nirupa14/devops-pipeline-project.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'cd app && npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t nirupa14/devops-app:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh 'docker push nirupa14/devops-app:latest'
            }
        }
    }
}
