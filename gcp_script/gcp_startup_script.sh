#!/bin/bash

# Function to check if GCP VM is running
check_gcp_vm() {
    vm_status=$(gcloud compute instances describe INSTANCE_NAME --zone=ZONE --format="value(status)")
    if [ "$vm_status" == "RUNNING" ]; then
        return 0  # VM is running
    else
        return 1  # VM is not running
    fi
}

# Function to start the GCP VM if it's not running
start_gcp_vm_if_not_running() {
    if ! check_gcp_vm; then
        echo "GCP VM is not running. Starting it up..."
        gcloud compute instances start INSTANCE_NAME --zone=ZONE &> /dev/null
    else
        echo "GCP VM is already running."
    fi
}

# Main script
start_gcp_vm_if_not_running

# Wait until the GCP VM is running
while true; do
    if check_gcp_vm; then
        echo "GCP VM is now running."
        break
    else
        echo "Waiting for GCP VM to start..."
        sleep 10  # Adjust the sleep time as needed
    fi
done
