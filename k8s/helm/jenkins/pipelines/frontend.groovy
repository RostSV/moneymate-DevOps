pipeline {
    agent any
    environment {
        CONTAINER_REGISTRY = 'https://fsa2024rsvistularegistry.azurecr.io'
        DOCKER_REPOSITORY = 'fsa2024rsvistularegistry.azurecr.io'
        IMAGE_NAME = 'fsa-frontend'
    }

    stages {
        stage('Clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Sleep') {
            steps {
                sh 'sleep 1s'
            }
        }
        stage('Checkout SCM') {
            steps {
                git credentialsId: 'github-credentials', branch: 'main', url: 'https://github.com/RostSV/moneymate-FE'
                script {
                    gitCommitId = sh(returnStdout: true, script: "git rev-parse --short HEAD").trim()
                    IMAGE_VERSION = sh(returnStdout: true, script: "echo ${BUILD_ID}-${gitCommitId}").trim()         
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                container('dind') {
                    withCredentials([usernamePassword(credentialsId: 'acr-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD} ${CONTAINER_REGISTRY}'
                    }
                    sh "docker build -t ${DOCKER_REPOSITORY}/${IMAGE_NAME}:${IMAGE_VERSION} ."
                    sh "docker push ${DOCKER_REPOSITORY}/${IMAGE_NAME}:${IMAGE_VERSION}"
                }
            }
        }
    }
}