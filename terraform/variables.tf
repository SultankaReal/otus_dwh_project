variable "admin_password" {
  description = "Clickhouse admin password"
  type        = string
  sensitive   = true
}


data "yandex_mdb_clickhouse_cluster" "foo" {
  name = "click-test"
}

output "clickhouse_host_fqdn" {
  value = data.yandex_mdb_clickhouse_cluster.foo.host[0].fqdn
}