#Kubernetes namespace to hold application
resource "kubernetes_namespace" "terraform-k8s" {
  metadata {
    name = "terraform-k8s"
  }
}

resource "kubernetes_deployment" "test-deploy" {
  metadata {
    name = "terraform"
    namespace = "terraform-k8s"
    labels = {
      test = "MyApp"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "MyApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyApp"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "nginx-terraform"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}
