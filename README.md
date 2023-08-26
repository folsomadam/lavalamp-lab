# lavalamp-lab
Build quick labs with Vagrant, then configure with Ansible


-Labs are defined in a definitions file DC, IIS, CA, SQL, etc.... 
-These get parsed into a Vagrantfile
-Vagrantfile is executed using multi-threaded paths
-After deployment ansible inventory is created to name machines, setup domain, deploy server roles, packages installers