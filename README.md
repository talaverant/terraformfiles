# terraformfiles
Contains all the tf files for the deployment via gitops

# Prerequisites

You will need the following to run this succcessfully:

AWS Credentials as Administrator Access or with enough programmatic access to create the AWS resouces defined in the TF files.
An SSH public Key to be used as a deployment key for the ec2 instance

These need to be set as environment variables as follows:

ssh_public_key = The contents of the SSH public key, you should use an SSH public key that you have the private key part to log in to the EC2 Instance, for example the shared SA demo key
AWS_ACCESS_KEY_ID = The AWS Access Key ID
AWS_SECRET_ACCESS_KEY = The AWS Secret Access Key
