# Lab1 - Terraform Project

Lab này hướng dẫn cách triển khai cơ sở hạ tầng AWS bằng cách sử dụng Terraform. Các bước dưới đây sẽ giúp bạn cài đặt và triển khai môi trường cơ bản với các dịch vụ AWS như EC2, VPC, Elastic IP, Internet Gateway, NAT Gateway, Route Tables, và Security Groups.

## Tạo môi trường

### 1. Terraform CLI
Để sử dụng Terraform, bạn cần cài đặt [Terraform CLI](https://www.terraform.io/downloads.html).

### 2. AWS CLI
Cài đặt [AWS CLI](https://aws.amazon.com/cli/) và cấu hình các thông tin truy cập AWS của bạn. Bạn cần có `Access Key`, `Secret Key`, và `Region` để Terraform có thể giao tiếp với AWS.

### 3. Clone repository
Sao chép repository về máy của bạn bằng cách sử dụng lệnh sau:
```bash
git clone https://github.com/BaCann/Terraform-CloudFormation-AWS.git

```

## Triển khai

```bash
cd 'terraform'
```

Khởi tạo Terraform:
```bash
terraform init
```

Kiểm tra tính hợp lệ của cấu hình:
```bash
terraform init

Xem trước các thay đổi:
```bash
terraform plan
```

Áp dụng thay đổi: 
```bash
terraform apply
```

## Cấu trúc dự án
```
terraform/
├── .terraform/
├── modules/
│   ├── providers/
│   └── ec2/
│       ├── internet_gateway/
│       ├── key_pair/
│       ├── nat_gateway/
│       ├── route_tables/
│       ├── security_group/
│       └── vpc/
├── terraform.lock.hcl
├── main.tf
├── outputs.tf
├── README.md
├── terraform.tfstate
├── terraform.tfstate.backup
├── variables.tf
└── .gitignore          
```


