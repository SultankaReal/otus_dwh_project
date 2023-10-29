resource "yandex_mdb_clickhouse_cluster" "foo" {
  name        = "click-cluster"
  environment = "PRODUCTION"
  version     = "23.9"
  network_id  = yandex_vpc_network.default_network.id
  security_group_ids = [yandex_vpc_security_group.security_group_1.id]
  

  sql_user_management = true
  admin_password      = var.admin_password

  access {
    data_lens = true
  }

  clickhouse {
    resources {
      resource_preset_id = "m2.large"
      disk_type_id       = "network-ssd"
      disk_size          = 50
    }
  }

  zookeeper {
    resources {
      resource_preset_id = "m2.large"
      disk_type_id       = "network-ssd"
      disk_size          = 30
    }
  }

  database {
    name = "otus"
  }


  host {
    type             = "CLICKHOUSE"
    zone             = "ru-central1-b"
    subnet_id        = yandex_vpc_subnet.foo.id
    shard_name       = "shard1"
    assign_public_ip = true
  }

  shard_group {
    name        = "single_shard_group"
    description = "Cluster configuration that contain only shard1"
    shard_names = [
      "shard1",
    ]
  }

  cloud_storage {
    enabled = false
  }
}


resource "yandex_vpc_network" "default_network" {}

resource "yandex_vpc_subnet" "foo" {
  name           = "click-subnet"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.default_network.id
  v4_cidr_blocks = ["10.5.0.0/24"]
}


resource "random_string" "random" {
   length           = 8
   special          = true
}

resource "yandex_vpc_security_group" "security_group_1" {
  name = random_string.random.result
  network_id  = yandex_vpc_network.default_network.id

  dynamic "ingress" {
      for_each = ["8443", "8123"]
    content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        v4_cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
      protocol = "ANY"
      v4_cidr_blocks = ["0.0.0.0/0"]
      predefined_target = "self_security_group"
  }
  egress {
      from_port = 0
      to_port = 65535
      protocol = "ANY"
      v4_cidr_blocks = ["0.0.0.0/0"]
  }
}


# resource "yandex_vpc_security_group" "security_group_2" {
#   name = sg-for-clickhouse-internal
#   network_id  = yandex_vpc_network.default_network.id

#   ingress {
#       protocol = "ANY"
#       v4_cidr_blocks = ["0.0.0.0/0"]
#       predefined_target = yandex_vpc_security_group.security_group_2.id
#   }
# }
