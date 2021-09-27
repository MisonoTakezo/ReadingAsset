# ReadingAsset （読書感想投稿、管理アプリ📖)

<img width="917" alt="名称未設定" src="https://user-images.githubusercontent.com/40426755/134841641-f654816c-a5f2-4480-a684-b5d641105ee9.png">

読んだ本の感想を投稿することで、読書習慣を身につけようと思い、このアプリを開発しました。

ユーザー認証、プロフィール変更、本の検索、本の感想の投稿、編集、削除といった最低限の機能があります。

### 用いた技術スタック
Ruby on Rails, Docker, Nginx, MySQL, GoogleBooksAPI\
Infra(維持費がかかるため、現在はインスタンスを停止済み): AWS (EC2 / RDS / ALB / Route53, ACM) 

### 動かし方

1 このリポジトリをクローン\
2 ファイル「.env」を配置 (以下最小限の.envファイル)

```sh
# System
TZ=Asia/Tokyo
APPLICATION_MODE=all

# Mysql
MYSQL_ROOT_PASSWORD=pass
MYSQL_ROOT_USER=root

```
3 docker イメージをビルド/コンテナ作成
```
$ docker-compose up -d --build
```
4 以下のURLにアクセス\
[http://localhost:80](http://localhost:80)
