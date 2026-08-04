# Ansible Hands-On Materials

## Overview

このリポジトリは、IIJ Bootcamp の講義「[Ansible による IT 自動化](https://iij.github.io/bootcamp/cicd_infra/ansible/)」講義用教材です。

この講義では本リポジトリを使用して構築する環境を前提に演習を行うため、参加者の方々は以下の作業を実施し、必要な環境を揃えてください。

## Requirements

ハンズオンを実施する上では、以下のセットアップが前提となっています

- Ubuntu 24.04
  - IIJ 社内における Bootcamp 実施時の推奨環境が Ubuntu となっているため
  - これ以外での環境でも実施可能ですが、`/setup`下のスクリプトについては書き換えが必要です
- git
  - 導入されていない場合は事前に `sudo apt install git` などでインストールしておいてください
- lxd
  - Ansible 適用先ターゲットノードとして使用します

## Caution

<!-- TODO: この項目は不要かも -->
このハンズオンの実行では、以下のような問題点があります。
演習の為に敢えて設定していますが、本来は好ましい設定ではないため、本番環境では適切な設定を行ってください

- rootユーザによるsshログインを許可している
- rootパスワードが安直な文字列になっている

## ToDo

それでは演習に必要な環境のセットアップを行います。
以下の一連の作業を実施すると、下記の図に示したような環境が構築されます。

![alt text](images/env-image.png)

1. Hands-On Materialのダウンロード
   ```sh
   $ git clone https://github.com/iij/ansible-exercise.git
   ```

1. LXD コンテナインフラ環境のセットアップ
   ```bash
   ## ディレクトリの移動
   $ cd ansible-exercise
    ## LXD のインストールとセットアップ
   $ ./setup/setup_lxd.sh
    ## LXD でのターゲットノードのセットアップ
   $ ./setup/setup_target_nodes.sh
   ```

1. コンテナ動作確認
   ```bash
   $ sudo lxc exec host00 -- bash
   ## root@host00:~# というプロンプトが表示されればOK
   ## Ctrl + C で抜ける
   ```
   ```bash
   $ ping 10.200.10.100
   ## 出力例
   PING 10.200.10.101 (10.200.10.101) 56(84) bytes of data.
   64 bytes from 10.200.10.101: icmp_seq=1 ttl=64 time=0.039 ms
   64 bytes from 10.200.10.101: icmp_seq=2 ttl=64 time=0.053 ms
   ^C
   ```

## Recommended

このハンズオンでの推奨環境として`Visual Studio Code`(以下、VS Code)を指定します。
ソースコードエディタや開発環境に特にこだわりがない人は、以下の環境を整えておくとスムーズにハンズオンを進めることができます。

### VS Code

VS Code とはマイクロソフトが開発したオープンソースのソースコードエディタです。
拡張機能(extension)をインストールすることで様々な言語のソースコードを効率よく編集することができます。

[公式サイト](https://code.visualstudio.com/)から環境に合わせてインストールしましょう。

#### Ansible Extension

VS Code にはRed Hat社よりAnsibleのplaybookを書く為に公式の Extension が提供されています。
補完や構文チェックなどの機能が備わっているため、使用することをおすすめします。

[公式サイト](https://marketplace.visualstudio.com/items?itemName=redhat.ansible)
