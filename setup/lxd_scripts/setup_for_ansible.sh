#!/bin/bash

BOOTCAMP_ANSIBLE_KEY='<your-key>'

# ユーザ作成（ホームディレクトリ作成、sudoグループ追加）
sudo adduser ansible-deploy
sudo usermod -aG sudo ansible-deploy

# sudo パスワード不要にする
echo 'ansible-deploy ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/ansible-deploy
sudo chmod 440 /etc/sudoers.d/ansible-deploy

# 公開鍵登録
sudo mkdir -p /home/ansible-deploy/.ssh
sudo chmod 700 /home/ansible-deploy/.ssh
echo $KEY | sudo tee /home/ansible-deploy/.ssh/authorized_keys

sudo chmod 600 /home/ansible-deploy/.ssh/authorized_keys
sudo chown -R ansible-deploy:ansible-deploy /home/ansible-deploy/.ssh
