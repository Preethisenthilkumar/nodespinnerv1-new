# Setup in AWS Stage environment

## Launch new instance


* Get AWS login credentials from steve@swarm.fund
* Get VPN credentials & setup from steve@swarm.fund

* Login to https://376672382268.signin.aws.amazon.com/console

* Go to https://eu-central-1.console.aws.amazon.com/ec2/v2/home?region=eu-central-1
Launch Instance

* Select: 'Ubuntu Server 16.04 LTS (HVM), SSD Volume Type - ami-c7e0c82c'
* Select: t2.small

* In Configure Instance details leave all parameters default values, except these: 

  * Network: vpc-8aa10de1 | STAGE.VPC
  * Subnet: subnet-0705a97a | STAGE.Apps.Subnet-b
  * IAM Role: Stage.AppServer.Role


* Next: Add Storage..
* Next: Add Tags
  * Add Tag
    * Key: Name
    * Value: (some name for the server)
    
* Next: Configure Security Group
  * Select an Existing Security Group
    * Check: sg-cfb347a2 default
    * Check: sg-09913564 Stage.Access.from.VPN
  
* Review Instance Launch... Launch
* Create New Key pair
  * Download Key Pair

* Launch Instances


## Install the node on new instance

* See https://eu-central-1.console.aws.amazon.com/ec2/v2/home?region=eu-central-1#Instances:sort=desc:launchTime
  * Get the private IP of the instance you just launched 

* Make sure you have established a connection to the VPN

* SSH to the instance
  * ssh -i {keypair}.pem ubuntu@{private ip}

* sudo apt-get update
* sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common 
* sudo apt install awscli
* aws configure
  * Access Key: {blank}
  * Secret Key: {blank}
  * Region: eu-central-1
  * Output: {blank}
 
* git clone https://github.com/swarmfund/nodespinnerv1.git
  * (https://github.com/settings/tokens to setup a personal access token)

* cd nodespinnerv1
* aws s3 cp s3://ops-swarm/manual-install.sh .

* chmod +x manual-install.sh
* sudo ./manual-install.sh











