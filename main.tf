provider "exoscale" {
  version = "~> 0.10"
  key = "${var.exoscale_api_key}"
  secret = "${var.exoscale_secret_key}"
}

provider "template" {
   version = "~> 2.1"
}

data "template_file" "userdata" {
  template = "${file("userdata.sh.tmpl")}"
  vars = {
    ansible_playbook_params = "--extra-vars \"ansible_python_interpreter=/usr/bin/python3\""
    git_clone_params = ""
  }
}

resource "exoscale_compute" "autopair" {
  display_name = "${local.instance_name}"
  template = "Linux Ubuntu 18.04 LTS 64-bit"
  zone = "ch-gva-2"
  size = "Large"
  disk_size = 50
  key_pair = "${var.exoscale_ssh_keypair_name}"
  user_data = "${data.template_file.userdata.rendered}"

  security_groups = [
    "${exoscale_security_group.autopair.name}",
  ]
}

output "ip_address" {
  value = exoscale_compute.autopair.ip_address
}

output "username" {
  value = exoscale_compute.autopair.username
}
