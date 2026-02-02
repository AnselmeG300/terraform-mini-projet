# AWS Terraform Mini Project

This Terraform project provisions a complete AWS infrastructure with EC2 instances, Elastic IP, EBS volumes, and security groups using a modular architecture.

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Modules](#modules)
- [Usage](#usage)
- [Variables](#variables)
- [Outputs](#outputs)
- [Contributing](#contributing)

## 🎯 Overview

This project demonstrates Infrastructure as Code (IaC) best practices by deploying AWS resources using Terraform modules. The infrastructure includes:

- **EC2 Instance**: Virtual machine with customizable instance type
- **Elastic IP (EIP)**: Static public IP address attached to the EC2 instance
- **EBS Volume**: Additional storage volume attached to the EC2 instance
- **Security Group**: Network access control rules

## 🏗️ Architecture

The project uses a modular approach with the following components:

```
EC2 Instance ← Security Group
    ↓
Elastic IP (attached)
    ↓
EBS Volume (attached as /dev/sdh)
```

## ✅ Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- AWS CLI configured with appropriate credentials
- An AWS account with appropriate permissions

## 📁 Project Structure

```
terraform-mini-projet/
├── main.tf              # Main configuration file
├── provider.tf          # AWS provider configuration
├── variables.tf         # Variable definitions
├── terraform.tfvars     # Variable values
├── README.md           # This file
└── modules/
    ├── ec2/            # EC2 instance module
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── eip/            # Elastic IP module
    │   ├── main.tf
    │   └── outputs.tf
    ├── ebs/            # EBS volume module
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    └── sg/             # Security group module
        ├── main.tf
        ├── ouputs.tf
        └── variables.tf
```

## 🔧 Modules

### EC2 Module (`modules/ec2`)
Provisions an EC2 instance with configurable instance type and tags.

### EIP Module (`modules/eip`)
Creates an Elastic IP address for static public IP assignment.

### EBS Module (`modules/ebs`)
Creates an EBS volume with configurable size and availability zone.

### Security Group Module (`modules/sg`)
Configures network security rules for the EC2 instance.

## 🚀 Usage

### 1. Clone the repository

```bash
git clone <repository-url>
cd terraform-mini-projet
```

### 2. Configure your variables

Edit `terraform.tfvars` to customize your deployment:

```hcl
region        = "us-east-1"
AZ            = "us-east-1b"
instance_type = "t2.micro"
size          = 100
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Plan the deployment

```bash
terraform plan
```

### 5. Apply the configuration

```bash
terraform apply
```

Type `yes` when prompted to confirm the deployment.

### 6. Destroy the infrastructure (when needed)

```bash
terraform destroy
```

## 📊 Variables

| Variable       | Type   | Default      | Description                        |
|---------------|--------|--------------|-----------------------------------|
| `region`      | string | `us-east-1`  | AWS region for resources          |
| `AZ`          | string | `us-east-1b` | Availability zone                 |
| `instance_type` | string | `t2.micro`   | EC2 instance type                |
| `size`        | number | `100`        | EBS volume size in GB             |

## 📤 Outputs

The modules provide the following outputs:

- **EC2 Module**: Instance ID, public IP, private IP
- **EIP Module**: Elastic IP allocation ID and public IP
- **EBS Module**: Volume ID
- **Security Group Module**: Security group ID and name

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Create a Pull Request

## 📝 Notes

- Ensure your AWS credentials are properly configured
- Review AWS costs before deploying resources
- Always run `terraform plan` before applying changes
- Store your Terraform state file securely (consider using remote state)

## 🔒 Security Warning

⚠️ **Important**: Never commit AWS credentials to version control. Use environment variables, AWS CLI profiles, or IAM roles instead.

## 📄 License

This project is licensed under the MIT License.

---

**Author**: Anselme  
**Project**: Terraform Mini Project
