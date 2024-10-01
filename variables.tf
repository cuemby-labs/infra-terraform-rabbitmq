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

#
# RabbitMQ manifest variables
#

variable "username" {
  type        = string
  description = "Username for RabbitMQ"
}

variable "password" {
  type        = string
  description = "Password for RabbitMQ"
  sensitive   = true 
}

variable "domain_name" {
  type        = string
  description = "domain name for RabbitMQ, e.g. 'dev.domainname.com'"
  default     = "dev.domainname.com"
}

variable "dash_domain_name" {
  type        = string
  description = "domain name with dashes for RabbitMQ, e.g. 'dev-domainname-com'"
  default     = "dev-domainname-com"
}

variable "issuer_name" {
  type        = string
  description = "origin issuer name"
  default     = "origin-ca-issuer"
}

variable "issuer_kind" {
  type        = string
  description = "origin issuer kind"
  default     = "ClusterOriginIssuer"
}