provider "vsphere" {
  user           = "${var.user_name}"
  password       = "${var.password}"
  vsphere_server = "${var.vsphere_server}"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Datacenter2"
}

data "vsphere_datastore" "datastore" {
  name          = "Homedata2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "U18tmp"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "Devops" {
  name          = "Devops"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "Production" {
  name          = "Production"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
