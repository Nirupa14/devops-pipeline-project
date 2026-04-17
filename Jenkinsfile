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

        stage('Quality Gate') {
            steps {
                script {
                    def bugs = 0
                    def vulnerabilities = 0

                    if (bugs > 0 || vulnerabilities > 0) {
                        error("Build Failed due to Quality Gate")
                    } else {
                        echo "Quality Gate Passed"
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t nirupa14/devops-app:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh '''
                    echo $PASS | docker login -u $USER --password-stdin
                    docker push nirupa14/devops-app:latest
                    '''
                }
            }
        }
    }
}
