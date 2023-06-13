# Instabug intern task 

🚨 This DevOps project showcases how to use Dockerfile, Jenkinsfile, docker-compose, k8s, Helm charts, and ArgoCD 

## Step 1 : Dockerized Golang Application 

The `Dockerfile` containes the instrutions how to build and run a Go application using Docker, and it exposes the application on port `9090`.

To build the Docker image for this application, run the following command:

    ```bash
    docker build -t melmesary/golang-app:v1.0 .
    ```
> You should see an output like that when run the above command
> ![slack-notifications](../../images/slack-notifications.PNG) 
______ 
 ## Step 2 : Pipline