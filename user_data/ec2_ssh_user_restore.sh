#cloud-config
#
# User data file you can use to fix up ssh login to EC2 instance.
# Step 1 - create new ssh keys from the device you are logging in from (ie ssh-keygen cmd or via AWS Mgmt console).
# Step 2 - copy public key (ie id_rsa.pub or whatever you have named it using ssh-keygen cmd).
# Step 3 - replace 'username' below with your desired user that you want created.
# Step 4 - replace 'ssh-rsa mypublickey' with the contents of your public key copied from Step 2.
# Step 5 - stop ec2 instance, copy paste this script into the User data textbox.
# Step 6 - start ec2 instance and login with your newly created user.
# Step 7 - delete the script from user data so it doesn't repeat this on subsequent reboots.
#
Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [users-groups, once]
users:
  - name: username
    ssh-authorized-keys: 
    - ssh-rsa mypublickey
