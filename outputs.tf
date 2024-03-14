output "kubernetes_cluster_info" {
  value = {
    name         = azurerm_kubernetes_cluster.this.name
    version      = azurerm_kubernetes_cluster.this.kubernetes_version
    dns_prefix   = azurerm_kubernetes_cluster.this.dns_prefix
  }
}