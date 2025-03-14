
variable "environment" {
  type = string
}

variable "vpc-cidr" {
  type = string
}

variable "subnet-database" {
  type = map(object({
    zone = string
    name = string
    cidr = string
  }))
}

variable "subnet-private" {
  type = map(object({
    zone = string
    name = string
    cidr = string
  }))
}

variable "subnet-public" {
  type = map(object({
    zone = string
    name = string
    cidr = string
  }))
}