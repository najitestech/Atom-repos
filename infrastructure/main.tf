#!/main.tf by Najite.
resource "vsphere_virtual_machine" "Test" {
  count            = "1"
  name             = "Testing-${count.index + 1}"
  resource_pool_id = "${data.vsphere_resource_pool.Devops.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = 2048
  wait_for_guest_net_timeout = 0
  wait_for_guest_net_routable = 0
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "30"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "Test-server"
        domain    = "test.comm"
      }

      network_interface {
        ipv4_address = "192.168.0.${106 + count.index}"
        ipv4_netmask = 24
      }

      ipv4_gateway = "192.168.0.1"
    }
  }
}
