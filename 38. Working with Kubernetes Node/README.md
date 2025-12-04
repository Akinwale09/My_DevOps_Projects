# Working with Kubernetes Nodes

## Kubernetes Nodes

Now that we have our minikube cluster setup, let's dive into nodes in kubernetes.

### What Is a Node

In Kubernetes, think of a node as a dedicated worker, like a dependable employee in an office, responsible for executing tasks and hosting containers to ensure seamless application performance. A Kubernetes Node is a physical or virtual machine that runs the Kubernetes software and serves as a worker machine in the cluster. Nodes are responsible for running Pods, which are the basic deployable units in Kubernetes. Each node in a kubernetes cluster typically represents a single host system.

#### Managing Nodes in kubernetes:

Minikube simplifies the management of Kubernetes for development and testing purposes. But in the context of minikube (a kubernetes cluster), we need to start it up before we can be able to access our cluster.

1. **Start Minikube Cluster:**

`minikube start`

On Ubuntu Server (AWS)

![StartMinikube](./img/01.%20StartMinikube.png)

Kubernetes on Local Computer

![StarsMinikubeonWindow](./img/02.%20OnWindows.png)

This command starts a local Kubernetes cluster (minikube) using a single-node Minikube setup. It provisions a virtual machine (VM) as the Kubernetes node.

2. **Stop Minikube Cluster:**

`minikube stop`

![StopMinikube](./img/03.%20StopMinikube.png)

Stops the running Minikube (local kubernetes cluster), preserving the cluster state.

3. **Delete Minikube Cluster:**

`minikube delete`

Deletes the Minikube kubernetes cluster and its associated resources.

4. **View Nodes:**

`kubectl get nodes`

On Window

![GetNodes](./img/05.%20NodeStarted.png)

On Ubuntu

![OnUbuntu](./img/06.%20NodeOnUbuntu.png)

Lists all the nodes in the kubernetes cluster along with their current status.

5. **Inspect a Node:**

`kubectl describe node <node-name>`

Provides detailed information about a specific node, including its capacity, allocated resources, and status.

On Windows

![InspectNode](./img/07.%20InspectNode.png)

On Ubuntu Linux

![InspectNode](./img/08.%20InspectonUbuntu.png)


**Node Scaling and Maintenance:**

Minikube, as it's often used for local development and testing, scaling nodes may not be as critical as in production environments. However, understanding the concepts is beneficial:

- **Node Scaling:** Minikube is typically a single-node cluster, meaning you have one worker node. For larger, production-like environments.

- **Node Upgrades:** Minikube allows you to easily upgrade our local cluster to a new Kubernetes version, ensuring that our development environment aligns with the target production version.

By effectively managing nodes in Minikube kubernetes cluster, we can create, test, and deploy applications locally, simulating a Kubernetes cluster without the need for a full-scale production setup. This is particularly useful for debugging, experimenting, and developing applications in a controlled environment.


End. 

