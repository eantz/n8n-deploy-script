# What is this?

This is a custom dockerfile to make custom n8n image that include custom certificates to connect to AWS RDS instance.

# How to Use

- Replace `{{YOUR_REGION_NAME}}` in `aws-ca.sh` with your RDS region
- make `aws-ca.sh` executable by running `chmod +x aws-ca.sh`
- execute the script by running `./aws-ca.sh`
- make sure that after running this script you will find `opt/custom-certificates` directory with some certificates in it
- build custom n8n image by running `docker build -t n8n-custom .`
- push this image to your ECR
- use the ECR as the image for your ECS deployment.

## Full ECS Deployment Guide

I wrote articles as a guide for ECS deployment. Read it here :

- [Part 1 : EC2](https://medium.com/@destiya.dian/how-to-deploy-n8n-to-aws-part-i-ec2-c3a7da3074ec)
- [Part 2 : ECS](https://medium.com/@destiya.dian/how-to-deploy-n8n-to-aws-part-i-ecs-710742460128)
