# Setup Prometheus Node Exporter on Kubernetes

### Introduction

Prometheus is a widely-used monitoring system that collects and processes metrics from various sources. The Node Exporter is a Prometheus exporter that collects hardware and operating system metrics from a system. By deploying Node Exporter on Kubernetes, you can monitor the nodes in your Kubernetes cluster and gain insights into their performance.

#### Objectives

1. Understand the purpose of Prometheus Node Exporter.
2. Deploy Node Exporter as a DaemonSet in a Kubernetes cluster.
3. Configure Prometheus to scrape metrics from Node Exporter.
4. Visualize metrics using Prometheus UI.
Explore metrics available through Node Exporter.

#### Prerequisites

1. **Kubernetes Cluster:** A working Kubernetes cluster (e.g., Minikube, Kind, or a managed kubernetes service like EKS or AKS or GKE).
2. **Kubernetes CLI:** kubectl installed and configured for your cluster.
3. **Prometheus Setup:** Basic Prometheus installation running in the Kubernetes cluster.
4. **Tools:** A text editor to modify YAML files.

#### Tasks Outline

1. Understand how Node Exporter works and its purpose.
2. Deploy Node Exporter as a DaemonSet.
3. Configure Prometheus to scrape metrics from Node Exporter.
4. Verify the metrics in Prometheus.
5. Explore the metrics provided by Node Exporter.

###  Project Tasks

#### Task 1 - Understand How Node Exporter Works

1. Node Exporter is a lightweight application that runs on a node and exposes metrics about the node’s hardware and operating system.
2. Key metrics include:
    - CPU and memory usage
    - Disk I/O
    - Network statistics
    - Filesystem usage
3. Node Exporter runs as a containerized application in Kubernetes to collect metrics from each node.

###  PART 1 — Install Kubernetes (Minikube) on Ubuntu

Minikube is the easiest option for a lightweight Kubernetes cluster inside a VM.

#### STEP 1 — Install Required Dependencies

Run inside Ubuntu terminal:

`sudo apt update`

![SudoUpdate](./img/01.%20AptUpdate.png)

`sudo apt install -y curl wget apt-transport-https ca-certificates conntrack`

![Conntrack](./img/02.%20Conntrack.png)

#### STEP 2 — Install Docker (Container Runtime)

`sudo apt install -y docker.io`

![InstallDocker](./img/03.%20InstallDocker.png)

`sudo systemctl enable docker`

![enableDocker](./img/04.%20EnableDocker.png)

`sudo systemctl start docker`

![StarsDocker](./img/05.%20StartsDocker.png)

`sudo usermod -aG docker $USER`

![eanbleduser](./img/06.%20enabledUser.png)

Log out and back in so Docker permissions take effect.

#### STEP 3 — Install Minikube

`curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`

![InstallMinikube](./img/07.%20installkube.png)

`sudo install minikube-linux-amd64 /usr/local/bin/minikube`

![InstallMiniKube](./img/08.%20MiniKube.png)

#### STEP 4 — Install kubectl

`curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`

![InstallKubectl](./img/09.%20InstallKubeCTL.png)

`sudo install kubectl /usr/local/bin/`

![kubectl](./img/10.%20Kubectl.png)

#### STEP 5 — Start Minikube on Desktop

`minikube start --driver=docker --cpus=4 --memory=4096`

![StartMiniKube](./img/11.%20KubeOnDesktop.png)

Verify:

`kubectl get nodes`

![KubectlGetNode](./img/12.%20KubectlgetNode.png)

You should see: minikube   Ready

### PART 2 — Install Prometheus on Kubernetes

We’ll install basic Prometheus using a Deployment + Service (not Helm), since our task assumes a simple configuration.

#### STEP 1 — Create monitoring namespace

`kubectl create namespace monitoring`

![NameSpaceMonitoring](./img/13.%20NamespaceMonitoring.png)

#### STEP 2 — Deploy Prometheus YAML

Create file:

1. Create a YAML file for the Node Exporter DaemonSet:

`vim prometheus-deploy.yaml`

Paste:
![Prometheusyml](./img/14.%20file.png)
![Prometheusyml](./img/15.%20prometheusfile.png)
![Prometheusyml](./img/16.%20prometheusfile.png)

2. Apply the YAML file using kubectl:

`kubectl apply -f prometheus-deploy.yaml`

![PromethuesDeploy](./img/17.%20PromethuesDeploy.png)

3. Verify the deployment:

`kubectl get pods -n monitoring`

![PrometheusRunning](./img/18.%20PrometheusRunning.png)

### PART 3 — Deploy Node Exporter as DaemonSet

Create:

`vim node-exporter-daemonset.yaml`

![NodeExporter](./img/19.%20NodeExporter.png)


Paste your YAML:

![ExporterYMLFile](./img/20.%20exporterfile.png)

![YAMLFileIncluded](./img/21.%20YamlFileIncluded.png)

![RemainingYAMLFile](./img/22.%20YAMLFile.png)

Apply:

`kubectl apply -f node-exporter-daemonset.yaml`

![DaemonsetCreated](./img/23.%20daemonsetcreated.png)

Verify:

`kubectl get daemonset -n monitoring`

![VerifyDaemonset](./img/24.%20DaemonSetCreated.png)


#### Create Node Exporter Service

`vim node-exporter-service.yaml`

![NodeService](./img/25.%20NodeService.png)

![NodeServiceCode](./img/26.%20NodeServiceCode.png)

![NodeServiceCreated](./img/27.%20NodeServiceCreated.png)

Apply it:

`kubectl apply -f node-exporter-service.yaml`

![NodeServiceApply](./img/28.%20NodeServiceApply.png)

Prometheus will now detect node-exporter automatically (because of the scrape job added earlier).

#### PART 4 — Access Prometheus UI

Access the Prometheus UI (e.g., by port-forwarding):

`kubectl port-forward svc/prometheus 9090:9090 -n monitoring`

![portforwarding](./img/29.%20PortForwarding.png)

Go to: 

http://localhost:9090

![Webpage](./img/30.%20WebAddress.png)

#### PART 5 — Explore Metrics Provided by Node Exporter

In the Prometheus UI query bar, test:

CPU Metrics

`node_cpu_seconds_total`

Memory

`node_memory_MemAvailable_bytes`

Disk

`node_filesystem_avail_bytes`

Network

`rate(node_network_receive_bytes_total[5m])`

#### Conclusion

By completing this project, we’ve set up Prometheus Node Exporter on Kubernetes, enabling comprehensive monitoring of node-level metrics. we’ve also integrated Node Exporter with Prometheus, learned to query metrics, and explored the data it provides. This setup can now be extended with dashboards (e.g., Grafana) or alerts for advanced monitoring needs.