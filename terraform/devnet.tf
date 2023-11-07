resource "kubernetes_namespace" "devnet" {
  depends_on = [azurerm_kubernetes_cluster.cluster]
  metadata {
    name = "devnet"
  }
}
resource "kubernetes_deployment" "devnet" {
  depends_on = [azurerm_kubernetes_cluster.cluster]
  metadata {
    name      = "devnet"
    namespace = "devnet"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "devnet"
      }
    }
    template {
      metadata {
        labels = {
          app = "devnet"
        }
      }
      spec {
        container {
          image = "tishodevopsa/go-ethereum:devnet_hardhat"
          name  = "devnet"
          port {
            container_port = 8545
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "devnet-svc" {
  depends_on = [azurerm_kubernetes_cluster.cluster]
  metadata {
    name      = "devnet-svc"
    namespace = "devnet"
  }

  spec {
    selector = {
      app = kubernetes_deployment.devnet.spec.0.template.0.metadata.0.labels.app
    }

    type = "LoadBalancer"
    port {
      port        = 80
      target_port = 8545
    }
  }
} 