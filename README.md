## Ansible Hands-On 講義資料

### 概要

本資料は IIJ Bootcamp Ansible 講義 の演習用教材です。
講義におけるハンズオンは、本資料で示す環境を前提に進めます。
参加者の方は以下の手順に従って環境を準備してください。


### 必要環境

以下のソフトウェアがセットアップされていることが前提条件です。

- git
- Docker
- Docker Compose


### 注意事項

このハンズオン環境は演習目的のため、本来は推奨されない設定が含まれています。
本番環境で利用する際には必ず適切なセキュリティ設定を行ってください。

- root ユーザによる SSH ログインを許可 している
- root パスワードが 簡易な文字列 になっている


### セットアップ手順

以下の手順を実行すると、図示されたコンテナ環境が構築されます。
![構成図](./docs/images/network.drawio.png)


#### Hands-On Material のダウンロード

```bash
git clone https://github.com/iij/ansible-exercise.git
```

#### コンテナ環境のセットアップ

```bash
cd ansible-exercise
docker compose up -d
```

#### コンソール端末での基本セットアップ

コンソールコンテナにログインします。

```bash
docker exec -it iijbootcamp_ansible_console bash
```

#### 動作確認

```bash
docker exec -it iijbootcamp_ansible_console bash
```

対象コンテナに対して疎通確認を行います。

```bash
ping <対象のコンテナ>
```
```bash
ssh <対象のコンテナ>
```
- SSH の鍵登録で yes/no を聞かれた場合は yes を入力してください
- ログインパスワードは ansible

対象コンテナ一覧

- iijbootcamp_ansible_host00
- iijbootcamp_ansible_host01
- iijbootcamp_ansible_web00
- iijbootcamp_ansible_app00

------------------------------------------------------------------------

### 推奨開発環境

本ハンズオンでは、開発環境として Visual Studio Code (VSCode)の利用を推奨します。
特にこだわりがなければ VSCodeを利用することで、スムーズに演習を進められます。

#### Ansible Extension

Red Hat 社が提供する公式拡張機能 Ansible Extension を利用すると、補完機能や構文チェックが利用でき、Playbook の記述が効率化されます。

