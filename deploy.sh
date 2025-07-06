#!/bin/bash

# Replace these values
CLUSTER_NAME="jenkins-cluster"
SERVICE_NAME="flask-app"

# Force ECS to redeploy latest image
aws ecs update-service \
  --cluster $CLUSTER_NAME \
  --service $SERVICE_NAME \
  --force-new-deployment
