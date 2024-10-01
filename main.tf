locals {
  context = var.context
}

resource "kubernetes_namespace" "rabbit_mq" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "rabbit_mq" {
  name       = var.release_name
  repository = "oci://registry-1.docker.io/bitnamicharts/"
  chart      = "rabbitmq"
  version    = var.chart_version
  namespace  = var.namespace_name

  # Ingress values
  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      username         = var.username,
      password         = var.password,
      domain_name      = var.domain_name,
      issuer_name      = var.issuer_name
      issuer_kind      = var.issuer_kind
    })
  ]
}