# GCP VM Startup Script

This Bash script is designed to automate the process of checking if an GCP VM is running and starting it up if it's not. It utilizes the GCP CLI (Command Line Interface) to interact with GCP services.

## **Prerequisites**

Before you begin, ensure you have the following:

GCP CLI installed and configured on your machine.
Review the IAM permissions associated with the GCP CLI credentials to ensure they have sufficient privileges to manage instances.

## **How it works**

### **Functions:**

1. **check_gcp_vm():**
  - This function checks the status of a specific VM instance.
  - It queries gcp to retrieve the state of the instance and compares it to the expected state "running".
  - Returns 0 if the instance is running, otherwise returns 1.

2. **start_gcp_vm_if_not_running():**
  - Calls the check_gcp_vm() function to see if the instance is running.
  - If the instance is not running, it starts the instance.
  - If the instance is already running, it displays a message indicating that.

### **Main Script:**

1. **start_gcp_vm_if_not_running:**
  - Invokes the start_gcp_vm_if_not_running() function.
  - This is the entry point of the script.

2. **Wait Loop:**
  - The script enters a loop to continuously check the status of the instance until it is running.
  - Inside the loop, it calls the check_gcp_vm() function.
  - If the instance is running, it displays a message and exits the loop.
  - If the instance is not running, it displays a message and waits for a predefined time (10 seconds by default) before checking again.

## **Usage**

1. **Configuration:**
  - Replace the "INSTANCE_NAME" with the name of your instance.
  - Replace the "ZONE" with the zone name where your instance is located.
    
2. **Adjustments (Optional):**
  - You can adjust the sleep time in the script to wait for a different duration between checks (e.g., increase/decrease the sleep time as needed).

3. **Execution:**
  - Make the script executable (chmod +x script_name.sh).
  - Run the script (./script_name.sh).
