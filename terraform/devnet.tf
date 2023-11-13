resource "kubernetes_namespace" "devnet" {
  depends_on = [azurerm_kubernetes_cluster.k8s]
  metadata {
    name = "devnet-test"
  }
}

resource "kubernetes_deployment" "devnet-bootnode" {
  depends_on = [azurerm_kubernetes_cluster.k8s]
  metadata {
    name      = "devnet-bootnode"
    namespace = "devnet-test"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "devnet-bootnode"
      }
    }
    template {
      metadata {
        labels = {
          app = "devnet-bootnode"
        }
      }
      spec {
        container {
          image = "tishodevopsa/go-ethereum:devnet_hardhat_bootnode"
          name  = "devnet-bootnode"
          port {
            container_port = 30310
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "devnet-node1" {
  depends_on = [azurerm_kubernetes_cluster.k8s]
  metadata {
    name      = "devnet-node1"
    namespace = "devnet-test"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "devnet-node1"
      }
    }
    template {
      metadata {
        labels = {
          app = "devnet-node1"
        }
      }
      spec {
        container {
          image = "tishodevopsa/go-ethereum:devnet_hardhat_node1"
          name  = "devnet-node1"
          port {
            container_port = 8545
          }
        }
      }
    }
  }
}
resource "kubernetes_deployment" "devnet-node2" {
  depends_on = [azurerm_kubernetes_cluster.k8s]
  metadata {
    name      = "devnet-node2"
    namespace = "devnet-test"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "devnet-node2"
      }
    }
    template {
      metadata {
        labels = {
          app = "devnet-node2"
        }
      }
      spec {
        container {
          image = "tishodevopsa/go-ethereum:devnet_hardhat_node2"
          name  = "devnet-node2"
          port {
            container_port = 8546
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "devnet-svc" {
  depends_on = [kubernetes_deployment.devnet-node1]
  metadata {
    name      = "devnet-svc"
    namespace = "devnet-test"
  }
  spec {
    selector = {
      app = "devnet"
    }
    type = "LoadBalancer"
    port {
      port        = 80
      target_port = 8545
    }  
  }
} 

