pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/nirupa14/devops-pipeline-project.git'
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
