resource "kubernetes_service" "demo-svc" {
  metadata {
    name = "terraform-demo"
  }
  spec {
    selector = {
      app = kubernetes_pod.demo.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_pod" "demo" {
  metadata {
    name = "nginx-demo"
    labels = {
      app = "${var.customer}-pod"
    }
  }

  spec {
    container {
      image = "nginx:1.21.6"
      name  = "${var.customer}-nginx"
    }
  }
}