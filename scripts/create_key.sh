#!/bin/bash

#ssh-keygen -b 2048 -t rsa -f ~/.ssh/mysite_key -q -N "$SSH_PASS" 
ssh-keygen -b 2048 -t rsa -f ~/.ssh/mysite_key -q -N "" 
chmod 400 ~/.ssh/mysite_key.pem
