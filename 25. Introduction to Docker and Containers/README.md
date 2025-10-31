# Introduction to Docker and Containers

### What are Containers?

In realm of software development and deployment, professionals used to face a dilemma. They crafted brilliant code on their local machines, only to find that when deployed to other environments, it sometimes does not work. The culprit? The notorious "it works on my machine" phenomenon.

![Docker](./img/01.%20Docker.png)

Get started with Docker, a tool that emerged to a major problem IT industry. A man named Solomon Hykes, who, in 2013, unveiled Docker, a containerisation platform that promised to revolutionize the way IT professionals built, shipped, and ran applications.

Imagine containers as magical vessels that encapsulate everything an application needs to run smoothly – its code, libraries, dependencies, and even a dash of configuration magic. These containers ensure that an application remains consistent and behaves the same, whether it's running on a developer's laptop, a testing server, or a live production environment. Docker had bestowed upon IT professionals the power to say goodbye to the days of "it works on my machine."

![DockerGif](./img/02.%20giff.gif)

As a learner, find yourself at the crossroads of this digital fairytale. Why, you may wonder, should you embark on this journey into the world of Docker? Fear not, for the answer lies in the immense benefits that Docker bestows upon its disciples. Moreover, Docker simplifies the deployment process, making it as easy as waving a wand. Gone are the days of wrestling with complex installation procedures and compatibility issues. Docker containers provide a standardized, portable environment, ensuring that your applications run seamlessly across various platforms.

So, as you embark on this adventure into Docker, envision yourself as a modern-day sorcerer, wielding the power to conjure applications that dance gracefully from development to deployment.

### Advantages of Containers

**Portability Across Different Environments:** In the past, deploying applications was akin to navigating a treacherous maze, with compatibility issues lurking at every turn. Docker's containers, however, encapsulate the entire application along with its dependencies and configurations. This magical package ensures that your creation dances gracefully across different platforms, sparing you from the woes of the "it works on my machine" curse. With Docker, bid farewell to the headaches of environment mismatches and embrace a world where your application reigns supreme, irrespective of its hosting kingdom.

**Resource Efficiency Compared to Virtual Machines:** Docker containers share the underlying host's operating system kernel, making them lightweight and nimble. This efficiency allows you to run multiple containers on a single host without the extravagant resource demands of traditional virtual machines. Picture Docker containers as magical carriages, swiftly transporting your applications without burdening the kingdom with unnecessary excess. With Docker, revel in the harmony of resource optimization and application efficiency.

**Rapid Application Deployment and Scaling:** Docker containers can be effortlessly spun up or torn down, facilitating the swift deployment of applications. Whether you're facing a sudden surge in demand or orchestrating a grand-scale production, Docker allows you to scale your applications seamlessly. Imagine commanding an army of containers to conquer the peaks of user demand, only to gracefully retreat when the storm has passed. With Docker, the ability to scale becomes a wand in your hand, transforming the challenges of deployment into a choreographed ballet of efficiency.

### Comparison of Docker Container with Virtual Machines

Docker and virtual machines (VMs) are both technologies used for application deployment, but they differ in their approach to virtualization. Virtual machines emulate entire operating systems, resulting in higher resource overhead and slower performance. In contrast, Docker utilizes containerization, encapsulating applications and their dependencies while sharing the host OS's kernel. This lightweight approach reduces resource consumption, provides faster startup times, and ensures portability across different environments. Docker's emphasis on microservices and standardized packaging fosters scalability and efficiency, making it a preferred choice for modern, agile application development, whereas virtual machines excel in scenarios requiring stronger isolation but at the cost of increased resource usage. The choice between Docker and VMs depends on specific use cases and the desired balance between performance and isolation.

### Importance of Docker

Technology and Industry Impact: The significance of Docker in the technology landscape cannot be overstated. Docker and containerization have revolutionized software development, deployment, and management. The ability to package applications and their dependencies into lightweight, portable containers addresses key challenges in software development, such as consistency across different environments and efficient resource utilization.

**Real-World Impact:** Implementing Docker brings tangible benefits to organizations. It streamlines the development process, promotes collaboration between development and operations teams, and accelerates the delivery of applications. Docker's containerization technology enhances scalability, facilitates rapid deployment, and ensures the consistency of applications across diverse environments. This not only saves time and resources but also contributes to a more resilient and agile software development lifecycle.

#### Target Audience

This course on Docker is designed for a diverse audience, including:

**DevOps Professionals:** Interested in container orchestration, seeking efficient ways to manage and deploy applications, improve resource utilization, and ensure system stability.

**Developers:** Who want to streamline their application development, enhance collaboration, and ensure consistency across different stages of the development lifecycle.

It caters to cloud engineers, QA engineers, and other tech enthusiast who are eager to enhance their technical skills and establish a strong foundation in docker and containersation. Professionals seeking to expand their skill set or students preparing for roles in technology-related fields will find this project beneficial.

#### Prerequisites

Before diving into this Docker course, learners

- Should be comfortable navigating linux and executing its commands.

- Should have basic cloud computing knowledge.

- Understanding of virtual machines and their role in software deployment.

Introduction to Docker and Containers
What are Containers?
In realm of software development and deployment, professionals used to face a dilemma. They crafted brilliant code on their local machines, only to find that when deployed to other environments, it sometimes does not work. The culprit? The notorious "it works on my machine" phenomenon.

Docker

Get started with Docker, a tool that emerged to a major problem IT industry. A man named Solomon Hykes, who, in 2013, unveiled Docker, a containerisation platform that promised to revolutionize the way IT professionals built, shipped, and ran applications.

Imagine containers as magical vessels that encapsulate everything an application needs to run smoothly – its code, libraries, dependencies, and even a dash of configuration magic. These containers ensure that an application remains consistent and behaves the same, whether it's running on a developer's laptop, a testing server, or a live production environment. Docker had bestowed upon IT professionals the power to say goodbye to the days of "it works on my machine."

Docker GIF

As a learner, find yourself at the crossroads of this digital fairytale. Why, you may wonder, should you embark on this journey into the world of Docker? Fear not, for the answer lies in the immense benefits that Docker bestows upon its disciples. Moreover, Docker simplifies the deployment process, making it as easy as waving a wand. Gone are the days of wrestling with complex installation procedures and compatibility issues. Docker containers provide a standardized, portable environment, ensuring that your applications run seamlessly across various platforms.

So, as you embark on this adventure into Docker, envision yourself as a modern-day sorcerer, wielding the power to conjure applications that dance gracefully from development to deployment.

Advantages of Containers
Portability Across Different Environments: In the past, deploying applications was akin to navigating a treacherous maze, with compatibility issues lurking at every turn. Docker's containers, however, encapsulate the entire application along with its dependencies and configurations. This magical package ensures that your creation dances gracefully across different platforms, sparing you from the woes of the "it works on my machine" curse. With Docker, bid farewell to the headaches of environment mismatches and embrace a world where your application reigns supreme, irrespective of its hosting kingdom.

Resource Efficiency Compared to Virtual Machines: Docker containers share the underlying host's operating system kernel, making them lightweight and nimble. This efficiency allows you to run multiple containers on a single host without the extravagant resource demands of traditional virtual machines. Picture Docker containers as magical carriages, swiftly transporting your applications without burdening the kingdom with unnecessary excess. With Docker, revel in the harmony of resource optimization and application efficiency.

Rapid Application Deployment and Scaling: Docker containers can be effortlessly spun up or torn down, facilitating the swift deployment of applications. Whether you're facing a sudden surge in demand or orchestrating a grand-scale production, Docker allows you to scale your applications seamlessly. Imagine commanding an army of containers to conquer the peaks of user demand, only to gracefully retreat when the storm has passed. With Docker, the ability to scale becomes a wand in your hand, transforming the challenges of deployment into a choreographed ballet of efficiency.

Comparison of Docker Container with Virtual Machines
Docker and virtual machines (VMs) are both technologies used for application deployment, but they differ in their approach to virtualization. Virtual machines emulate entire operating systems, resulting in higher resource overhead and slower performance. In contrast, Docker utilizes containerization, encapsulating applications and their dependencies while sharing the host OS's kernel. This lightweight approach reduces resource consumption, provides faster startup times, and ensures portability across different environments. Docker's emphasis on microservices and standardized packaging fosters scalability and efficiency, making it a preferred choice for modern, agile application development, whereas virtual machines excel in scenarios requiring stronger isolation but at the cost of increased resource usage. The choice between Docker and VMs depends on specific use cases and the desired balance between performance and isolation.

Importance of Docker
Technology and Industry Impact: The significance of Docker in the technology landscape cannot be overstated. Docker and containerization have revolutionized software development, deployment, and management. The ability to package applications and their dependencies into lightweight, portable containers addresses key challenges in software development, such as consistency across different environments and efficient resource utilization.

Real-World Impact: Implementing Docker brings tangible benefits to organizations. It streamlines the development process, promotes collaboration between development and operations teams, and accelerates the delivery of applications. Docker's containerization technology enhances scalability, facilitates rapid deployment, and ensures the consistency of applications across diverse environments. This not only saves time and resources but also contributes to a more resilient and agile software development lifecycle.

Target Audience
This course on Docker is designed for a diverse audience, including:

DevOps Professionals: Interested in container orchestration, seeking efficient ways to manage and deploy applications, improve resource utilization, and ensure system stability.

Developers: Who want to streamline their application development, enhance collaboration, and ensure consistency across different stages of the development lifecycle.

It caters to cloud engineers, QA engineers, and other tech enthusiast who are eager to enhance their technical skills and establish a strong foundation in docker and containersation. Professionals seeking to expand their skill set or students preparing for roles in technology-related fields will find this project beneficial.

Prerequisites
Before diving into this Docker course, learners

Should have successfully completed our TechOps Career Essentials and Advanced TechOps course.

Should be comfortable navigating linux and executing its commands.

Should have basic cloud computing knowledge.

Understanding of virtual machines and their role in software deployment.

### Project Goals

By the end of this course, learners should aim to achieve the following:

1. Grasp the concept of containers, their isolation, and their role in packaging applications.

2. Familiarize themselves with key Docker features, commands, and best practices.

3. Comprehend how Docker containers contribute to resource efficiency compared to traditional virtual machines.

4. Learn how Docker ensures consistent application behavior across different development, testing, and production environments.

5. Master the techniques for quickly deploying and scaling applications using Docker.


### Getting Started With Docker

### Installing Docker

We need to launch an ubuntu 20.04 LTS instance and connect to it, then follow the steps below

Launch ubuntu 20.04 LTS on AWS and login to the instance:

![SSHConnectiontotheServer](./img/02.%20SSH%20Connection.png)

Before installing Docker Engine for the first time on a new host machine, it is necessary to configure the Docker repository. Following this setup, we can proceed to install and update Docker directly from the repository.

Now let's first add docker's oficial GPG key: https://help.ubuntu.com/community/GnuPrivacyGuardHowto

`sudo apt-get update`

![SudoUpdate](./img/03.%20SudoUpdate.png)
![UpdateCompleted](./img/04.%20UpdateCompleted.png)

This is a Linux command that refreshes the package list on a Debian-based system, ensuring the latest software information is available for installation.

`sudo apt-get install ca-certificates curl gnupg`

![GetInstall](./img/05.%20update.png)

This a Linux command that installs essential packages including certificate authorities, a data transfer tool (curl), and the GNU Privacy Guard for secure communication and package verification.

`sudo install -m 0755 -d /etc/apt/keyrings`

![CreateDirectory](./img/06.%20keygen.png)

The command above creates a directory (/etc/apt/keyrings) with specific permissions (0755) for storing keyring files, which are used for docker's authentication.

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`

![downloadDocker](./img/07.%20DownloadkeyGen.png)

This downloads the Docker GPG key using `curl`

`sudo chmod a+r /etc/apt/keyrings/docker.gpg`

![GivePermission](./img/08.%20GivePermission.png)

Sets read permissions for all users on the Docker GPG key file within the APT keyring directory

#### Let's add the repository to Apt sources

`echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`

![AptSource](./img/09.%20gpg.png)

The "echo" command creates a Docker APT repository configuration entry for the Ubuntu system, incorporating the system architecture and Docker GPG key, and then "sudo tee /etc/apt/sources.list.d/docker.list > /dev/null" writes this configuration to the "/etc/apt/sources.list.d/docker.list" file.

`sudo apt-get update`

![GetUpdate](./img/10.%20getupdate.png)

1. Install latest version of docker
   
     `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`

    ![InstallDocker](./img/11.%20InstallDocker.png)

2. Verify that docker has been successfully installed

    ![DockerStatus](./img/12.%20DockerStatus.png)

   By default, after installing docker, it can only be run by root user or using `sudo` command. To run the docker command without sudo execute the command below.

    `sudo usermod -aG docker ubuntu`

    ![DockerUserMode](./img/13.%20Docker.png)

    After executing the command above, we can run docker command without using superuser privilledges

### Running the "Hello World" Container

#### Using the `docker run` Command

The `docker run` command is the entry point to execute containers in Docker. It allows us to create and start a container based on a specified Docker image. The most straightforward example is the "Hello World" container, a minimalistic container that prints a greeting message when executed.

#### Run the "Hello World" container

`docker run hello-world`

![Docker_Run](./img/14.%20DockerRun.png)

When we execute this command, Docker performs the following steps:

- **Pulls Image (if not available locally):** Docker checks if the `hello-world` image is available locally. If not, it automatically pulls it from the Docker Hub, a centralized repository for Docker images.

- **Creates a Container:** Docker creates a container based on the `hello-world` image. This container is an instance of the image, with its own isolated filesystem and runtime environment.

- **Starts the Container:** The container is started, and it executes the predefined command in the `hello-world` image, which prints a friendly message.

### Understanding the Docker Image and Container Lifecycle

**Docker Image:** A Docker image is a lightweight, standalone, and executable package that includes everything needed to run a piece of software, including the code, runtime, libraries, and system tools. Images are immutable, meaning they cannot be modified once created. Changes result in the creation of a new image.

**Container Lifecycle:** Containers are running instances of Docker images.

  - **They have a lifecycle:** `create`, `start`, `stop`, and `delete`.
  
  - Once a container is created from an image, it can be `started`, `stopped`, and `restarted`.

### Verifying the Successful Execution

Let's check if the images is now in our local environment with Example Output:

`docker images`

![DockerImage](./img/15.%20DockerImage.png)

If any issue is encounter, ensure that Docker is properly installed and that your user has the necessary permissions to run Docker commands.

This simple "Hello World" example serves as a basic introduction to running containers with Docker. It helps verify that our Docker environment is set up correctly and provides insight into the image and container lifecycle. As we progress in this course, we'll explore more complex scenarios and leverage Docker for building, deploying, and managing diverse applications.

## Basic Docker Commands

#### Docker Run

The `docker run` command is fundamental for executing containers. It creates and starts a container based on a specified image.

`docker run hello-world`

![DockerHelloWorld](./img/16.%20DockerHelloWord.png)

![DockerImage](./img/14.%20DockerRun.png)

This example pulls the "nginx" image from Docker Hub (if not available locally) and starts a container using that image.

#### Docker PS

The `docker ps` command displays a list of running containers. This is useful for monitoring active containers and obtaining information such as container IDs, names, and status.

`docker ps`

![DocketPS](./img/17.%20DockerPS.png)
![DockerPSResult](./img/18.%20DockerPS.png)

To view all containers, including those that have stopped, add the -a option:

`docker ps -a`

![Dockerps-a](./img/19.%20DockerPs-a.png)

![DockerPs-aresult](./img/20.%20DockerPSresult.png)

#### Docker Stop

The `docker stop` command halts a running container.

`docker stop CONTAINER_ID`

![DockerStop](./img/21.%20DockerStop.png)

#### Docker Pull

The `docker pull` command downloads a Docker image from a registry, such as Docker Hub, to our local machine.

e.g `docker pull ubuntu`

![DockerPull](./img/22.%20DockerPull.png)

#### Docker Push

The `docker push` command uploads a local Docker image to a registry, making it available for others to pull.

`docker push`

![DockerPush](./img/23.%20DockerPush.png)

Ensure you've logged in to Docker Hub using `docker login` before pushing images.

#### Docker Images

The docker images command lists all locally available Docker images.

`docker images`

![DockerImages](./img/24.%20DockerImages.png)
![DockerImagesresult](./img/25.%20DockerImagesresult.png)

#### Docker RMI

The `docker rmi` command removes one or more images from the local machine.

`docker rmi`

![DockerRMI](./img/26.%20DockerRMI.png)

These basic Docker commands provide a foundation for working with containers. Understanding how to `run`, `list`, `stop`, `pull`, `push`, and manage `Docker images` is crucial for effective containerization and orchestration. As we delve deeper into Docker, we'll discover additional commands and features that enhance our ability to `develop`, `deploy`, and `maintain` containerized applications.


END.










