terraform {
  required_providers {
    proxmox = {
        source = "bpg/proxmox"
        version = "0.69.1"
    }
  }
}


provider "proxmox" {
  endpoint = "https://192.168.86.240:8006"
  api_token = var.px_api

  insecure = true
#   tmp_dir = true    
  ssh {
    agent = true
    username = "root"
  }
}


# ubuntu server vm
resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name        = "ubuntu-server"
  node_name = "pve"
  vm_id = 102
  started = false

  agent {
    enabled = false
  }
  
  initialization {
    user_account {
      username = "ubuntu"
      password = "password"
    }
    ip_config {
      ipv4 {
        address = "192.168.86.131/24"
      }
    }
  }  

  disk {
    datastore_id = "extrassd"
    file_format = "raw"
    interface = "virtio0"
    iothread = true
    size = 20
   }
  
  cdrom {
    enabled = true
    file_id = "local:iso/ubuntu-24.04.1-live-server-amd64.iso"
  }

  cpu {
    cores = 2
    type = "x86-64-v2-AES"
  }

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
 
  # serial_device {}
}    

# windows server vm
resource "proxmox_virtual_environment_vm" "windows_vm" {
  name        = "windows-server"
  node_name = "pve"
  vm_id = 103
  started = false

  agent {
    enabled = false
  }
  
  initialization {
    user_account {
      username = "admin"
      password = "password"
    }
    ip_config {
      ipv4 {
        address = "192.168.86.132/24"
      }
    }
  }  

  disk {
    datastore_id = "extrassd"
    # file_id = "local:iso/windowsserver.iso"
    interface = "sata0"
    file_format = "raw"
    # iothread = true
    size = 32
   }
  
  cdrom {
    enabled = true
    file_id = "local:iso/windowsserver.iso"
  }

  cpu {
    cores = 2
    type = "x86-64-v2-AES"
  }

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "win10"
  }


  
}    