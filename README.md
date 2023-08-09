# find-craft-beer アプリ (ポートフォリオ)

![スクリーンショット](/app/assets/images/root-path.png)

## 概要

このポートフォリオプロジェクトは、お気に入りのクラフトビール店を投稿できるアプリです。
Docker上でRails 6を使用して制作されています。
新規登録・ログインが可能で、ユーザーはおすすめのクラフトビール店を投稿したり、
他のユーザーの投稿を閲覧したり、非同期でコメントやいいねを行うことができます。
投稿詳細ページではGoogle Maps APIも活用されています。

GitHub リポジトリ: [https://github.com/Rinak1210/portfolio_craft_beer](https://github.com/Rinak1210/portfolio_craft_beer)

## 特徴

- ユーザー登録と認証システム
- 投稿の作成、閲覧、非同期でのコメントといいね
- Google Maps APIを活用した店舗の位置表示
- Bootstrapを使用したレスポンシブデザイン
- ゲストログイン機能
- RSpecを使用した自動テスト
- CircleCIとHerokuを組み合わせたCI/CD

## 自動テスト

このアプリにはRSpecを使用した自動テストが含まれています。

## デプロイ

アプリはCircleCIとHerokuを使用した継続的インテグレーションとデプロイが設定されています。`main` ブランチに変更がプッシュされるたびに、CircleCIはテストを実行し、成功した場合は自動的にHerokuにデプロイされます。

## 貢献

このプロジェクトに貢献したい場合は、リポジトリをフォークし、新しいブランチを作成し、変更を加えてプルリクエストを送信してください。

## ライセンス

このプロジェクトは [MIT License](LICENSE) のもとでライセンスされています。

