pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/Nirupa14/devops-pipeline-project.git'
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Building project..."'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
            }
        }

        stage('Quality Check') {
            steps {
                sh 'echo "Checking quality..."'
            }
        }
    }
}
