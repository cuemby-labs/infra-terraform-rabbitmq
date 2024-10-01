ingress:
  enabled: true
  hostname: rabbitmq.${domain_name}
  annotations:
      ingress.kubernetes.io/proxy-body-size: "0"
      ingress.kubernetes.io/ssl-redirect: "true"
      nginx.ingress.kubernetes.io/proxy-body-size: "0"
      nginx.ingress.kubernetes.io/ssl-redirect: "true"
      cert-manager.io/issuer: ${issuer_name}
      cert-manager.io/issuer-kind: ${issuer_kind}
      cert-manager.io/issuer-group: cert-manager.k8s.cloudflare.com
      external-dns.alpha.kubernetes.io/cloudflare-proxied: "true"
  tls: true
  extraTls: 
    - hosts:
        - rabbitmq.${domain_name}
      secretName: "rabbitmq-${dash_domain_name}"
auth:
  username: ${username}
  password: ${password}