# Ansible Exercise

IIJ Bootcamp のAnsibleの講義用教材です。

参加者の方々は以下のコマンドを実行してこのレポジトリをローカルにダウンロードしておいて下さい。

```sh
git clone https://github.com/iij/ansible-exercise.git
```

## Overview

この教材は、ハンズオン形式でAnsibleの使い方について学べるものです。
ハンズオンを実施するにあたって、いくつかの環境整備が必要です。
下記内容に従って環境を整えましょう。

所要時間: 10min - 30min

### Index

- [Caution](#caution)
- [Requirements](#requirements)
- [Recommended](#recommended)
- [Test](#test)
- [Contact](#contact)

## Caution

このハンズオンを実施する際にはVPN接続を切っておきましょう。
VPN接続をしたままハンズオンを実施すると、正常に動作しないので注意して下さい。

プロキシ配下でこのハンズオンを実施する場合、`vars/proxy.yml`にプロキシ情報を記載してから実施して下さい。

例

```yml
---
proxy_env:
  http_proxy: http://hoge.proxy.com:8080
  https_proxy: https://198.51.100.10
```

諸事情により名前解決によるプロキシの参照ができなくなっています。
注意して下さい。

## Requirements

このハンズオンを実施する上での必須ツールのセッティング方法になります。

### Docker

このハンズオンではDockerコンテナ(以下、コンテナ)をVMに見立てて使用します。
具体的には、Ansibleの入ったコンテナとCentOS7のコンテナを使用します。
したがって、ハンズオンを実施するPCへDockerをインストールする必要があります。

インストールしていない方は[こちら](https://iij.github.io/bootcamp/init/hello-bootcamp/)を参考にしてインストールしておきましょう。

### Docker-Compose

このハンズオンではVMに見立てるコンテナをDocker-Composeを用いて起動します。
[公式サイト](https://docs.docker.com/compose/install/)を参考にインストールしておきましょう。
`Docker Desktop for Windows(Mac)`をインストールした人は既にインストールされています。

## Recommended

このハンズオンでの推奨環境として`Visual Studio Code`(以下、vscode)を指定します。
ソースコードエディタや開発環境に特にこだわりがない人は、以下の環境を整えておくとスムーズにハンズオンを進めることができます。

### VScode

vscodeとはマイクロソフトが開発したオープンソースのソースコードエディタです。
拡張機能(extension)をインストールすることで様々な言語のソースコードを効率よく編集することができます。
Stack Overflow 2019 Developer Surveyでは、vscodeが最も人気のある開発者環境ツールとしてランクインしています。

[公式サイト](https://code.visualstudio.com/)から環境に合わせてインストールしましょう。

#### Remote - Containers

vscodeにはコンテナ内でソースコードを編集できるようにする拡張機能として`Remote - Containers`というものがあります。
このハンズオンではコンテナ内に入ってファイルを編集したり、コマンドを実行したりします。
vscodeを使ってこのハンズオンを実施する場合は、この拡張機能を使用すると良いでしょう。

[こちら](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)を参考にインストールしておきましょう。

#### Japanese Language Pack

vscodeの表示言語は英語です。
日本語化したい人は以下の拡張機能をインストールすると良いでしょう。

<https://marketplace.visualstudio.com/items?itemName=MS-CEINTL.vscode-language-pack-ja>

## Test

上記の環境準備が整ったら、テストをしておきましょう。

### vscode

vscodeを開き`Ctrl(Command)+Shift+p`でコマンドパレットを開いたら、`remote containers`と入力し、
フィルターされたコマンドの中から`Open Folder in Container...`を選択します。
フォルダの選択画面が表示されたら、ダウンロードしたこのフォルダを選択し、コンテナを起動します。

しばらく待つとエディタが開きますので、`terminal(ターミナル)`を選択して下記のコマンドをコンテナ内で実行します。

```sh
ansible -m ping db1
```

以下の出力が確認できれば成功です。

```txt
db1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```

vscodeを閉じるとコンテナも停止します。

以上でテスト完了です。

### other

ダウンロードしたこのフォルダ内で、下記コマンドをシェル上で実行してコンテナを起動します。

Windows

```powershell
docker-compose -f docker-compose\docker-compose.yml up -d
```

Mac/Linux

```sh
docker-compose -f docker-compose/docker-compose.yml up -d
```

エラーなくコマンドが終了すれば成功です。
次に下記コマンドを実行し、コンテナの中に入ります。

```sh
docker exec -it docker-compose_ansible_1 bash
```

エラーなくコンテナ内に入れたら下記コマンドを実行します。

```sh
ansible -m ping db1
```

以下の出力が確認できれば成功です。

```txt
db1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```

最後に、コンテナを停止しておきましょう。
コンテナから`exit`または`Ctrl(Command)+d`で抜けてから、下記コマンドを実行します。

Windows

```powershell
docker-compose -f docker-compose\docker-compose.yml stop
```

Mac/Linux

```sh
docker-compose -f docker-compose/docker-compose.yml stop
```

以上でテスト完了です。

## Contact

上記準備でお困りの際は、周りの先輩に相談するか、Teamsやメールで`mafuyu-soga`までご相談下さい。
