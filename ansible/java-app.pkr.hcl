variable "ami_id" {
  type    = string
  default = "ami-0e001c9271cf7f3b9"
}

locals {
  app_name = "java-app-1.0.1"
}

packer {
  required_plugins {
    ansible = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "java-app" {
  ami_name      = "PACKER-${local.app_name}"
  instance_type = "t2.medium"
  region        = "us-east-1"
  source_ami    = var.ami_id
  ssh_username  = "ubuntu"
  tags = {
    Env  = "DEMO"
    Name = "PACKER-${local.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.java-app"]

  provisioner "ansible" {
    playbook_file = "java-app.yml"
  }
}
