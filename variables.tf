#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}

#
# RabbitMQ variables
#

variable "release_name" {
  description = "The name of the Helm release."
  type        = string
  default     = "rabbitmq"
}

variable "namespace_name" {
  description = "The namespace where the Helm release will be installed."
  type        = string
  default     = "rabbit-mq"
}

variable "chart_version" {
  description = "The version of the ingress-nginx Helm chart."
  type        = string
  default     = "15.0.1"
}

variable "resources" {
  description = "Resource limits and requests for the RabbitMQ Helm release."
  type        = map(map(string))

  default = {
    limits = {
      cpu    = "2000m"
      memory = "512Mi"
    }
    requests = {
      cpu    = "1000m"
      memory = "256Mi"
    }
  }
}

#
# RabbitMQ manifest variables
#

variable "username" {
  type        = string
  description = "Username for RabbitMQ"
  default     = "admin"
}

variable "password" {
  type        = string
  description = "Password for RabbitMQ"
  sensitive   = true 
  default     = ""
}

variable "domain_name" {
  type        = string
  description = "Domain name for RabbitMQ, e.g. 'dev.domainname.com'"
  default     = "dev.domainname.com"
}

variable "issuer_name" {
  type        = string
  description = "Origin issuer name"
  default     = "origin-ca-issuer"
}

variable "issuer_kind" {
  type        = string
  description = "Origin issuer kind"
  default     = "ClusterOriginIssuer"
}