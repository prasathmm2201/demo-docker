#!/bin/bash

sudo apt-get update

sudo apt-get install webhook

mkdir -p etc/webhook

cd /etc/webhook

mkdir -p web_hooks.json

# enter web hook id
echo "Enter ID for webhook: "
read webhook_id
echo "Your Webhook id , $name!"

# generate secret
# openssl rand -hex 32
[
  {
    "id": "deploy-node-app",
    "execute-command": "/home/dell/deploy.sh",
    "command-working-directory": "/home/dell/deployment",
    "trigger-rule": {
      "and": [
        {
          "match": {
            "type": "payload-hash-sha1",
            "secret": "271fdf24c79ba0a4d87649663de147bb72d6c91e7b189f496495cefeef2dc6bc",
            "parameter": {
              "source": "header",
              "name": "7e92dbb63fe5813ea5d6a9684d369392603465b3"
            }
          }
        },
        {
          "match": {
            "type": "value",
            "value": "push",
            "parameter": {
              "source": "payload",
              "name": "action"
            }
          }
        }
      ]
    }
  }
]

webhook -hooks /etc/webhook/hooks.json -port 9000
