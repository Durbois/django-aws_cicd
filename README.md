# Tutorial project for Django - AWS CI-CD CodePipeline workflow

GitHub branch -> AWS CodePipeline -> AWS CodeDeploy -> AWS Elastic Compute Cloud

## Original How-To Guide
EC2CodeDeployRole
CodeDeployRole
AWSCodePipelineServiceRole-eu-central-1-aws-cicd-pipeline
AWSCodePipelineServiceRole-eu-central-1-aws-eks-cicd
codebuild-aws-eks-cicd-service-role
CodeBuildKubectlRole

[AWS CI-CD for your Django app with AWS CodePipeline](https://medium.com/clairvoyantblog/aws-ci-cd-for-your-django-app-with-aws-codepipeline-aafec23f9e55)

https://yonghoabdurahim.medium.com/deploy-a-sample-application-onto-eks-cluster-utilizing-aws-ci-cd-code-pipeline-codecommit-aws-81b1b2ea5cde --> Step:5

ToDo:
- Build Dockerfile (done)
- Image to the registry (done)
- Create K8s Applications Config Files (Create a cluster with terraform and push files with helm and argocd)
- Deploy App on K8s