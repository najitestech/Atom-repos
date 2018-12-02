# Create a new Ubuntu instance
resource "google_compute_instance" "ubuntu" {
   count = "1"
   name = "cgp-machine1"
   machine_type = "f1-micro"
   zone = "us-east1-b"

   boot_disk {
      initialize_params {
      image = "ubuntu-1604-lts"
   }
}

network_interface {
   network = "default"
   access_config {}
}

metadata {
    update_script = "${file("${path.module}/scripts.sh")}"
}

metadata_startup_script = "echo hi > /root/gcp-lab/test.txt"

service_account {
   scopes = ["userinfo-email", "compute-ro", "storage-ro"]
   }
}

#Create a new CentOS instance
resource "google_compute_instance" "Centos" {
  count = "1"
  name         = "gcp-machine2"
  machine_type = "f1-micro"
  zone         = "us-east1-c"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
