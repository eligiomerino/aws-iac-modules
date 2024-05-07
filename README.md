# Terraform modules to be used as IaC layers
By [@EligioMerino](https://github.com/eligiomerino), 2024.

This is a Terraform Modules project that can be used to build high-availability AWS infrastructure per service layer, such as:

* Network (VPC): It builds an HA VPC within a region with 2 AZs, with 1 public subnets per AZ and 1 private subnet per AZ.
* Compute (EC2): (to-do) IAM SSM role, Linux ARM64 VMs, ASG, ALB.
* Object storage (S3): (to-do)
* Relational database (MySQL): (to-do)
* Content distribution (CloudFront): (to-do)
* Containers (ECS/Fargate): (to-do)
* Serverless computing (Lambda functions): (to-do)
* Serverless relational database (Aurora): (to-do)
* Serverless non-relational database (DynamoDB): (to do)
* Monitoring and alerting (CloudWatch): (to-do)

Every single hands-on project require to manually build a bunch of services, and the problem with that is to rember all of those services in sequence in order to delete them in reverse order. For instance, to have a NAT Gateway deployed in a public subnet does require to pull an elastic (public) IP to have it assigned to the NAT Gateway. But when the NAT Gateway gets manually deleted it is easy to forget to also release (delete) the asssigned EIP. I built this project in order to use Terraform Modules that could simplify the backbone building (AWS infrastructure) so it can be easier to focus on the hands-on for a lab practice or for a real architecture implementation.
