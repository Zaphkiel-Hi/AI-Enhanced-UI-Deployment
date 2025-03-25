# EKS Cluster and Node Group Setup

This project automates the creation and management of an Amazon EKS (Elastic Kubernetes Service) Cluster with Terraform.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Prerequisites](#prerequisites)
3. [Setup](#setup)
4. [Terraform Commands](#terraform-commands)
5. [Troubleshooting](#troubleshooting)

## Project Overview

This repository contains the Terraform scripts to create and manage an Amazon EKS Cluster along with Node Groups. The setup includes defining IAM roles, EKS Cluster, Node Group configuration, and security groups for the Kubernetes infrastructure. 

## Prerequisites

Before you begin, ensure that you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (v0.13 or above)
- [AWS CLI](https://aws.amazon.com/cli/) (configured with access keys)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) (optional, for interacting with the Kubernetes cluster)
- AWS account with appropriate permissions to create EKS, IAM roles, and EC2 instances.
