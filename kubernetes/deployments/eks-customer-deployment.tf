resource "kubernetes_deployment" "example" {
  metadata {
    name = var.appName
    labels = {
      test = var.appName
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = var.appName
      }
    }

    template {
      metadata {
        labels = {
          test = var.appName
        }
      }

      spec {
        container {
          image = var.uriECRImage
          name  = "Imagem ECR da aplicacao"

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
        }
      }
    }
  }
}