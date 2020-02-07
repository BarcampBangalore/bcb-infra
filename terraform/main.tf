
# Configure the DigitalOcean Provider
variable "do_token" {

}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "bcbdo" {
  name       = "bcb-2020"
  public_key = file("/home/sathyabhat/.ssh/id_rsa_do.pub")
}


resource "digitalocean_droplet" "bcbdo" {
  image    = "ubuntu-18-04-x64"
  name     = "bcb-general"
  region   = "blr1"
  size     = "s-1vcpu-1gb"
  tags     = ["bcb", "general", "webserver", "nginx", "wordpress"]
  ssh_keys = [digitalocean_ssh_key.bcbdo.fingerprint]
}

output "ipv4_address" {
  value = [digitalocean_droplet.bcbdo.ipv4_address, digitalocean_droplet.bcbdo.name]
}


