variable "region" {
  description = "The AWS region to deploy to"
}

variable "access_key" { 
  description = "The AWS access key"
}

variable "secret_key" {
  description = "AWS secret key"
}

variable "vpc_cidr" {
  description = "The whole subnet allocated to this aws region VPC"
  type        = string
  default     = "10.211.0.0/20"
}

variable "private_subnets" {
  description = "The list of private subnets allocated to this aws region VPC to each AZ"
  type        = list(string)
  default     = ["10.211.0.0/24", "10.211.1.0/24", "10.211.2.0/24"]
}

variable "public_subnets" {
  description = "The list of public subnets allocated to this aws region VPC to each AZ"
  type        = list(string)
  default     = ["10.211.3.0/24", "10.211.4.0/24", "10.211.5.0/24"]
}

variable "ssh_public_key" {
  description = "The SSH public key contents for tailscale instance access."
  type        = string
}
