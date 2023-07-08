# Ansible Hands-On Materials

## Overview

IIJ Bootcamp のAnsibleの講義用教材です。
IIJ Bootcamp における Ansibleの項ではこちらで示す環境を前提に演習を行うため、参加者の方々は以下の作業を実施し、必要な環境を揃えてください。

## Requirements

このハンズオンを実施する上では、以下のセットアップが前提となっています

- git
- Docker
- Docker Compose

## Caution

このハンズオンの実行では、以下のような問題点があります。
演習の為に敢えて設定していますが、本来は好ましい設定ではないため、本番環境では適切な設定を行ってください

- rootユーザによるsshログインを許可している
- rootパスワードが安直な文字列になっている

## TO DO

それでは演習に必要な環境のセットアップを行います。
以下の一連の作業を実施すると図に示したような環境が構築されます。

1. Hands-On Materialのダウンロード
   ```sh
   git clone https://github.com/iij/ansible-exercise.git
   ```

2. コンテナインフラ環境のセットアップ

   ディレクトリの移動
   ```bash
    cd ansible-exercise
   ```

   コンテナのセットアップ
   ```bash
    docker compose up -d
   ```

3. コンソール端末における最低限のパッケージインストール

   コンテナログイン
   ```bash
    docker exec -it iijbootcamp_ansible_console bash
   ```
   ping コマンドを含むパッケージのインストール
   ```bash
    dnf install -y iputils
   ```
   ip コマンドを含むパッケージのインストール
   ```bash
    dnf install -y iproute
   ```
   ssh クライアントのインストール
   ```bash
    dnf install -y openssh-clients
   ```
   コンテナからのログアウト
   ```bash
    exit
   ```

4. 操作される側の端末へのopenssh-server インストール
   コンテナログイン
   ```bash
    docker exec -it <対象のコンテナ> bash
   ```
   ssh server のインストール
   ```bash
    dnf install -y openssh-server
   ```
   root のパスワードログイン許可
   ```bash
   echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
   ```
   ssh server の起動
   ```bash
   systemctl enable sshd
   systemctl start sshd
   ```
   root passwordの設定(ansible)とする
   ```bash
   passwd
   ```

- <対象のコンテナ>は以下の通り
  -  iijbootcamp_ansible_host00
  -  iijbootcamp_ansible_host01
  -  iijbootcamp_ansible_web00
  -  iijbootcamp_ansible_app00

5. 動作確認
   ```bash
    docker exec -it iijbootcamp_ansible_console bash
   ```
   ```bash
    ping <対象のコンテナ>
   ```
   ```bash
    ssh <対象のコンテナ>
   ```

- <対象のコンテナ>は以下の通り
  -  iijbootcamp_ansible_host00
  -  iijbootcamp_ansible_host01
  -  iijbootcamp_ansible_web00
  -  iijbootcamp_ansible_app00

## Recommended

このハンズオンでの推奨環境として`Visual Studio Code`(以下、vscode)を指定します。
ソースコードエディタや開発環境に特にこだわりがない人は、以下の環境を整えておくとスムーズにハンズオンを進めることができます。

### VScode + Ansible Extension

vscodeとはマイクロソフトが開発したオープンソースのソースコードエディタです。
拡張機能(extension)をインストールすることで様々な言語のソースコードを効率よく編集することができます。
Stack Overflow 2019 Developer Surveyでは、vscodeが最も人気のある開発者環境ツールとしてランクインしています。

[公式サイト](https://code.visualstudio.com/)から環境に合わせてインストールしましょう。

#### Ansible Extension

vscodeにはRed Hat社よりAnsibleのplaybookを書く為に公式のExtensionが提供されています。
補完や構文チェックなどの機能が備わっているため、可能な限り使うようにしましょう

[公式サイト](https://marketplace.visualstudio.com/items?itemName=redhat.ansible)
