
variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "eks_node_sg" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "db_user" {
  type = string
}

variable "multi_az" {
  type = bool
}
