# Terraform Enterprise online installation with External Services (S3 + PostgreSQL) and your own certificates

With this repository you will be able to do a TFE (Terraform Enterprise) online installation on AWS with external services for storage in the form of S3 and PostgreSQL and use your own certificates

The Terraform code will do the following steps

- Create S3 buckets used for TFE
- Upload the necessary files for the TFE installation to an S3 bucket
- Create a VPC network with subnets, security groups, internet gateway
- Create a RDS PostgreSQL to be used by TFE
- create roles/profiles for the TFE instance to access S3 buckets
- Create a EC2 instance 
    - TFE online installation with the self signed certificates will be performed

# Diagram

![](diagram/diagram_external.png)  

# Prerequisites

## License
Make sure you have a TFE license available for use

Store this under the directory `files/license.rli`

## AWS
We will be using AWS. Make sure you have the following
- AWS account  
- Install AWS cli [See documentation](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

## Install terraform  
See the following documentation [How to install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## TLS certificate

Make sure you have the TLS certificates required for TFE and store them under `files/server.key` and `files/server.crt`

# How to

- Clone the repository to your local machine
```
git clone https://github.com/munnep/TFE_aws_external_provide_tls_certs.git
```
- Go to the directory
```
cd TFE_aws_external_provide_tls_certs
```
- Set your AWS credentials
```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=
```
- Store the files needed for the TFE online installation under the `./files` directory, See the notes [here](./files/README.md)
- create a file called `variables.auto.tfvars` with the following contents and your own values
```
tag_prefix               = "patrick-tfe"                        # TAG prefix for names to easily find your AWS resources
region                   = "eu-north-1"                         # Region to create the environment
vpc_cidr                 = "10.234.0.0/16"                      # subnet mask that can be used 
ami                      = "ami-09f0506c9ef0fb473"              # AMI of the Ubuntu image  
rds_password             = "Password#1"                         # password used for the RDS environment
filename_license         = "license.rli"                        # filename of your TFE license stored under ./files
dns_hostname             = "patrick-tfe3"                       # DNS hostname for the TFE
dns_zonename             = "bg.hashicorp-success.com"           # DNS zone name to be used
tfe_password             = "Password#1"                         # TFE password for the dashboard and encryption of the data
filename_server_key      = "server.key"                         # TLS certificate key used by TFE installation
filename_server_crt      = "server.crt"                         # TLS certificate used by TFE installation
public_key               = "ssh-rsa AAAAB3Nz"                   # The public key for you to connect to the server over SSH
```
- Terraform initialize
```
terraform init
```
- Terraform plan
```
terraform plan
```
- Terraform apply
```
terraform apply
```
- Terraform output should create 29 resources and show you the public dns string you can use to connect to the TFE instance
```
Apply complete! Resources: 29 added, 0 changed, 0 destroyed.

Outputs:

ssh_tfe_server = "ssh ubuntu@patrick-tfe3.bg.hashicorp-success.com"
ssh_tfe_server_ip = "ssh ubuntu@13.51.23.34"
tfe_appplication = "https://patrick-tfe3.bg.hashicorp-success.com"
tfe_dashboard = "https://patrick-tfe3.bg.hashicorp-success.com:8800"
```
- Connect to the TFE dashboard. This could take 10 minutes before fully functioning.
- Click on the open button to create your organization and workspaces

# TODO

# DONE
- [x] take the repository https://github.com/munnep/TFE_aws_external as the base
- [x] use provided certificates certificates