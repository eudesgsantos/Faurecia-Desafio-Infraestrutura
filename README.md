# Solving The Challenge

![Alt text](diagram.png?raw=true)

To solve the challenge, ShellScript was used to deploy the application and Minikube for the infrastructure, so it was possible to obtain the main requirements requested in the activity.
Fault tolerance and availability were achieved, since the application can automatically restart crashed pods and containers within the single node, performs rolling deployments and is available in replicas.

The implementation used Ubuntu 22.04.3 LTS with 2 cores and 4GB of RAM.
To run the application, you only need to run the setup.sh script with root privileges, and the application will be available in the same custom local domain as the proposed solution http://challenge.local.faurecia-aptoide.com.

The Dockerfile, Deployment.yaml and Ingress.yaml files have been created in order to simplify modifications.

To deploy new versions, the updates.sh script was created, which updates the local git repository, builds a new image and then performs a rolling deployment on minikube. It receives a parameter for the tag, an example of execution would be: 
`sh update.sh v2`
Where v2 is the tag of the new image to be created and provisioned.

# Faurecia Aptoide
## Infrastructure Code Challenge
Thank you so much for taking the time to work on our code challenge. We expect it to take approx 4h to complete and would be ideal if you can send it to us within 1 week timeframe. Please don't hesitate to contact us by email with whatever question you have about it.

### Node deployment
Our development team has built the following nodejs application that needs to be deployed and public accessible with high availability: https://github.com/nodejs/examples/tree/main/servers/express/api-with-express-and-handlebars

### Your task
Design and describe the stack for this application (a draw/schema would be nice)

Implement code to provision a local infrastructure based in Kubernetes. (Example: Minikube)

Implement code to deploy the application (any language or open source tool is permitted)

Application must be accessible on a custom port using localhost, after deploy browser should open in the website

The solution should be fault tolerance with high availability

The solution can be up and running by executing a single command/script

### We expect
The solution should be easy to manage/maintain, if this is not possible to achieve within the proposed time frame then please describe any futures changes

You should write a few lines explaining you development setup (how did you create or emulate the resources)

The code of the challenge written in a Git repository and zipped. Try to not write the entire program in one commit and version it as much as you can. For us, understanding your progress is valuable. You can also share a link to the Zip on a file sharing service in case your email provider doesn't allow for the attachment to be sent. In that case, please make sure that the file can be correctly downloaded using a incognito/private window.

### Extras / Optional
Application is deployed when provision is happening

The solution can be up and running by executing a single command/script

Design and implement a process for deploying new application versions with no downtime
