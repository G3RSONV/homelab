### VM inventory

##### Original setup
 Since I already had a PC working as my proxmox server I decided to include that here to keep track of the changes I will be making down the road.

| VM Name      | VM ID | OS           | IP Address    | CPU | RAM   | Storage | Role/Use Case         | Notes            |
|--------------|-------|--------------|---------------|-----|-------|---------|-----------------------|------------------|
| u-server     | 101   | Ubuntu Sever20.04 | 192.168.1.10  | 2   | 6GB   | 32GB    | Multi purpose Server            | Running docker containers   |
| windows-server   | 102   | windows server 2019      | 192.168.1.11  |  6  | 6GB   | 60GB    | Database Server       | Running AD    |
| kalilinux      | 103   | kali          | 192.168.1.12  | 1   | 4GB   | 64GB    | penetration testing        |    |


##### Current setup

| VM Name      | VM ID | OS           | IP Address    | CPU | RAM   | Storage | Role/Use Case         | Notes            |
|--------------|-------|--------------|---------------|-----|-------|---------|-----------------------|------------------|
| ubuntu-server|  102  | ubuntu server20.04 | DHCP | 2 | 2GB | 20GB | 