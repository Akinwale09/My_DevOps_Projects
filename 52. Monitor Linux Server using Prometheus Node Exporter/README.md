# Monitor Linux Server using Prometheus Node Exporter

### Introduction

Monitoring a Linux server is essential for ensuring system health and performance. 

Prometheus Node Exporter is a powerful tool that collects hardware and operating system metrics, providing deep insights into our server's state per time. This project will guide you through installing and configuring Prometheus Node Exporter on a Linux server and monitoring it with Prometheus.

### Objectives

1. Install and configure Prometheus Node Exporter on a Linux server.
2. Integrate Node Exporter with Prometheus for metric collection.
3. Explore system metrics collected by Node Exporter.
4. Set up basic queries in Prometheus for real-time monitoring.
5. Optionally configure alerts for key metrics.

### Prerequisites

1. **Linux Server:** A running Linux server with `sudo` privileges.
2. **Prometheus Instance:** A working Prometheus setup (local or remote).
3. **Network Access:** Ensure Prometheus can connect to the Linux server on port 9100.
4. **Tools:** Terminal access to the Linux server, Prometheus UI access, and a text editor for authoring configuration files.

### Tasks Outline

1. Install Prometheus Node Exporter on the Linux server.
2. Start and enable Node Exporter as a service.
3. Configure Prometheus to scrape metrics from Node Exporter.
4. Verify and query Node Exporter metrics in Prometheus.
5. Explore and analyze the collected metrics on the Prometheus UI.

### Project Tasks

#### Task 1 - Install Prometheus Node Exporter

1. Download the latest Node Exporter binary from the Prometheus GitHub releases page:

   I will be spining up Lib=nux server on AWS to install prometheus and node exporter. 

   ![Prometheus](./img/01.%20PrometheusServer.png)

   Connect to the server using Gitbash and run the commands below:

   `curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz`

   ![NodeExporterDownload](./img/02.%20NodeExpoterDownload.png)


2. Extract the downloaded tarball:

    `tar -xvf node_exporter-1.10.2.linux-amd64.tar.gz`

    ![ExtractDownloads](./img/02.%20NodeExpoterDownload.png)

3. Move the binary to a directory in your PATH:

    `sudo mv node_exporter-1.10.2.linux-amd64/node_exporter /usr/local/bin/`

    ![Movedthebinary](./img/04.%20MoveNodeExporter.png)

#### Task 2 - Start and Enable Node Exporter as a Service

1. Create a systemd service file for Node Exporter by running the command below:

    `sudo nano /etc/systemd/system/node_exporter.service`

    ![Systemdservices](./img/05.%20systemdservices.png)


2. Add the following content to the file:

    ![contentsystemdfile](./img/06.%20SystemDfile.png)

    ![contentadded](./img/07.%20contentadded.png)

3. Reload systemd and start the Node Exporter service using the following commands:

    `sudo systemctl daemon-reload`

    `sudo systemctl start node_exporter`

    `sudo systemctl enable node_exporter`

    ![reloadsystemd](./img/08.%20Reload%20systemd.png)

4. Verify that Node Exporter is running with this command:

    `sudo systemctl status node_exporter`

    ![NodeExporterRunning](./img/09.%20NodeExporter.png)

5. Confirm Node Exporter is accessible by visiting http://3.215.22.86:9100/metrics in a web browser. If you are using your computer, <your-server-ip> is localhost

    ![NodeExportAccessible](./img/10.%20NodeExportAccessible.png)


#### Task 3 - Configure Prometheus to Scrape Metrics from Node Exporter

1. Open the Prometheus configuration file (prometheus.yml):

    `vim /etc/prometheus/prometheus.yml`

    ![PrometheusConfigFile](./img/11.%20prometheusconfig.png)


2. Add a new scrape job for Node Exporter:

    ![ExporterNode](./img/12.%20ExporterNode.png)

    ![ScrapeJobAdded](./img/13.%20ScrapeJob.png)

3. Save the file and restart Prometheus to apply the changes:

    `sudo systemctl restart prometheus`


#### Task 4 - Verify and Query Node Exporter Metrics in Prometheus

1. Access the Prometheus web interface (e.g., http://3.222.251.1:9100)

    ![PremethusInterface](./img/14.%20PrometheusWebInterface.png)

2. Run a test query to verify Node Exporter metrics:

   - Example: node_cpu_seconds_total to view CPU usage.

    ![cpuusage](./img/15.%20cpu%20usage.png)

3. Check the "Targets" page in Prometheus to confirm the Node Exporter target is listed and "UP."

#### Task 5 - Explore and Analyze Metrics

1. Use the Prometheus query interface to explore key Node Exporter metrics:

    - node_memory_MemAvailable_bytes for Available Memory.
    - node_filesystem_avail_bytes for Available Disk Space.
    - node_network_receive_bytes_total: Network Bytes Received.

    ![usage](./img/16.%20CPU.png)

2. Create basic time-series graphs using Prometheus expressions (PromQL):

    - Example: rate(node_cpu_seconds_total[5m]) to analyze CPU usage over the last 5 minutes.
  
3. Optionally, set up alert rules for critical metrics like high CPU usage or low disk space.


#### Conclusion

In this project, you installed and configured Prometheus Node Exporter on a Linux server, integrated it with Prometheus, and explored collected metrics. These skills provide a strong foundation for monitoring server health and performance, and you can now extend this setup by adding advanced visualization tool like Grafana.


END.