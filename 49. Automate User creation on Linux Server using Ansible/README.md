# Automate User Creation on Linux Server using Ansible

### Introduction

Managing user accounts is a common administrative task for Linux servers. Manually creating and managing user accounts can become tedious, especially on multiple servers. Ansible simplifies this process by automating user creation with playbooks. This project will guide us in creating an Ansible playbook to automate user creation on a Linux server.

### Objectives

1. Understand the basics of Ansible and its automation capabilities.
2. Set up an Ansible environment to manage Linux servers.
3. Create an Ansible playbook to automate user creation.
4. Configure additional settings like home directory, groups, and SSH access.
5. Verify the user creation process and test access.

### Prerequisites

1. **Linux Servers:** At least one Linux server to act as the target machine and an optional control machine for Ansible.
2. **Ansible Installed:** Ansible installed on the control machine. (Refer to the Ansible installation guide if you don't have Ansible already installed.) https://docs.ansible.com/projects/ansible/latest/installation_guide/intro_installation.html
3. **SSH Access:** SSH access between the control machine and target servers with public key authentication.
4. **Tools:** A text editor to create and edit Ansible playbooks.


### Tasks Outline

1. Install and configure Ansible on the control machine.
2. Set up an inventory file for the target Linux server.
3. Create an Ansible playbook to automate user creation.
4. Configure additional user settings like groups and SSH access.
5. Verify user creation and test login.


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
   
   `ssh ubuntu@98.93.9.134`

   ![keygen](./img/06.%20sshkeygen.png)
   ![addkeytoNode](./img/07.%20AddKeytoNode.png)
   ![logintoNodeServer](./img/08.%20SuccessconnectiontoNodeServer.png)

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

     [linux_servers]

     target1 ansible_host=98.93.9.134 ansible_user=ubuntu

     ![AnsibleTarget](./img/11.%20AnsibleTarget.png)

4. Save and close the file.

#### Task 3 - Create an Ansible Playbook to Automate User Creation

1. Create a playbook file for user creation:

    `vim create_users.yml`

    ![UserCreation](./img/12.%20UserCreation.png)

2. Add the following playbook content:

    ![Playbook](./img/15.%20UserPlaybook.png)
    ![Userplaybook](./img/13.%20AnsibleConfig.png)
    ![Playbookaddee](./img/14.%20UserCreationAnsibleFile.png)


#### Task 4: Configure Additional User Settings

1. Update the playbook to include group and SSH key configuration:

2. Replace /path/to/user1.pub and /path/to/user2.pub with the paths to the public SSH keys for each user.

    ![Playbook](./img/18.%20AnsiblePath.png)

    ![AnsiblePalybook](./img/16.%20UserCreation.png)

    ![AnsiblePlaybook](./img/17.%20Ansiblefile.png)


#### Task 5 - Verify User Creation and Test Login

1. Run the playbook to create users:

    `ansible-playbook -i inventory.ini create_users.yml`

    ![Usercreated](./img/19.%20UserCreated.png)

2. Verify the users were created on the target server:

    `cat /etc/passwd`

    ![etc](./img/20.%20catect.png)

    `ls /home`

    ![lshome](./img/21.%20lshome.png)

3. Test SSH access for the newly created users:

    `ssh user1@<target-server-ip>`

    `ssh user1@98.93.9.134`

    ![sshuserone](./img/08.%20SuccessconnectiontoNodeServer.png)

    `ssh user2@<target-server-ip>`

    `ssh user2@54.146.240.78`

    ![sshusertwo](./img/22.%20usertwo.png)


#### Conclusion

In this project, we automated the creation of user accounts on a Linux server using Ansible. We learned how to write an Ansible playbook for user creation, configure additional settings like groups and SSH access, and verify the process. With these skills, you can manage user accounts efficiently across multiple servers and extend the playbook for advanced configurations like password policies and user deletion.


END.