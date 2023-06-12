pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = 'instabugapp'
                    def dockerTag = 'v1.2'
                    def dockerRegistry = 'melmesary'

                    // Build Docker image
                    sh "docker build -t ${dockerRegistry}/${dockerImage}:${dockerTag} ."
                    def buildLog = sh(returnStdout: true, script: "docker build -t ${dockerRegistry}/${dockerImage}:${dockerTag} .")

                    // Check if build was successful
                    if (buildLog.contains("Successfully built")) {
                        echo "Docker image built successfully"
                    } else {
                        error "Docker image build failed"
                    }

                    // Push image to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh "docker login -u ${USERNAME} -p ${PASSWORD}"
                        sh "docker push ${dockerRegistry}/${dockerImage}:${dockerTag}"
                    }
                }
            }
        }
    }
}