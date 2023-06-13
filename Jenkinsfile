pipeline {
    agent any
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = 'my-docker-image'
                    def dockerTag = 'latest'
                    def dockerRegistry = 'docker.io'

                    // Build Docker image
                    def dockerBuild = docker.build("${dockerRegistry}/${dockerImage}:${dockerTag}", "-f Dockerfile .")
                    def buildLog = dockerBuild.inside {
                        sh "docker build -t ${dockerRegistry}/${dockerImage}:${dockerTag} ."
                    }

                    // Check if build was successful
                    if (buildLog.contains("Successfully built")) {
                        echo "Docker image built successfully"
                    } else {
                        error "Docker image build failed"
                    }

                    // Push image to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                        sh "docker push ${dockerRegistry}/${dockerImage}:${dockerTag}"
                    }
                }
            }
        }
    }
}