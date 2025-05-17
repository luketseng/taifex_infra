# 🐳 TAIFEX Infrastructure

This repository contains the infrastructure setup for the TAIFEX (Taiwan Futures Exchange) project, providing a containerized environment for web automation and testing.

## 🔍 Overview

The TAIFEX infrastructure project uses Docker containers to create an isolated environment for running web automation, testing, and data collection tasks related to the Taiwan Futures Exchange. It includes both a standard Selenium-based setup and a VNC-enabled setup for visual debugging.

## 📁 Project Structure

```
taifex_infra/
├── 🐋 docker-compose.yml       # Container orchestration configuration
├── 🛠️ Dockerfile.seleniumbase  # Dockerfile for Selenium-based image
├── 🖥️ Dockerfile.vnc           # Dockerfile for VNC-enabled debugging image
├── 🔧 init_chromedriver.sh     # Script for initializing ChromeDriver
├── 🔄 Makefile                 # Build and management commands
├── 📝 README.md                # This documentation file
├── 📋 requirements.txt         # Python dependencies
└── 🚀 start.sh                 # Container startup script

> ⚠️ **Note:** The sibling projects `taifex_daily/` and `taifex_web/` must be placed **outside** this folder, on the same directory level:
../
├── taifex_daily/
├── taifex_web/
└── taifex_infra/
```

## 🔧 Prerequisites

- Docker
- Docker Compose
- Make

## 🚀 Getting Started

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd taifex_infra
   ```

2. Build the Docker image:
   ```bash
   make build
   ```

3. Start the containers:
   ```bash
   make up
   ```

## 📋 Available Commands

The project includes a Makefile with several useful commands:

- `make help`: Show all available commands
- `make build`: Build Docker image (optional parameters: `file=` and `tag=`)
- `make up`: Start containers via docker-compose
- `make down`: Stop and remove docker-compose containers
- `make rebuild`: Rebuild image and restart containers
- `make run`: Run container interactively and auto-remove after exit
- `make shell`: Start a bash shell in the running container
- `make exec-cmd`: Run a custom command inside the container (use `cmd=...`)
- `make logs`: Show container logs (follow mode)
- `make clean`: Remove build cache, dangling images, and volumes

## 🐋 Docker Images

### 🔬 SeleniumBase Image (`Dockerfile.seleniumbase`)

seleniumbase-app
Includes Python, Chrome, ChromeDriver, and Selenium

This image provides a headless environment for running Selenium-based automation scripts.
Mounts both taifex_daily and taifex_web for integration testing or automation

### 🖥️ VVNC Image (`Dockerfile.vnc`, not used)

taifex-web
Based on the official httpd:latest image

This image includes a VNC server, allowing you to visually inspect the browser automation process for debugging purposes.
Serves static files from taifex_web on http://localhost:8080🧱 Container Services

## ⚙️  Configuration

The main configuration is handled through the `docker-compose.yml` file, which defines the services, networks, and volumes used by the project.

## 📚 Usage Examples

### Running a Test Script

```bash
make run cmd="python path/to/your_test_script.py"
```

### Accessing the VNC Server

If using the VNC-enabled image, connect to the VNC server at localhost:5900 (or the port specified in your docker-compose.yml).

### Executing Commands in the Running Container

```bash
make exec-cmd cmd="python -m pip install additional-package"
```

## ❓ Troubleshooting

If you encounter issues with ChromeDriver, run:

```bash
make exec-cmd cmd="./init_chromedriver.sh"
```

## 👥 Contributing (TBD)

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## 📜 License
[Specify your project's license here]
