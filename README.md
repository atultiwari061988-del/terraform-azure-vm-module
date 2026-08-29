# 🚀 Terraform Azure VM Module – Multi-VM Deployment

A **modular and reusable Terraform solution** for deploying multiple **Azure Virtual Machines** using **Terraform Modules, `for_each`, and Map variables**.

This project demonstrates how Terraform can be used to provision scalable and consistent Azure infrastructure without duplicating resource blocks.

---

## 📌 Project Overview

This project provisions multiple Azure Virtual Machines dynamically using a **reusable Terraform VM module**.

Instead of creating separate Terraform resource blocks for each VM, the project uses:

* 🧩 **Terraform Modules**
* 🔁 **`for_each` Meta-Argument**
* 🗺️ **Map Variables**
* 🏗️ **Infrastructure as Code (IaC)**
* ☁️ **Microsoft Azure**
* ♻️ **Reusable & Scalable Infrastructure**

The VM configuration is provided through a map, and Terraform automatically creates the required number of VMs based on the map entries.

---

## 🏗️ Architecture

```text
                    ┌──────────────────────┐
                    │     Root Module      │
                    │                      │
                    │  VM Configuration    │
                    │       Map            │
                    └──────────┬───────────┘
                               │
                               │ for_each
                               ▼
                    ┌──────────────────────┐
                    │      VM Module       │
                    │                      │
                    │  Reusable Terraform  │
                    │      Module          │
                    └──────────┬───────────┘
                               │
              ┌────────────────┼────────────────┐
              ▼                ▼                ▼
        ┌───────────┐    ┌───────────┐    ┌───────────┐
        │   VM-01   │    │   VM-02   │    │   VM-03   │
        │           │    │           │    │           │
        │  Azure VM │    │  Azure VM │    │  Azure VM │
        └───────────┘    └───────────┘    └───────────┘
```

---

## 🔥 Key Terraform Concept

The main concept demonstrated in this project is using **`for_each` with a Map** to dynamically create multiple VMs.

Example:

```hcl
variable "linux_vms" {
  type = map(object({
    vm_size        = string
    admin_username = string
  }))
}
```

Example configuration:

```hcl
linux_vms = {
  vm01 = {
    vm_size        = "Standard_B2s"
    admin_username = "azureadmin"
  }

  vm02 = {
    vm_size        = "Standard_B2s"
    admin_username = "azureadmin"
  }

  vm03 = {
    vm_size        = "Standard_B2s"
    admin_username = "azureadmin"
  }
}
```

The module can then be called dynamically:

```hcl
module "linux_vm" {
  source = "./modules/linux-vm"

  for_each = var.linux_vms

  vm_name        = each.key
  vm_size        = each.value.vm_size
  admin_username = each.value.admin_username
}
```

### 💡 Why `for_each`?

With `for_each`, adding another VM does not require creating another resource block.

Simply add another entry to the map:

```hcl
vm04 = {
  vm_size        = "Standard_B2s"
  admin_username = "azureadmin"
}
```

Terraform automatically creates the new VM.

**Less code → More automation → Better scalability. 🚀**

---

## 📂 Project Structure

```text
terraform-azure-vm-module/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── README.md
│
└── modules/
    └── linux-vm/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## ⚙️ Technologies Used

| Technology        | Purpose                       |
| ----------------- | ----------------------------- |
| Terraform         | Infrastructure as Code        |
| Microsoft Azure   | Cloud Infrastructure          |
| AzureRM Provider  | Terraform-Azure Integration   |
| Terraform Modules | Reusable Infrastructure       |
| `for_each`        | Dynamic Resource Creation     |
| Map Variables     | VM Configuration              |
| PowerShell        | Command Line / Administration |
| Git & GitHub      | Version Control               |

---

## 🚀 Deployment

### 1. Clone the Repository

```bash
git clone https://github.com/atultiwari061988-del/terraform-azure-vm-module.git
```

### 2. Navigate to the Project

```bash
cd terraform-azure-vm-module
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate Configuration

```bash
terraform validate
```

### 5. Review Execution Plan

```bash
terraform plan
```

### 6. Deploy Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

---

## 🧹 Destroy Infrastructure

To remove the resources created by Terraform:

```bash
terraform destroy
```

---

## 🎯 What This Project Demonstrates

This project demonstrates practical knowledge of:

* ✅ Terraform Infrastructure as Code
* ✅ Terraform Module Design
* ✅ Reusable Terraform Modules
* ✅ `for_each` Meta-Argument
* ✅ Map and Object Variables
* ✅ `each.key` and `each.value`
* ✅ Dynamic VM Provisioning
* ✅ Azure VM Deployment
* ✅ Terraform Variable Management
* ✅ Terraform Outputs
* ✅ Scalable Infrastructure Design
* ✅ Git & GitHub Version Control

---

## 💡 Why Use Modules + `for_each`?

A traditional approach may require multiple resource blocks:

```text
VM01 → Resource Block
VM02 → Resource Block
VM03 → Resource Block
VM04 → Resource Block
```

With a reusable module and `for_each`:

```text
             VM Configuration Map
                     │
                     ▼
                  for_each
                     │
                     ▼
              Reusable VM Module
                     │
        ┌────────────┼────────────┐
        ▼            ▼            ▼
       VM01         VM02         VM03
```

This approach makes the infrastructure:

**Reusable • Scalable • Maintainable • Consistent • Automated**

---

## 🏆 Key Learning

> **"Write the infrastructure once, make it reusable, and scale it with data."**

This project showcases how Terraform modules combined with `for_each` and map variables can transform repetitive infrastructure code into a **clean, scalable, and maintainable Infrastructure as Code solution.**

---

## 👨‍💻 Author

**Atul Tiwari**

Azure | Terraform | DevOps | Infrastructure as Code | Cloud Automation

---

⭐ If you find this project useful, feel free to explore the repository and learn from the implementation.
