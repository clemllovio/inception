# Inception
Inception is a project that aims to broaden understanding of system administration by using Docker. It involves setting up a small infrastructure composed of different services under specific rules. The project emphasizes the importance of using Docker to install and configure various services like NGINX, WordPress and MariaDB.

## Prerequisites
• Docker

• Docker Compose

• Make

## Installation
1. Clone the repository:
   ```
   git clone https://github.com/clemllovio/inception.git
   ```
2. Navigate to the project directory
3. Build and start the containers using the Makefile
  ```
  make
  ```
## Usage
Once the containers are up and running, you can access the WordPress site via HTTPS:
```
https://cllovio.42.fr
```

## Configuration
• Environment variables are stored in a .env file (not included in the repository for security reasons)

• Docker Compose file defines the services, networks, and volumes

• Each service has its own Dockerfile for specific configurations

## Credits
This project was developed by Clémence Llovio as part of the curriculum at 42 School.
