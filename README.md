This script shows the VM name, resources (CPU, Memory) and on which server each VM is running.

On any of the servers where the ps utility is installed and the pacemaker/corosync cluster is deployed, we create a script, for example in the home directory:
vi ~/vm_resource.sh

Copy the contents of the script into it and save it.

Making the script executable:
chmod +x ~/vm_resource.sh

The script saves the data to a file located in the home directory - vm_data.txt
