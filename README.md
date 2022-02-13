[![Build Status](https://app.travis-ci.com/MisonoTakezo/ReadingAsset.svg?branch=develop)](https://app.travis-ci.com/MisonoTakezo/ReadingAsset)

# ReadingAsset （読書の感想投稿、管理アプリ 📖)

<img width="917" alt="名称未設定" src="https://user-images.githubusercontent.com/40426755/134841641-f654816c-a5f2-4480-a684-b5d641105ee9.png">

読んだ本の感想を投稿することで、読書習慣を身につけようと思い、このアプリを開発しました。

ユーザー認証、プロフィール変更、本の検索、本の感想の投稿、編集、削除といった最低限の機能があります。

### 用いた技術スタック

Ruby on Rails, Docker, Nginx, MySQL, GoogleBooksAPI\
Infra(維持費がかかるため、現在はインスタンスを停止済み): AWS (EC2 / RDS / ALB / Route53, ACM, S3)\
Travis CI (github への push 時と pull request 時に rspec のテストが実行される)

### 動かし方

1 このリポジトリをクローン\
2 ファイル「.env」を配置 (以下最小限の.env ファイル)

```sh
# System
TZ=Asia/Tokyo
APPLICATION_MODE=all
# Rails
RAILS_ENV=development
# Mysql
MYSQL_ROOT_PASSWORD=pass
MYSQL_ROOT_USER=pass
# Nginx
NGINX_SEVER_NAME=localhost

```

3 docker イメージをビルド

```
$ docker-compose build
```

4 docker コンテナの作成

```
$ docker-compose up -d
```

5 データベースの作成

```
docker-compose exec app rails db:create
```

6 マイグレーションの実行

```
docker-compose exec app rails db:migrate
```

8 DB の初期データの保存

```
docker-compose exec app rails db:seed
```

9 以下の URL にアクセス\
[http://localhost:80](http://localhost:80)

10 開発環境でのメールの受信(letter_opener_web)\
[http://localhost:80/letter_opener](http://localhost:80/letter_opener)
