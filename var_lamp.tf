variable "lamp-family" {
    type = string
    default = "lamp"
}

variable "vm_lamp" {
    type = object({
      name = string
      platform_id = string
      hostname = string
    })
    default = {
      name = "lamp"
      platform_id = "standard-v3"
      hostname = "lamp"
    }
}

variable "resources_lamp" {
    type = object({
      cores = number
      memory = number
      core_fraction = number
    })
    default = {
      core_fraction = 20
      memory = 2
      cores = 2
    }
}
variable "nat-lamp" {
    type = bool
    default = true
}

variable "lamp_image" {
  type = string
  default = "fd8g59ke0tv5mtdfiehe"
  
}
