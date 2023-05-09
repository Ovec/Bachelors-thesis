terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.27.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.12.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.13.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.3.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.region_zone
}


data "google_client_config" "default" {}
data "google_container_cluster" "my_cluster" {
  name = var.project_name

  depends_on = [
    google_container_node_pool.e2-standard-2
  ]
}

provider "kubernetes" {
  host                   = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
}

provider "kubectl" {
  host                   = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
  # load_config_file       = "false"
}

provider "helm" {
  kubernetes {
    host                   = "https://${data.google_container_cluster.my_cluster.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
  }
}
