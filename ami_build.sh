#!/bin/bash
ARTIFACT=`/opt/packer/packer build -var packagename=restapi-2.1.0.deb -machine-readable packer_build/packer-build.json | awk -F, '$0 ~/artifact,0,id/ {print $6}'`
AMI_ID=`echo $ARTIFACT |cut -d ':' -f2`
echo 'variable "AMI_ID" { default = "'${AMI_ID}'" }' > amivar.tf
