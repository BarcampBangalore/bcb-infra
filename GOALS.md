### Goals?

- We need a new VM provisioned
- We need some software installed
- Automate all things!

### Infra

- Use Terraform to spin up a new droplet
- Use Ansible to provision:
    - nginx
    - php-fpm
    - wordpress
    - node exporter
    - misc stuff: vim, tmux, git, 
    - pre-install our configs
    