# Microsoft DevOps Task

[![Release Version](https://img.shields.io/github/v/release/username/repo.svg)](https://github.com/username/repo/releases/latest)
[![Build Status](https://img.shields.io/travis/username/repo/master.svg)](https://travis-ci.org/username/repo)
[![Coverage Status](https://img.shields.io/coveralls/github/username/repo/master.svg)](https://coveralls.io/github/username/repo)

This project will deploy 2 services (Service A & Service B) in AKS cluster which will serve the bitcoin rate in Azure Cloud.

Extra features for Service A:
- Every **1** minute bitcoin rate will be printed into the pod logs.
- Every **10** minutes average price of the last 10 bitcoin rates will be printed as well. This functionality is working in background application level.  

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)

## Prerequisites

Before installing this project, ensure you have the following tools installed:

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [kubectl CLI](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

Tested with:
- Azure CLI: **2.58.0**
- kubectl CLI: **v1.29.1**
- Terraform: **v1.7.4**

## Installation

Installation was taken into account that clients might have more than one subscription IDs in Azure.

Therefore, use ```az account list --output table``` to get the required ID you prefer to use.


After we have the subscription ID, we can provision the project:

```
terraform init
```

```
terraform plan
```

```
terraform apply -auto-approve -var="subscription_id=YOUR-SUBSCRIPTION-ID" 
```


## Usage

It might take a few minutes until terraform provision finishes.

Once it's ready, the URL's outputs for both **Service A** & **Service B** will be prompted in the terraform console.


Enjoy!