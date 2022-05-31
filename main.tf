terraform {
  required_version = ">= 0.12.26"
}

variable "subject" {
   type = string
   default = "Mundo"
   description = "Subject to hello"
}

output "hello_world" {
  value = "Hola, ${var.subject}!"
}
