# Rails7 with Tailwind CSS Template

## 開発環境のセットアップ

### docker の起動

```sh
docker-compose build
docker-compose up -d
```

### docker コンテナにログイン

```sh
docker-compose exec web /bin/bash
```

以降のコマンドは rails のコマンドなのでログインは必須。

### DB のセットアップ（初回のみ）

```sh
rails db:create
rails db:migrate
```

### サーバーの起動

```sh
./bin/dev
```

http://localhost:3000 でアクセス
