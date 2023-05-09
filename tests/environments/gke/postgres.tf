resource "kubernetes_stateful_set_v1" "postgres" {
  metadata {
    labels = {
      app = "pg-bench"
    }
    name = "pg-bench"
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "pg-bench"
      }
    }

    service_name = format("%s-%s", "pg-bench", "svc")

    template {
      metadata {
        labels = {
          app = "pg-bench"
        }
        annotations = {}
      }

      spec {
        container {
          name              = "postgres"
          image             = "postgres:15-alpine"
          image_pull_policy = "IfNotPresent"

          volume_mount {
            name       = format("%s-%s", "pg-bench", "vc")
            mount_path = "/var/lib/postgresql/data"
            sub_path   = ""
          }

          env {
            name  = "POSTGRES_DB"
            value = "postgres"
          }

          env {
            name  = "POSTGRES_USER"
            value = "postgres"
          }

          env {
            name  = "PGDATA"
            value = "/var/lib/postgresql/data/pgdata"
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = "IlBPU1RHUkVTX1BBU1NXT1JEIg=="
          }
        }

        termination_grace_period_seconds = 300
        node_selector                    = { "cloud.google.com/gke-nodepool" : "e2-standard-2" }
      }
    }

    update_strategy {
      type = "RollingUpdate"

      rolling_update {
        partition = 1
      }
    }

    volume_claim_template {
      metadata {
        name = format("%s-%s", "pg-bench", "vc")
      }

      spec {
        access_modes       = ["ReadWriteOnce"]
        storage_class_name = "standard"
        resources {
          requests = {
            storage = "16Gi"
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "postgres_dev_service" {
  metadata {
    name = format("%s-%s", "pg-bench", "svc")
    labels = {
      app = "pg-bench"
    }
  }


  spec {
    selector = {
      app = "pg-bench"
    }

    port {
      port        = 5432
      target_port = 5432
    }
    type = "ClusterIP"

    cluster_ip = "None"
  }
}

