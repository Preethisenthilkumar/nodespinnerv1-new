# Cloudformation Setup in AWS Stage environment


## Pre-requisites
* Get AWS login credentials from steve@swarm.fund
* Get VPN credentials & setup from steve@swarm.fund

## Launch stack
* Login to https://376672382268.signin.aws.amazon.com/console
* Open https://eu-central-1.console.aws.amazon.com/cloudformation/home?region=eu-central-1#/stacks/create/review?templateURL=https://s3-eu-central-1.amazonaws.com/ops-swarm/node-cf-sh.yaml&stackName=SwarmNodeTester&param_InstanceType=t2.small

## Connect to the instance
* Open https://eu-central-1.console.aws.amazon.com/ec2/v2/home?region=eu-central-1#Instances:sort=desc:launchTime
  * Get the private IP for instance 'SwarmNodeTester'

* Make sure you have established a connection to the VPN

* SSH to the instance
  * ssh -i {keypair}.pem ubuntu@{private ip}
  
## Verify install
* (Note: Takes about 10 minutes for scripts to complete)
* Check the output of the Cloudformation cfn-init scripts. 

    * cat /var/log/cfn-init.log
     * Installation successful when output: 
    
```javascript
    {
   "info" : {
      "UNSAFE_QUORUM" : "UNSAFE QUORUM ALLOWED",
      "base_exchange_name" : "Swarm",
      "build" : "0.8.0-17-g4c996cb-dirty",
      "commission_account_id" : "GAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHV4",
      "ledger" : {
         "age" : 1528313143,
         "closeTime" : 0,
         "hash" : "a6f1b874f04ef54337cfd160bd2129fcabccba176e5d3679de7a78ebb185a77a",
         "num" : 2
      },
      "ledger_version" : 0,
      "master_account_id" : "GD7AHJHCDSQI6LVMEJEE2FTNCA2LJQZ4R64GUI3PWANSVEO4GEOWB636",
      "network" : "SUN Staging Network ; December 2017",
      "numPeers" : 0,
      "operational_account_id" : "GABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABVCX",
      "protocol_version" : 12,
      "state" : "Joining SCP",
      "tx_expiration_period" : 601200,
      "withdrawal_details_max_length" : 1000
        }
      }
```
      
      2018-06-06 19:25:43,169 [DEBUG] No services specified
      2018-06-06 19:25:43,172 [INFO] ConfigSets completed
      2018-06-06 19:25:43,172 [DEBUG] Not clearing reboot trigger as scheduling support is not available
      2018-06-06 19:25:43,172 [INFO] -----------------------Build complete-----------------------

    
    
  * Manual check 'curl http://localhost:8080/info'
    
 
