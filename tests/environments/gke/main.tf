resource "google_container_cluster" "primary" {
  name     = var.project_name
  location = var.region_zone

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "e2-standard-2" {
  name       = "e2-standard-2"
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count


  node_config {
    oauth_scopes = ["cloud-platform"]
    preemptible  = false
    machine_type = "e2-standard-2"
    disk_size_gb = var.node_disk_size
  }

}
