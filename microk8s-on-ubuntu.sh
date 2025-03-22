#!/bin/bash

# Step 1: Update System Packages
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Step 2: Install MicroK8s
echo "Installing MicroK8s..."
sudo snap install microk8s --classic

# Step 4: Verify Installation
echo "Checking MicroK8s status..."
microk8s status --wait-ready

# Step 5: Enable Essential Add-ons
echo "Enabling essential MicroK8s add-ons..."
microk8s enable dns storage dashboard

# Step 6: Configure kubectl alias
echo "Setting up kubectl alias..."
echo "alias kubectl='microk8s kubectl'" >> ~/.bashrc
source ~/.bashrc

# Step 7: Check Cluster Information
echo "Verifying cluster information..."
microk8s kubectl cluster-info

# Optional: Enable MicroK8s on system startup
echo "Enabling MicroK8s on startup..."
sudo snap enable microk8s

echo "MicroK8s installation and setup completed successfully!"


# Step 3: Add User to MicroK8s Group
echo "Adding user to microk8s group..."
sudo usermod -aG microk8s $USER
newgrp microk8s
