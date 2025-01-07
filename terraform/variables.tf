variable "px_tokenid" {
  description = "proxmox token ID"
  type        = string
}

variable "px_token_secret" {
  description = "proxmox secret"
  type        = string
  sensitive = true
}

variable "px_api" {
  description = "proxmox secret"
  type        = string
  sensitive = true
}
variable "px_user" {
  description = "proxmox user"
  type        = string
}

variable "px_psswd" {
  description = "obvious description"  
  type = string
}

variable "wserver_psswd" {
  description = "obvious description"  
  type = string
}