#!/main.tf by Najite.
resource "vsphere_virtual_machine" "Test1" {
  count            = "1"
  name             = "Testing-${count.index + 1}"
  resource_pool_id = "${data.vsphere_resource_pool.Devops.id}"
  datastore_id     = "${data.vsphere_datastore.datastore1.id}"

  num_cpus = 2
  memory   = 2048
  wait_for_guest_net_timeout = 0
  wait_for_guest_net_routable = 0
  guest_id = "${data.vsphere_virtual_machine.template1.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template1.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network1.id}"
    adapter_type = "${data.vsphere_virtual_machine.template1.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "30"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template1.disks.0.eagerly_scrub}"
    thin_provisioned =  "${data.vsphere_virtual_machine.template1.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template1.id}"

    customize {
      linux_options {
        host_name = "Test-server"
        domain    = "test.comm"
      }

      network_interface {
        ipv4_address = "192.168.0.${71 + count.index}"
        ipv4_netmask = 24
      }

      ipv4_gateway = "192.168.0.1"
    }
  }
}

resource "vsphere_virtual_machine" "Test2" {
  count            = "1"
  name             = "Test-vm-${count.index + 1}"
  resource_pool_id = "${data.vsphere_resource_pool.Production.id}"
  datastore_id     = "${data.vsphere_datastore.datastore2.id}"
  num_cpus = 2
  memory   = 2048
  wait_for_guest_net_timeout = 0
  wait_for_guest_net_routable = 0
  guest_id = "${data.vsphere_virtual_machine.template2.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template2.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network2.id}"
    adapter_type = "${data.vsphere_virtual_machine.template2.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "30"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template2.disks.0.eagerly_scrub}"
    thin_provisioned =  "${data.vsphere_virtual_machine.template2.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template2.id}"

    customize {
      linux_options {
        host_name = "Test-server"
        domain    = "test.comm"
      }

      network_interface {
        ipv4_address = "192.168.0.${81 + count.index}"
        ipv4_netmask = 24
      }

      ipv4_gateway = "192.168.0.1"
    }
  }
}
