provider "vsphere" {
  user           = "${var.user_name}"
  password       = "${var.password}"
  vsphere_server = "${var.vsphere_server}"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc1" {
  name = "Datacenter1"
}

data "vsphere_datacenter" "dc2" {
  name = "Datacenter2"
}

data "vsphere_datastore" "datastore1" {
  name          = "Homedata1"
  datacenter_id = "${data.vsphere_datacenter.dc1.id}"
}

data "vsphere_datastore" "datastore2" {
  name          = "Homedata2"
  datacenter_id = "${data.vsphere_datacenter.dc2.id}"
}

data "vsphere_network" "network1" {
  name          = "VM Network"
  datacenter_id = "${data.vsphere_datacenter.dc1.id}"
}

data "vsphere_network" "network2" {
  name          = "VM Network"
  datacenter_id = "${data.vsphere_datacenter.dc2.id}"
}

data "vsphere_virtual_machine" "template1" {
  name          = "u18tmp"
  datacenter_id = "${data.vsphere_datacenter.dc1.id}"
}

data "vsphere_virtual_machine" "template2" {
  name          = "C7tmp"
  datacenter_id = "${data.vsphere_datacenter.dc2.id}"
}

data "vsphere_resource_pool" "Devops" {
  name          = "Devops"
  datacenter_id = "${data.vsphere_datacenter.dc1.id}"
}

data "vsphere_resource_pool" "Production" {
  name          = "Production"
  datacenter_id = "${data.vsphere_datacenter.dc2.id}"
}
