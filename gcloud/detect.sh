#!/bin/sh

if [ -s /opt/google-cloud-sdk/bin/gcloud ]
then
  echo true
else
  echo false
fi
