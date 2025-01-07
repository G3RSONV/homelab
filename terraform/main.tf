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

resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name        = "ubuntu-server"
  node_name = "pve"
  vm_id = 102

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
        address = "dhcp"
      }
    }
  }  

  disk {
    datastore_id = "extrassd"
    file_id = "local:iso/ubuntu-24.04.1-live-server-amd64.iso"
    interface = "virtio0"
    iothread = true
    size = 20
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
 
  serial_device {}
}    
#   network {
#     model  = "virtio"
#     bridge = "vmbr0"
#   }
#   iso = 
#   os_type = "linux"
#   ssh_keys = file("~/.ssh/id_rsa.pub") # Path to your SSH public key
# }

# resource "proxmox_virtual_environment_vm" "windows_vm" {
#   name      = "windows-server"
#   target_node = "proxmox-node-1"
#   cores     = 2
#   memory    = 4096
#   disk {
#     size = "50G"
#     type = "scsi"
#   }
#   network {
#     model  = "virtio"
#     bridge = "vmbr0"
#   }
#   iso = "local:iso/windowsserver.iso"
#   os_type = "win10"  # Use 'win10' for Windows Server ISO as well
#   winrm_password = var.wserver_psswd
# }


