# Jenkins Pipeline Job

## What is a Jenkins Pipeline Job

A Jenkins pipeline job is a way to define and automate a series of steps in the software delivery process. It allows you to script and organize your entire build, test, and deployment. Jenkins pipelines enable organizations to define, visualize, and execute intricate build, test, and deployment processes as code. This facilitates the seamless integration of continuous integration and continuous delivery (CI/CD) practices into software development.

Let's recall our docker foundations project when we created a dockerfile and made a docker image and container with it. Now let's automate the same process with jenkins pipeline code.

### Creating a Pipeline Job

Let's create our first pipeline job

i. From the dashboard menu on the left side, click on new item

![NewItem](./img/01.%20CreateNewItem.png)

ii. Create a pipeline job and name it "My pipeline job"

![MyPipeLineJob](./img/02.%20MyPipelineJob.png)

#### Configuring Build Trigger

Like we did prevoiusly in the earler project, create a build trigger for jenkins to trigger new build

i. Click "Configure" your job and add this configurations

![Configure](./img/03.%20Configure.png)

ii. Click on build trigger to configure triggering the job from GitHub webhook

![GitHubHook](./img/04.%20GithubHook.png)

iii. Since we have created a github webhook previously, we do not need to create another one again. let create another one.
 
Use this link: https://www.youtube.com/watch?v=ZiHMsEKklKQ

Now let's work on our pipeline script

### Writing Jenkins Pipeline Script

A jenkins pipeline script refers to a script that defines and orchestrates the steps and stages of a continuous integration and continuous delivery (CI/CD) pipeline. 

Jenkins pipelines can be defined using either declarative or scripted syntax. Declarative syntax is a more structured and concise way to define pipelines. It uses a domain-specific language to describe the pipeline stages, steps, and other configurations while scripted syntax provides more flexibility and is suitable for complex scripting requirements.

Let's write our pipeline script

![JenkinsPipelin](./img/05.%20JenkinsPipeline.png)

![Pipeline](./img/06.%20Pipeline.png)

**Explanation of the script above**

The provided Jenkins pipeline script defines a series of stages for a continuous integration and continuous delivery (CI/CD) process. Let's break down each stage:

1. **Agent Configuration:**

    `agent any`

    Specifies that the pipeline can run on any available agent (an agent can either be a jenkins master or node). This means the pipeline is not tied to a specific node type.

2. **Stages:**

    `stages {"\n      // Stages go here\n   "}`

    Defines the various stages of the pipeline, each representing a phase in the software delivery process.

3. **Stage 1: Connect To Github:**

    `stage('Connect To Github') {"\n      steps {\n         checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Akinwale09/jenkins-scm.git']])\n      "}
}`

   - This stage checks out the source code from a GitHub repository (https://github.com/Akinwale09/jenkins-scm.git).
   - It specifies that the pipeline should use the 'main' branch.

4. **Stage 2: Build Docker Image:**

    `stage('Build Docker Image') {"\n      steps {\n         script {\n            sh 'docker build -t dockerfile .'\n         "}
   }
}`

    - This stage builds a Docker image named 'dockerfile' using the source code obtained from the GitHub repository.
    - The `docker build` command is executed using the shell (`sh`).

5. **Stage 3: Run Docker Container:**

    `stage('Run Docker Container') {"\n      steps {\n         script {\n            sh 'docker run -itd --name nginx -p 8081:80 dockerfile'\n         "}
   }
}`

    - This stage runs a Docker container named 'nginx' in detached mode (`-itd`).
    - The container is mapped to port 8081 on the host machine (`-p 8081:80`).
    - The Docker image used is the one built in the previous stage (`'dockerfile'`).
  
Copy the pipeline script and paste it in the section below: 

![PipelineScript](./img/07.%20PipelineScript.png)
![Script](./img/08.%20Script.png)
![Script](./img/09.%20Script.png)

The stage 1 of the script connects jenkins to github repository. To generate syntax for our github repository, follow the steps below

i. Click on the pipeline syntax

![PipelineSyntax](./img/10.%20PipelineSyntax.png)

ii. Select the drop down to search for checkout: Check out from version control

![CheckoutforVersionControl](./img/11.%20Checkoutversioncontrol.png)

iii. Paste you repository url and make sure your branch is main

![ConfigureGit](./img/12.%20ConfigureGit.png)

iv Generate your pipeline script

![GenerateScript](./img/13.%20GenerateScript.png)

Now you can replace the generated script for connect jenkins with github.

### Installing Docker

Before jenkins can run docker commands, we need to install docker on the same instance jenkins was installed. From our shell scripting knownledge, let's install docker with shell script.

i. Create a file named docker.sh

`touch docker.sh`

![Dockerfile](./img/14.%20Dockerfile.png)

ii. Open the file and paste the script below

![DockerScript](./img/15.%20DockerScript.png)

![Dockerscript](./img/16.%20DockerScript.png)

iii. Save and close the file

![SaveFile](./img/17.%20Savefile.png)

iv Make the file executable

`chmod u+c docker.sh`

![MakeDockerfileExecuatble](./img/18.%20DockerExc.png)

v. Execute the file

`./docker.sh`

![DockerExecute](./img/19.%20Rundockerfile.png)
![DockerRunning](./img/20.%20DockerRunning.png)

We have successfully installed docker.

### Building Pipeline Script

Now that we have docker installed on the same instance with jenkins, we need to create a dockerfile before we can run our pipeline script. As we know, we cannot build a docker image without a dockerfile. Let's recall the dockerfile we used to build a docker image in our docker foundations. In the main branch on `jenkins-scm`,

i. Create a new file named dockerfile

![Createdockerfile](./img/21.%20Createdockerfile.png)
![Dockerfile](./img/22.%20Dockerfile.png)

ii. Paste the code snippet below in the file

![Dockercode](./img/23.%20Dockercode.png)

![CodeSnippest](./img/24.%20codesnipest.png)

iii. Create an `index.html` file and paste the content below

`Congratulations, You have successfully run your first pipeline code.`

![HTMLFile](./img/25.%20HTMLfile.png)

Pushing these files `dockerfile` and `index.html` will trigger jenkins to automatically run new build for our pipeline.

The was issue running the build as below

![IssueRunningBuld](./img/27.ErrorEncounterDuringBuild.png)

Was able to resolve this issue running the command below to give permission to Jenkins in docker

![Resolved](./img/26.ResolveBuldIssue.png)

![BuildSuccessfullyrun](./img/28.%20BuildSeccess.png)


To access the content of index.html on our web browser, you need to first edit inbound rules and open the port we mapped our container to (8081)

![SGallow8081](./img/29.%20SG.png)

We can now access the content of index.html on our web browser

`http://jenkins-ip-address:8081`

`http://54.89.53.188:8081`

![WebpageAccess](./img/30.%20Webpage.png)


END.