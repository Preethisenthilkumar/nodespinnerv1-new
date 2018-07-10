# VPN Access steps
## This file documents the steps to get access to the staging VPC through VPN

* 1) Contact steve@swarm.fund for the credentials to the VPN server
* 2) Once you have the credentials, connect to https://foghorn.paperbirds.net
* 3) Change 'Connect' to 'Login' in the Dropdown. Log in.
* 4) Download the 'user-locked-profile' file.
* 5) Download the OpenVPN client
* 6) Link Google 2FA with your account (required)
* 7) Install OpenVPN Client
* 8) Go to the OpenVPN tray item, import the user-locked profile file
* 9) Using the newly created connection profile in the tray - Connect with your user, pw, & Google 2FA

Upon successful auth, you will have established an encrypted tunnel to the private VPC environment in AWS. 
