# GCP project name
variable "project_name" {
  default = "operators"
}

# GCP project id
variable "project_id" {
  default = "operators-385815"
}

variable "region" {
  default = "europe-central2"
}

variable "region_zone" {
  default = "europe-central2-b"
}

variable "node_count" {
  default = 3
}

variable "node_disk_size" {
  default = 20
}
