# Vagrant files to create a Rancher v2.0 server and host environment for local development

## Requirements
* Vagrant (with Virtualbox plugin)
* Virtualbox

## Tested using the following desktop deployment environments
* Ubuntu 17.04 (Desktop)
* macOS High Sierra 10.13 (Desktop)

## Tested using the following Rancher, Vagrant and Docker versions
* Rancher Server v2.0 (Preview)
* Rancher Agent v2.0-alpha4
* CentOS 7 (Vagrantbox)
* Docker-CE v17.06.0

## Usage Instructions

1. Clone the repo
2. Run `sudo vagrant plugin install vagrant-vbguest` (to ensure host/guest VBox additions are matched)
3. Run `vagrant up` from within /server
4. After the instance is launched wait a few minutes until the Rancher server is up
5. Access the Rancher sever at http://192.168.50.50:8080
6. Go to infrastructure > hosts > add host
7. Accept the default host reg URL
8. Copy the (long) host reg string
9. Update the entry in host.sh with the new token (i.e `08E7A124D98AB02233F1:1483142400000:rBrLKo9bzo1qSZfeu1I3UrsXc8`)
10. Run `vagrant up` from within /host
11. Check the new host has launched and registered in the Rancher server

**Note 1:** To persist the environment prior to PC or laptop suspend and/or shutdown/reboot:

Either..

- Pause both the server and host nodes from within the Virtualbox UI

Or..

- (Recommended) Issue a `vagrant suspend` for both /server and /host, followed by a `vagrant resume`.

**Note 2:** Guest to Host time sync:

To keep the guest time in sync with the host after a suspend/resume, ensure that Virtualbox Guest Additions are installed and update the locale string for `/usr/share/zoneinfo` in the Vagrantfile(s) for both server and host (This is currently set to `/Europe/London`).
