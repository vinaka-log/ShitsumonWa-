# ShitsumonWa?

## サイト情報

- URL: https://www.shitsumonwa.com
 
![image](https://user-images.githubusercontent.com/61833409/88449166-a4d7dc80-ce7f-11ea-821f-5f130757ed09.png)


## 「ShitsumonWa?」について

日本について気軽に質問できるWebサービスです。日本語についてのちょっとした質問や、おすすめの観光地などを共有できます。

##  なぜ「ShitsumonWa?」というサービス？

- 「日本が好きだけれど、日本に留学にくるにはお金がかかる。」（20代前半アゼルバイジャン人男性）
- 「日本旅行に頻繁にいくので、有名な観光地ではなくローカルの人がいく穴場スポットが知りたい。」（20代中盤香港人女性）
- 「コロナで日本語の授業がなくなってしまったので独学をしているが、日本語の文法が難しく、気軽に質問できる場所が欲しい。」（30代前半ロシア人女性）

上記の友人の意見から、日本についての情報を共有できるサービスはニーズがあるとわかり、身近にサービスがあれば友人の日本への理解を深める手助けをできると思ったからです。

##  開発環境
-  Ruby 2.6.3
-  Rails 6.0.3

## 「ShitsumonWa?」の機能一覧

-  ユーザーのCRUD機能
-  ログイン機能(sorcery)
-  メールでのアクティベーション (sorcery,ActionMailer)
-  パスワードリセット（sorcery,ActionMailer）
-  Remeber me（sorcery）
-  Twitter、Facebookログイン(sorcery)
-  質問投稿のCRUD機能
-  いいね機能（Ajax）
-  ストック機能（Ajax）
-  フォロー機能 （Ajax）
-  ソート機能
-  ページネーション機能(Kaminari)
-  プロフィールにSNSリンクを表示（Twitter,Facebook,Instagram）
-  プロフィールにJapan Scoreを表示（自身の投稿に対するいいね数の総和）
-  画像アップロード（carrierwave、mini_magick、 AWS S3、 fog）

## 「ShitsumonWa?」の技術一覧

-  プラットフォーム（AWS EC2 ALB Route53 ）
-  Webサーバー（Nginx）
-  APサーバー（Unicorn）
-  データベース（PostgreSQL）
-  テスト（Rspec、Capybara、factory_bot）
-  自動テスト (Circle CI)
-  CSSフレームワーク（Bootstrap4）
-  JavaScriptライブラリ （jQuery）
-  コードチェック（rubocop）
-  開発環境 （Docker）
-  バージョン管理 （Git）
-  リポジトリ管理（Github）

## 「ShitsumonWa?」の課題・追加実装したい機能

-  レスポンス速度の改善（[PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/?hl=JA&url=https%3A%2F%2Fwww.shitsumonwa.com%2F&tab=mobile)）


  -  CloudFront（AWS）でRailsのAssets周りにある静的ファイルをCDN配信
  -  必要のないCSSファイルを全消去
  -  head内に共通CSSは直書きする
  
  
  
  -  パソコン
  
![image](https://user-images.githubusercontent.com/61833409/88448643-e914ae00-ce7a-11ea-9538-653217df2447.png)

  -  モバイル
  
![image](https://user-images.githubusercontent.com/61833409/88448702-78ba5c80-ce7b-11ea-9323-7c4ab123fcd0.png)

-  SEO対策（google-analytics-rails、meta-tags、sitemap_generator）
-  Slack通知機能
-  デプロイの自動化(Circle CD)
-  DM機能と非同期でメッセージの送受信
-  質問のタグ機能












