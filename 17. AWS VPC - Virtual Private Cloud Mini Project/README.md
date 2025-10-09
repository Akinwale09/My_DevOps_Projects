# Network Mastery with AWS VPC Mini Project

In this session, I'll explore the core concepts of Amazon Web Services (AWS), focusing specifically on Virtual Private Clouds (VPCs). Our objective is to understand the fundamental components of VPC infrastructure, including subnets, gateways, and routing tables. Through practical demonstrations and interactive exercises, we'll navigate the AWS management console to deploy and manage these critical components effectively.

Before we proceed with setting up VPCs, it's essential to ensure a solid understanding of cloud networking basics.

### Project Goals:

- Understand the fundamentals of Virtual Private Cloud (VPC) and its components.
- Gain hands-on experience in setting up and configuring VPC, subnets, internet gateway, NAT gateway, and VPC peering connections.
- Learn how to enable internet connectivity securely within a VPC.
- Implement outbound internet access through the NAT gateway.
- Establish direct communication between VPCs using VPC peering.

### Learning Outcomes:

- Acquired knowledge about VPC and its essential components, such as subnets, gateways, and route tables.
- Developed skills in creating and configuring VPC resources using AWS management console.
- Learned how to set up routing tables to enable internet connectivity and outbound internet access securely.
- Gained understanding of VPC peering and its significance in connecting multiple VPCs within the same or different regions.
- Enhanced understanding of network security principles and best practices for cloud environments.

## What is VPC, Subnets, Internet Gateway and NAT Gateway?

Imagine building a virtual space for the a company called **GatoGrowFast.com's** so that the computers can communicate securely. That's what VPC, or Virtual Private Cloud, is all about. It's like creating a private room in the cloud just for GatoGrowFast.com's use.

**Here's an example**: Think of GatoGrowFast.com's office building. Inside, there are different departments like HR, Finance, and IT. Each department has its own area with specific access rules. Similarly, in a VPC, GatoGrowFast.com can create different sections, called subnets, for different parts of the business.

Now, let's say GatoGrowFast.com wants to connect its office to the internet. They'd use a **router** to control the flow of data in and out of the building. In a VPC, GatoGrowFast.com has something similar called an **Internet Gateway**. It lets their VPC communicate with the internet securely.

**NAT (Network Address Translation) Gateway** as a secret agent between GatoGrowFast.com's computers and the internet. When a computer inside their virtual office wants to talk to the internet, the NAT Gateway steps in. It translates the computer's message and sends it out, but it hides who sent it. It's like sending a letter without your return address. This way, the internet only sees the NAT Gateway's address, keeping GatoGrowFast.com's computers safe and anonymous online.

**Note**- A router is a device that directs data packets between computer networks. Think of it as a traffic cop for the internet. When data is sent from one device to another across a network, it's broken down into smaller packets. These packets need to find their way to the correct destination, and that's where the **router** comes in.

Imagine we're sending a letter to a friend across the country. You drop it in a mailbox, and it's picked up by a postal worker. The postal worker knows which roads to take and which sorting centers to pass through to ensure your letter reaches its destination. Similarly, a router knows how to send data packets from your device to the right destination on the internet. **Routers** use **routing tables**, which are like maps of the internet, to determine the best path for data packets to take. They analyze information in the packets, such as destination IP addresses, to make these decisions. Once the packets reach their destination, the router ensures they're delivered to the correct device.

### What is an IP address?

An IP address is like a phone number for your computer. It's a unique set of numbers that helps computers find and talk to each other on a network, like the internet.

There are two main types of IP addresses: public IP addresses and private IP addresses. However, each type has different versions, with IPv4 and IPv6 being the most common.

**Public IP Address**: This is like our home address. It's unique and helps other computers on the internet find yours. Just like how people send letters to our house using our address, data packets are sent to our computer using its public IP address.

1. A public IP address is globally unique and is assigned by the Internet Service Provider (ISP) to a device connected to the internet.
2. It allows devices to communicate with other devices across the internet.
3. Public IP addresses can be either dynamic or static. Dynamic IPs change periodically, often each time a device reconnects to the internet, while static IPs remain constant. Static IPs are typically used for servers, remote access, or services that require consistent connectivity.

**Private IP Address**: Think of this like an internal extension number in a big office building. It's used for communication within a specific network, like your home Wi-Fi network or an office network. Devices within the same network can talk to each other using their private IP addresses, but these addresses aren't visible to the outside world.

1. Private IP addresses are typically assigned by a router or a DHCP (Dynamic Host Configuration Protocol) server within the network.
2. Devices within the same private network communicate with each other using their private IP addresses.
3. These addresses are not routable over the internet. They are used for internal network communication only and are hidden from the outside world.
4. It is not globally unique and can be reused within different private networks without conflict.


### IPv4 Address:

- IPv4 (Internet Protocol version 4) addresses are the most common type of IP addresses used today.
- They are 32-bit numeric addresses written in decimal format, separated by periods (e.g., 192.168.0.1).
- IPv4 addresses are divided into five classes: A, B, C, D, and E, with classes A, B, and C being used for addressing hosts on networks.
- Each octet in an IPv4 address can have a value between 0 and 255. This is because each octet is made up of eight bits, and the maximum value that can be represented with eight bits is 255 (which is 11111111 in binary).

### IPv6 Address:

- IPv6 (Internet Protocol version 6) addresses are designed to replace IPv4 due to the exhaustion of available IPv4 addresses.
- IPv6 addresses are 128-bit hexadecimal addresses, represented in eight groups of four hexadecimal digits separated by colons (e.g., 2001:0db8:85a3:0000:0000:8a2e:0370:7334).
- IPv6 addresses provide a much larger address space compared to IPv4, allowing for a virtually unlimited number of unique addresses.

### What is CIDR?

CIDR, or Classless Inter-Domain Routing, makes it easier to talk about groups of IP addresses on the internet. Instead of naming each address one by one, CIDR uses a simple shortcut. It's like saying "All the houses on Main Street" instead of listing each house separately.

For example, let's say you have the IP address 192.168.1.0. With CIDR notation, you might write it like this: 192.168.1.0/24. The "/24" part tells us that we're talking about all the houses on that street from `192.168.1.0 to 192.168.1.255`.

So, CIDR helps us manage and organize IP addresses on the internet in a way that's easy to understand and work with. It's like having a shorthand for talking about big groups of addresses.

Determining the number of available IP addresses in a CIDR block To determine the number of available IP addresses in a CIDR block, you calculate it using the formula:

![CIDR Formular](./img/00.%20CIDR%20Formular.png)

The "-2" is for excluding the network address and the broadcast address.

**Example**

Let's say we have a CIDR block of "192.168.1.0/24".

Using the formula, we calculate:

![CIDRsolution](./img/0.1%20CIDR%20calculation.png)

### What is a gateway?

Gateways are like doorways between different networks. They help data travel between your local network and other networks, like the internet. Just like a gate lets you go from your backyard to the neighborhood park, a gateway lets your data go from your computer to the internet and back again. It's like the traffic cop of the internet, directing your data where it needs to go.

For example - Imagine you live in a city with different neighborhoods, each with its own set of houses. You're in one neighborhood, let's call it Neighborhood A, and you want to visit a friend who lives in a different neighborhood, Neighborhood B. To get from your neighborhood to your friend's neighborhood, you need to go through a gateway—a special gate that connects the two neighborhoods. This gateway acts as a bridge between the two areas, allowing people and things to pass back and forth.

So, when you leave your house in Neighborhood A, you walk to the gateway, pass through it, and then find your friend's house in Neighborhood B. The gateway helps you navigate from one neighborhood to another, just like how a network gateway helps data travel between different networks.

### What is a Route table?
A route table is like a map that helps data find its way around a network. Just like a map shows you the best routes to get from one place to another, a route table tells devices on a network how to send data packets to their destinations.

In simpler terms, a route table lists different destinations and the paths (or "routes") to reach them. When a device receives data that it needs to send somewhere, it consults the route table to figure out where to send it.

For example, if your computer wants to send data to a website, it looks at its route table to find out which gateway to use to reach the internet. The route table might say, "To reach the internet, send data to the router." Then, the router knows how to forward the data to the next stop on its journey, eventually reaching its destination.

Think of a route table as the navigation system for data on a network, helping it find the fastest and most efficient paths to where it needs to go.

### Connection between Gateway and Route table

#### Gateways:

- Gateways are devices (like routers or firewalls) that serve as entry and exit points between different networks.
- They connect networks with different IP address ranges, such as your local network and the internet.
- Gateways receive incoming data packets and determine where to send them next based on routing information.


#### Route Tables:

- Route tables are tables maintained by networking devices (like routers or switches) that contain information about how to route data packets to their destinations.
- Each entry in a route table specifies a destination network and the next hop (gateway) to reach that network.
- Devices consult the route table to determine the best path for forwarding data packets based on their destination IP addresses.

#### Connection:

- When a device (like a computer or server) wants to send data to a destination outside of its local network, it checks its route table.
- The route table provides the information needed to determine the next hop (gateway) for reaching the destination network.
- The device then forwards the data packet to the specified gateway, which continues the process until the packet reaches its final destination.

In summary, gateways and route tables work together to facilitate the routing of network traffic between different networks. Gateways serve as the entry and exit points between networks, while route tables provide the necessary routing information to determine how data packets should be forwarded to their destinations.

Now let’s come to the practical part:

**Steps -**

1. Setting Up a Virtual Private Cloud (VPC)

2. Configuring Subnets within the VPC

3. Creating Internet Gateway and attaching it to VPC

4. Enabling Internet Connectivity with the Internet Gateway by setting up Routing tables

5. Enabling Outbound Internet Access through NAT Gateway

6. Establishing VPC Peering Connections

Let’s come to the first one which involves Setting Up a Virtual Private Cloud (VPC)

#### Part-1

1. Let's navigate to the search bar on our AWS management console

   a) Enter "VPC." Upon locating the relevant result, proceed to click on it, directing you to the Virtual Private Cloud (VPC) page.

   ![vpcsearch](./img/0.2%20vpcsearch.png)

2. Please navigate to the "Create VPC" option and click on it.

   ![createVPC](./img/0.3%20createVPC.png)

3. Select the "VPC only" option, specify the IPv4 CIDR block, and proceed by clicking on the "Create VPC" button.

    ![createvpc](./img/04.%20createvpc.png)

**Note**- If you encounter an error message stating that the CIDR block size must be between "/16" and "/28" when creating a VPC, it indicates that your provided CIDR block falls outside of this recommended range. Adjusting the CIDR block to fall within the specified range should resolve the issue.

![ifissue](./img/05.%20ifissue.png)

This is the VPC we have created:

![Myvpc](./img/06.%20myvpc.png)

We are done with the part 1 now, Let’s move to part 2 which is Configuring Subnets within the VPC.

### Part -2

1. Let's navigate to the "Subnets" option located on the left sidebar.
   
  a) Upon clicking, you will be directed to the "Subnets" page.

  b) From there, proceed to click on the "Create subnet" button.

![subnet](./img/07.%20subnet.png)

2. Select the ID of the VPC that you created in the previous step (Part 1)

![createsubnet](./img/08.%20createsubnet.png)
![createsubnet](./img/09.%20subnet.png)

3. Now, let's enter the subnet name,  and specify the IPv4 CIDR for the subnet. 

   a) Choose the availability zone

   b) And specify the IPv4 CIDR for the subnet.

   c) To create another subnet, click on the "Add subnet" button.

   ![Subnet1](./img/10.%20subnet1.png)

   d) Repeat the same steps for the second subnet

   e) ensuring to specify the subnet name, choose the availability zone, and provide the IPv4 CIDR.

   f) Once completed, click on the "Create" button to create the subnet.

To maintain consistency with our intention of creating both a public and a private subnet, ensure that the naming convention reflects this distinction appropriately.

![privatesubnet](./img/11.privatesubnet1.png)

#### Our Architecture After subnet created

![myarchitecture](./img/12.ArchitectDiagram.png)

Here we’ll see our subnets is being created.

![mysubnet](./img/13.%20subnetpage.png)

With the creation of subnets, the second part of the task is now completed. Let's proceed to the next part, which involves creating an Internet Gateway and attaching it to VPC.

### Part-3

1. Navigate to the "Internet Gateway" option on the left sidebar.
 
   a) Upon clicking, you will be directed to the Internet Gateway page.

   b) From there, proceed to click on the "Create Internet Gateway" button.

   ![internetgateway](./img/14.Internetgateway.png)

2. Specify the name of the Internet Gateway

   a) proceed by clicking on the "Create Internet Gateway" button.  

   ![MyIGW](./img/15.miIGW.png)


   Now our Internet gateway is being successfully created.

   ![IGWSuccess](./img/16.IGWcreated.png)

Now, you will notice that it is currently detached, indicating that it is not associated with any VPC. To enable internet connectivity, you must attach the Internet Gateway to the VPC we have previously created. 

![attacheIGW](./img/17.attachIWG.png)
![attcahedIGW](./img/18.IGWattached.png)

Now, attach it to the VPC

![attachIGW](./img/19.IGW.png)
![IGW](./img/20.IWG.png)

#### Our Updated AWS Architect

![updatedarchitect](./img/21.updatedArchitect.png)

Now, let’s come to the next part which is Enabling Internet Connectivity with the Internet Gateway by setting up Routing tables.

### Part -4

1. Proceed to the "Route Tables" option located on the left sidebar.
   
  a) Once there, click on the "Create route table" button.

  ![routetable](./img/22.routetable.png)

2. Enter the name of the route table and select the VPC you previously created.
   
   a) Finally, click on the "Create route table" button to proceed.

   ![routetable](./img/23.routetable.png)

   b) Next, click on "Subnet associations," followed by "Edit subnet associations" to associate the subnet with this route table, We’ll associate the public subnet with this route table.

   ![attcahedrouteable](./img/24.attachedroutetable.png)

3. Choose the public subnet and click on save association.

   ![attachedroutetabletopublicsubnet](./img/25.Privatesubnetattached.png)

4. Navigate to "Routes" and then click on "Edit routes."  

   ![editroute](./img/26.editroute.png)

5. Click on add route.

   ![addroute](./img/27.addroute.png)

6. Select "Destination" as "0.0.0.0/0," indicating that every IPv4 address can access this subnet.

7. In the "Target" field, choose "Internet Gateway," and then select the Internet Gateway you created. Finally, save the changes.

   ![editrouteandsavechanges](./img/28.EditandSave.png)

The route table has now been configured to route traffic to the Internet Gateway, allowing connectivity to the Internet. Since only the subnet named "my-public-subnet-1" is associated with this route table, only resources within that subnet can access the internet.

![routedforinternet](./img/29.routed.png)

#### Our Updated AWS Architect

![updatedarchitect](./img/30.updatedarchitect.png)

Now, let’s come to the next part which is Enabling Outbound Internet Access through NAT Gateway, (by attaching NAT Gateway to the subnet and attaching the route table.)

### Part-5

1. Navigate to the "NAT Gateways" section, then click on "Create NAT Gateway."
   
   ![NAT](./img/31.NAT.png) 

2. Then mention the name of the NAT Gateway.

   ![MyNat](./img/32.myNAT.png)

3. Now, choose the Private subnet.

   ![NowchooseASubnet](./img/33.chooseaprivatesubnet.png)

4. Now select the connectivity type as Private.

   ![ConnectivityTypePrivate](./img/34.%20ConnectivityType.png)

5. Then click on Create NAT Gateway.

   ![CreateNAT](./img/35.%20createNAT.png)


Our NAT Gateway is being created successfully.

![NATCreated](./img/36.%20NATCreated.png)

6. Select your NAT Gateway.

7. Then navigate to the "Details" tab.

8. From there, locate the subnet ID and click on it.

![NATDetails](./img/37.%20NATDetails.png)

9. In the subnet page, navigate to the "Route Table" section.

10. Then click on the "route table ID " - In my own case - 1“rtb-04534fc95daff5a75”

![RouteTbaleID](./img/38.routetableID.png)

11. Proceed to the "Routes" section, then click on "Edit routes."

![EditRoute](./img/39.%20RouteEdit.png)

12. Then click on “Add routes.”

 ![AddRoute](./img/40.%20Addroute.png)

 a) Select "Destination" as "0.0.0.0/0."

 b) In the "Target" field, choose "NAT Gateway,"

 c) Then select the NAT Gateway you created.

 d) Finally, save the changes.


![NATAddedtoRoute](./img/41.NATaddedtoRoute.png)

13. Now, On the subnet association section, click on edit subnet association.

  ![subnetassocioation](./img/42.subnetassociation.png)

  a) Choose the private subnet and click on “Save associations”

  Now, the subnet has been successfully attached with the route table.

![subnetassociate](./img/43.%20subnetasso.png)


#### Our Updated AWS Architect

![Updated](./img/44.UpdatedArchitect.png)


### Difference between Internet Gateway and NAT Gateway

#### Internet Gateway:

Think of it like a door to the internet for your subnet. When you attach an Internet Gateway to a subnet, it allows the resources in that subnet (like EC2 instances) to reach out to the internet and also allows internet traffic to reach those resources. It's like having a door both to enter and exit the subnet.

#### NAT Gateway:

Imagine it as a one-way street sign for your subnet's traffic. When you attach a NAT Gateway to a subnet, it lets the resources in that subnet (like EC2 instances) access the internet, but it doesn't allow incoming traffic from the internet to reach those resources. It's like the resources can go out to the internet, but the internet traffic can't directly come in.

NAT and IGW Diagram

![NATandIGW](./img/45.%20NATandIGW.png)

Now, let's proceed further and come to our next part that involves Establishing VPC Peering Connections. For this let’s first understand some terms-

**Note**- An EC2 instance is a virtual server in AWS that you can use to run applications. It offers flexible computing power and can be easily scaled up or down. EC2 instances are widely used for hosting websites, running software, and processing data in the cloud.

### What is VPC Peering?

VPC peering is like connecting two virtual offices in the cloud so they can talk to each other directly. Just imagine two neighboring offices sharing files and chatting without going through a middleman.

- By default, EC2 instances in different VPCs cannot communicate with each other.
- To enable communication between EC2 instances in different VPCs, you can set up VPC peering, VPN connections, or AWS Direct Connect.
- VPC peering establishes a direct network connection between the VPCs, allowing EC2 instances in one VPC to communicate with EC2 instances in the other VPC.

#### Why do we need VPC Peering?

We need VPC peering when we want different parts of our cloud network (VPCs) to work together smoothly. Maybe you have one VPC for your development team and another for your marketing team, and you want them to share data securely. That's where VPC peering comes in handy—it lets these VPCs communicate directly, making things easier for everyone.

Additionally, there are some key points that you should be aware of.

- Two VPCs cannot connect to each other. You need to set up VPC peering or use a VPN or Direct Connect to establish connectivity between VPCs.
- Subnets within the same VPC can communicate with each other by default. AWS sets up route tables to allow communication within the same VPC.
- EC2 instances in the same subnet can communicate with each other by default, assuming they have proper security group rules allowing the desired traffic.
- EC2 instances in different subnets within the same VPC can also communicate with each other by default, as long as their associated route tables are configured to allow traffic between subnets.
  
Now come to the practical part

### Part -6

1. Let's begin by creating two VPCs in the same region. Alternatively, we may choose a different region if needed.

   ![RequestedVPC](./img/46.RequestedVPC.png)
   ![AccepterVPC](./img/47.AccepterVPC.png)

2. Navigate to the "Peering Connections" option on the left sidebar.
   
    a) Upon clicking, you'll be directed to the VPC peering page.

    b) From there, proceed to click on the "Create Peering Connection" button.

    ![VPCPeering](./img/48.VPCPeering.png)

3. Now, provide a name for the VPC peering connection.

   a) select the requester VPC.

   b) Choose the account "My account" since the VPCs are in our own AWS account.

   c) Ensure to use the same region, "This Region (eu-north-1)," as the VPCs were created in the same region.

   d) Next, select the accepter VPC.

   e) proceed by clicking on the "Create Peering Connection" button.

   ![CreatePeeringConnection](./img/49.Createpeeringconnection.png)

   Then you’ll see this

   ![PeeringCreated](./img/50.Peeringcreated.png)

4. In the Peering Connection page, locate the "Actions" option on the right side.
  
    a) Click on it, then select "Accept Request."

    ![AcceptConnection](./img/51.%20AcceptConnection.png)

    b) Click on Accept request.

    ![Accet](./img/52,%20AcceptConn.png)

5. Now, click on Main route table ID of the accepter VPC.

   ![AccpetedConnection](./img/53.AcceptedConnectionvpc.png)

6. Choose the route table.
   
    a) then navigate to the "Routes" section.

    b) Click on "Edit route."  

    ![routetable](./img/54.routetable.png)

    c) Click on add route.

    ![addroute](./img/55.addroute.png)

7. Go to the VPC page

    a) select the requester VPC.

    b) In the details tab, you'll find the IPv4 CIDR. (in this case - 192.168.0.0/16)

    c) Copy this CIDR and paste it in the "Destination" field when adding a route.

    ![requestedvpc](./img/56.requestedvpc.png)

    d) In the target, choose VPC peering and then choose the peering connection you have created. Click on save changes.

    ![routeedited](./img/57.routeconnection.png)

8. Now, copy the IPv4 CIDR of the accepter VPC. (in this case - 172.16.0.0/16)

   ![copyCIDRprivateconnetion](./img/58.privateIP.png)

9. Now, click on Main route table ID of the requester VPC.

   ![RequesterMainRouteTable](./img/59.%20requestermainroutetable.png)

10. Choose the route table, then navigate to the "Routes" section. Click on "Edit route."

    ![routetable](./img/60.%20routetable.png)

11. Click on add route.

     a) Paste the CIDR in the "Destination" field.

     b) In the target, choose VPC peering

     c) Then choose the peering connection you have created.

     ![Connectionpeering](./img/61.%20connectionpeering.png)
     ![Connection](./img/62.%20created.png)

The connection has been successfully established. Now, resources in the accepter VPC can connect to resources in the requester VPC, and vice versa.

![VPCPeering](./img/63.%20VPCpeering.png)

Let’s see some points that we need to know about VPC Peering, VPC Peering Basics: VPC peering allows direct communication between two VPCs using private IP addresses. Region compatibility: VPC peering can be set up between VPCs in the same AWS region or different regions and the same AWS account or different AWS accounts.

For more reference, you can go through the Create a VPC peering connection.https://docs.aws.amazon.com/vpc/latest/peering/create-vpc-peering-connection.html#same-account-same-region

**CIDR Blocks**: The CIDR blocks of the VPCs involved in the peering connection should not overlap or conflict with each other. Each VPC must have a unique CIDR block.

**IP Addressing**: Resources in one VPC can communicate with resources in the peered VPC using their private IP addresses.

**Security Groups and NACLs**: Ensure proper configuration of Security Groups and Network Access Control Lists (NACLs) to allow traffic between peered VPCs.

**Direct Communication**: Resources in one VPC can directly communicate with resources in the peered VPC without requiring internet access.

**Transitive Traffic**: Traffic cannot flow through a VPC peering connection to reach other VPCs not directly peered.

**Routing**: Update route tables in both VPCs to allow traffic to flow through the peering connection. Each VPC's route table must contain a route entry for the CIDR block of the peer VPC, pointing to the peering connection.

**Limitations**: There are limits on the number of VPC peering connections that can be established per VPC, as well as limitations on the number of route entries per route table.

Now, let’s understand some more terms: 

### What is VPC endpoint?

Think of a VPC endpoint like a dedicated, secure tunnel between your house (VPC) and a library (AWS service). Instead of going through the bustling streets (public internet), you have a direct pathway from your home to the library. This pathway ensures that only you and authorized users can access the library's resources, like books or documents, without exposing them to outside risks. It's a private, efficient way to access what you need, keeping your data safe from prying eyes on the internet.

Let’s understand the problem we were facing,

When you're backing up data from an EC2 instance to an S3 bucket, it usually goes over the internet, whether the instance is in a public or private subnet. But if the data is sensitive, that means it's risky because hackers could try to get it while it's traveling over the internet.

![Issue](./img/64.%20Public%20Issue.png)

To avoid this risk, we can use something called VPC endpoints. These endpoints make a private connection between the VPC and S3, so the data doesn't have to go over the internet. This way, even sensitive data stays safe from hackers and other threats.

![resolvedissuewithEndPoiny](./img/65.%20resolveissuewithEndpoint.png)

#### Project Reflection:

- Successfully completed the project tasks related to setting up VPC infrastructure and configuring network components.
- Gained practical experience in navigating AWS management console and configuring VPC resources.
- Encountered challenges such as CIDR block size limitations and learned how to troubleshoot and resolve them effectively.
- Developed a deeper understanding of network architecture and cloud networking concepts through hands-on experimentation.
- Recognized the importance of network security measures, such as NAT gateway and VPC endpoints, in ensuring secure communication within cloud environments.
- Overall, the project offered valuable perspectives on the fundamentals of cloud networking and practical experience in deploying VPC infrastructure on AWS.


Project END. 

