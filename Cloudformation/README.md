
# CloudFormation Lab - NT548

## Mục tiêu
Triển khai hệ thống mạng đơn giản trên AWS sử dụng CloudFormation bao gồm:
- VPC, Public và Private Subnets
- Internet Gateway và NAT Gateway
- Security Groups cho EC2 Instances
- EC2 Public và EC2 Private

## Cấu trúc các file CloudFormation
- `vpc.yml`: Tạo VPC, Subnets, Route Tables, IGW, NAT Gateway.
- `security_groups.yml`: Tạo Security Groups cho EC2 Public và EC2 Private.
- `ec2_public.yml`: Tạo EC2 instance trong public subnet.
- `ec2_private.yml`: Tạo EC2 instance trong private subnet.

## Hướng dẫn triển khai
### 1. Tạo VPC và các thành phần mạng
```sh
aws cloudformation create-stack --stack-name vpc-stack --template-body file://vpc.yml --region ap-southeast-1
```

### 2. Tạo Security Groups
```sh
aws cloudformation create-stack --stack-name security-groups-stack --template-body file://security_groups.yml --parameters ParameterKey=MyHomeIP,ParameterValue=1.55.134.201/32 --region ap-southeast-1
```

### 3. Tạo Key Pair (chạy 1 lần duy nhất)
```sh
aws ec2 create-key-pair --key-name terraform-key-new --query 'KeyMaterial' --output text > terraform-key-new.pem
icacls terraform-key-new.pem /inheritance:r /grant:r "$($env:USERNAME):(R)"
```

### 4. Tạo EC2 Public Instance
```sh
aws cloudformation create-stack --stack-name ec2-public-stack --template-body file://ec2_public.yml --region ap-southeast-1
```

### 5. Tạo EC2 Private Instance
```sh
aws cloudformation create-stack --stack-name ec2-private-stack --template-body file://ec2_private.yml --region ap-southeast-1
```

## Kết nối
- Dùng SSH kết nối EC2 public: `ssh -i terraform-key-new.pem ec2-user@<public-ip>`
- Từ EC2 public, SSH vào EC2 private: `ssh ec2-user@<private-ip>`

## Ghi chú
- Tất cả template đều sử dụng cú pháp YAML với định dạng `AWSTemplateFormatVersion: '2010-09-09'`
- Các resource sử dụng `!ImportValue` để tái sử dụng các giá trị đã export từ stack khác.
