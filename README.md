# サイト情報
***
- URL: https://www.shitsumonwa.com

# 「ShitsumonWa?」のについて
***
日本について気軽に質問できるWebサービスです。日本語についてのちょっとした質問や、おすすめの観光地などを共有できます。

# なぜ「ShitsumonWa?」というサービス？
***
- 「日本が好きだけれど、日本に留学にくるにはお金がかかる。」（20代前半アゼルバイジャン人男性）
- 「日本旅行に頻繁にいくので、有名な観光地ではなくローカルの人がいく穴場スポットが知りたい。」（20代中盤香港人女性）
- 「コロナで日本語の授業がなくなってしまったので独学をしているが、日本語の文法が難しく、気軽に質問できる場所が欲しい。」（30代前半ロシア人女性）

上記の友人の意見から、日本についての情報を共有できるサービスはニーズがあると感じたためです。

# 「ShitsumonWa?」の機能一覧
***
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

# 「ShitsumonWa?」の技術一覧
***
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







