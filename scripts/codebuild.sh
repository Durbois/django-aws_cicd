#!/usr/bin/env bash
TRUST="{   \"Version\": \"2012-10-17\",   \"Statement\": [     {       \"Effect\": \"Allow\",       \"Principal\": {         \"Service\": \"codebuild.amazonaws.com\"       },       \"Action\": \"sts:AssumeRole\"     }   ] }"
echo '{ "Version": "2012-10-17", "Statement": [ { "Effect": "Allow", "Action": "eks:Describe*", "Resource": "*" } ] }' > /tmp/iam-role-policy
aws iam create-role --role-name CodeBuildKubectlRole --assume-role-policy-document "$TRUST" --output text --query 'Role.Arn'
aws iam put-role-policy --role-name CodeBuildKubectlRole --policy-name eks-describe --policy-document file:///tmp/iam-role-policy
aws iam attach-role-policy --role-name CodeBuildKubectlRole --policy-arn arn:aws:iam::aws:policy/CloudWatchLogsFullAccess
aws iam attach-role-policy --role-name CodeBuildKubectlRole --policy-arn arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess
aws iam attach-role-policy --role-name CodeBuildKubectlRole --policy-arn arn:aws:iam::aws:policy/AWSCodeCommitFullAccess
aws iam attach-role-policy --role-name CodeBuildKubectlRole --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
aws iam attach-role-policy --role-name CodeBuildKubectlRole --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess

eksctl create iamidentitymapping --cluster eks-managed-node-group --region=eu-central-1 --arn arn:aws:iam::419755718183:role/CodeBuildKubectlRole --group system:masters --username CodeBuildKubectlRole