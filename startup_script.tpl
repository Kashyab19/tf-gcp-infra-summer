#!/bin/bash

# Install Google Cloud SDK if not already installed
if ! command -v gcloud &> /dev/null; then
  echo "Google Cloud SDK not found, installing..."
  export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
  echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  sudo apt-get update && sudo apt-get install -y google-cloud-sdk
fi

# Retrieve secrets from Google Secret Manager
JWT_SECRET=$(gcloud secrets versions access latest --secret=jwt-secret)

# Set environment variables
#To-do: Replace the password with rand
DB_USER="${DB_USER}"
DB_PASS="tZ-.5aP}j@+fY:z("
DB_NAME="${DB_NAME}"
DB_HOST="${DB_HOST}"
APPLICATION_NAME="${APPLICATION_NAME}"
SERVICE_NAME="${SERVICE_NAME}"
GCP_PROJECT_ID="${GCP_PROJECT_ID}"
PUBSUB_TOPIC="verify_email"

# Update application configuration
echo "DB_USER=${DB_USER}" | sudo tee -a /etc/environment
echo "DB_PASS=tZ-.5aP}j@+fY:z(" | sudo tee -a /etc/environment
echo "DB_NAME=${DB_NAME}" | sudo tee -a /etc/environment
echo "DB_HOST=${DB_HOST}" | sudo tee -a /etc/environment
echo "DB_PORT=${DB_PORT}" | sudo tee -a /etc/environment
echo "JWT_SECRET_KEY=${JWT_SECRET}" | sudo tee -a /etc/environment
echo "APPLICATION_NAME=${APPLICATION_NAME}" | sudo tee -a /etc/environment
echo "SERVICE_NAME=${SERVICE_NAME}" | sudo tee -a /etc/environment
echo "GCP_PROJECT_ID=${GCP_PROJECT_ID}" | sudo tee -a /etc/environment
echo "PUBSUB_TOPIC=verify_email" | sudo tee -a /etc/environment


# Create the systemd service file with environment variables
sudo bash -c 'cat <<EOF > /etc/systemd/system/${SERVICE_NAME}
[Unit]
Description=Go Web App Service by Kashyab - Systemd from TF
After=network.target

[Service]
Environment=DB_USER=${DB_USER}
Environment=DB_PASS=tZ-.5aP}j@+fY:z(
Environment=DB_NAME=${DB_NAME}
Environment=DB_HOST=${DB_HOST}
Environment=DB_PORT=${DB_PORT}
Environment=JWT_SECRET_KEY=${JWT_SECRET}
Environment=APPLICATION_NAME=${APPLICATION_NAME}
Environment=SERVICE_NAME=${SERVICE_NAME}
Environment=GCP_PROJECT_ID=${GCP_PROJECT_ID}
Environment=PUBSUB_TOPIC=verify_email
ExecStart=/usr/local/bin/${APPLICATION_NAME}
Restart=on-failure
User=csye6225
Group=csye6225
WorkingDirectory=/usr/local/bin

[Install]
WantedBy=multi-user.target
EOF'


sudo chmod 644 /etc/systemd/system/webapp.service
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
sudo restorecon -rv /etc/systemd/system/webapp.service

# Reload systemd manager configuration
sudo systemctl daemon-reload


# Enable and start the service
sudo systemctl enable ${SERVICE_NAME}
sudo systemctl restart ${SERVICE_NAME}
