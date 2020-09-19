## Ansible playbook to modify Reverse Proxy OVA configuration

### Usage

1. Tweak configuration parameters in `config_vars.yaml` as needed.

2. If you want to replace the certificate, move it to the project working directory folder and rename it to full.pem

3. Install ansible

4. Run `ansible-playbook alterconf.yaml -Kk` then type the password for the system user twice
You can replace `-Kk` with `--private key path/to/ssh/private/key` if you are using an ssh key instead of passwords

**PS:** If the configuration is not already applied, the playbook should recreate the docker containers, so make sure everything is working fine after the deployment

