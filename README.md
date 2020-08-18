### BCB Infra

This repo holds the code that is used to setup [BCB website](https://barcampbangalore.com). BCB runs on DigitalOcean droplet, provisioned by terraform. The code for this is fairly simple and is available in [terraform](/terraform) directory.
Software management and configuration is done via Ansible and the code is present in [ansible](/ansible) directory.

### What does Ansible do?

Among other things, Ansible

- installs some essentials like git, vim, cerbot etc
- installs and configures node exporter for metrics

### To do

- Use Ansible to provision:
    - [ ] misc stuff: vim, tmux, git
    - [ ] docker, traefik
    - [ ] node exporter, cadvisor
    - [ ] pull down our git and compose configs

### How to run this?

Export DigitalOcean token with 

    export DIGITALOCEAN_TOKEN=<your DigitalOcean token>

Run Terraform to provision the Droplet

    cd terraform
    terraform apply -var do_token=${DIGITALOCEAN_TOKEN} 

Run Ansible


    cd ansible
    ansible-playbook -vv -i "<IP from DigitalOcean," setup_bcb.yml

