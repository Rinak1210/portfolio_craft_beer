# find-craft-beer アプリ (ポートフォリオ)

![find-craft-beer](https://github.com/Rinak1210/portfolio_craft_beer/assets/123565603/5764b189-afc8-43c6-8e4f-65de9e9c5066)

## 概要

このポートフォリオプロジェクトは、お気に入りのクラフトビール店を投稿できるアプリです。

Docker上でRails 6を使用して制作されています。

新規登録・ログインが可能で、ユーザーはおすすめのクラフトビール店を投稿したり、

他のユーザーの投稿を閲覧したり、コメントやいいねを行うことができます。

投稿詳細ページではGoogle Maps APIも活用されています。

## 環境

- Ruby: 3.1.2
- Rails: 6.1.7.3
- フロントエンド: JavaScript, jQuery
- データベース: PostgreSQL
- Docker Compose バージョン: 3.9
- CircleCI 設定バージョン: 2.1
- Heroku バージョン: 8.1.9 (darwin-x64)
- Node.js バージョン: 16.19.0
- AWS S3: 画像のストレージとして利用

## 特徴

- ユーザー登録と認証システム
- 投稿の作成、閲覧、非同期でのコメントといいね
- Google Maps APIを活用した店舗の位置表示
- Bootstrapを使用したレスポンシブデザイン
- ゲストログイン機能
- RSpecを使用した自動テスト
- CircleCIとHerokuを組み合わせたCI/CD

## ER図

- ER図は、GemのRails ERDを使用して自動的に生成。

![ER図](https://github.com/Rinak1210/portfolio_craft_beer/assets/123565603/6da5e727-ef37-4b42-9409-30dea4432521)

## 自動テスト

このアプリにはRSpecを使用した自動テストが含まれています。

- System Spec
- Model Spec
- Request spec

## デプロイ

アプリはCircleCIとHerokuを使用した継続的インテグレーションとデプロイが設定されています。`master` ブランチに変更がプッシュされるたびに、CircleCIはテストを実行し、成功した場合は自動的にHerokuにデプロイされます。

## 文責

- 作者: 河原 梨奈 Rina Kawahara
- GitHub: [https://github.com/Rinak1210](https://github.com/Rinak1210)
