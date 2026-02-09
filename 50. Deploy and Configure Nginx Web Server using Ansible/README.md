# Deploy and Configure Nginx Web Server using Ansible

### Introduction

Nginx is a powerful and widely used web server known for its performance and flexibility. Deploying and configuring Nginx manually on multiple servers can be time-consuming, but with Ansible, this process becomes automated and efficient. This project will teach us how to use Ansible to deploy and configure an Nginx web server on a Linux machine.

#### Objectives

1. Understand how Ansible simplifies the deployment and configuration of applications.
2. Set up an Ansible environment for managing Linux servers.
3. Create and execute an Ansible playbook to install Nginx.
4. Configure a basic Nginx website using Ansible.
Verify the Nginx deployment.


#### Prerequisites

1. **Linux Servers:** At least one server to act as the target machine and an optional control machine for Ansible.
2. **Ansible Installed:** Ansible installed on the control machine. (Refer to the Ansible installation guide if needed.)
3. **SSH Access:** SSH access between the control machine and target servers with public key authentication.
4. **Tools:** A text editor to create and edit Ansible playbooks.

#### Tasks Outline

1. Install and configure Ansible on the control machine.
2. Set up an inventory file for the target Linux server.
3. Create an Ansible playbook to install Nginx.
Configure a custom Nginx website using Ansible.
4. Verify the Nginx deployment and access the website.


### Project Tasks

#### Task 1 - Install and Configure Ansible

1. Install Ansible on the control machine (Ubuntu example):

On this project, I will be using Ubuntu created on AWS and login to the ubuntu Linux server.

![AnsibleonAWS](./img/01.%20AWS_Ansible.png)

Login to the ubuntu server and update. 

1. Update the package repository

    `sudo apt update`

    ![aptupdate](./img/02.%20UbuntuServer.png)

2. Install Ansible:

    `sudo apt install ansible -y`

    ![InstallAnsible](./img/03.%20InstallAnsible.png)

3. Verify the installation:

    `ansible --version`

    The output should display the installed Ansible version like this:

    ![VerifyAnsible](./img/04.%20AnsibleVerify.png)

4. Set up SSH key-based authentication between the control machine and target server:

 Follow the steps below to generate keygen on the controller machine, copy the key to the Node server and access the Node server from the controller machine as below:

   Login to access the controller server on AWS

   `cd ~/.ssh` 

   ` ls`

   `ssh-keygen`   # this will generate the public id and private id

   `cat id_ed25519.pub`    #This would show the public id

   `Copy the public ID to the server you wanted to manage`

5. Test SSH access without a password:
   
   `ssh ubuntu@54.221.50.28`

   ![keygen](./img/06.%20sshkeygen.png)

   ![addkeytoNode](./img/07.%20AddKeytoNode.png)

   ![AccessNode1Server](./img/08.%20AccesstoFirstNode.png)


We have now successfully configured a passwordless SSH access.  

#### Task 2 - Set Up the Ansible Inventory File

1. Create a directory for Ansible configuration:

    `mkdir ~/ansible`
    `cd ~/ansible`

    ![AnsibleFile](./img/09.%20AnsibleFile.png)

2. Create an inventory file:

    `vim inventory.ini`

    ![inventoryfile](./img/10.%20inventoryfile.png)

3. Add target machine details to the inventory:

     [web_servers]
     target ansible_host=54.221.50.28 ansible_user=ubuntu 

     ![AnsibleTarget](./img/11.%20AnsibleTarget.png)

4. Save and close the file.


#### Task 3 - Create an Ansible Playbook to Install Nginx

1. Create a playbook file for installing Nginx:

    `vim install_nginx.yml`

    ![Createnginxfile](./img/12.%20CreateNginxfile.png)

2. Add the following playbook content:

    ![nginxfile](./img/13.%20nginxfile.png)

    ![nginxfile](./img/14.%20nginxfileadded.png)

3. Save the file.

#### Task 4 - Configure a Custom Nginx Website Using Ansible

1. Create a playbook for Nginx website configuration:

    `vim configure_nginx.yml`

    ![ConfigureNginc](./img/15.%20ConfigureNginx.png)

2. Add the following playbook content:

    ![ConfigFile](./img/16.%20Confile.png)

    ![ConfigFileAddded](./img/17.%20ConfigurationFileAdded.png)
    ![ConfigFileAdded](./img/18.%20ConfigFile.png)


#### Task 5 - Verify the Nginx Deployment

1. Run the playbooks to install and configure Nginx:

   `ansible-playbook -i inventory.ini install_nginx.yml`

   ![NginxInstalled](./img/18.%20NginxInstalled.png)

   `ansible-playbook -i inventory.ini configure_nginx.yml`

   ![NginxDeployed](./img/19.%20NgincDeployed.png)


2. Verify Nginx is running on the target server:

    Edit securiy group in AWS to allow inbound rulles to application access. 

    ![SGAccess](./img/22.%20SGAccess.png)

    `curl http://<target-server-ip>`

    `curl http://54.221.50.28`

    ![WebAccess](./img/20.%20WebAcess.png)

3. Open the target server's IP address in a web browser to access the custom website.
   
    ![WebAccess](./img/21.%20webaccess.png)


#### Conclusion

In this project, we used Ansible to automate the deployment and configuration of the Nginx web server on a Linux machine. we created reusable playbooks for installing Nginx and deploying a custom website. With these skills, we can manage multiple web servers efficiently, customize configurations further, and scale your deployment processes.


END.