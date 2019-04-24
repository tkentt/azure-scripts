#!/bin/bash
## Script to create vm

## Variables
vm_name=$1
resource_group=$2
location=$3

## Validate Variables
if [ -z "$vm_name" ]; then
  echo "You must provide a name for your VM"
fi

if [ -z "$resource_group" ]; then
  echo "You must provide a resource group"
fi

if [ -z "$location" ]; then
  echo "You must provide a location"
fi

## Check for resource group. If resource group doesn't exist, create it
echo "Validating resource group"
if [ "$(az group exists --name $resource_group)" = "false" ]; then
  echo "Resource group does not exist. Creating..."
  az group create -n $resource_group -l $location
fi
