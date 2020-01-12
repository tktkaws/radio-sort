
## ラジオソート
好きなラジオに順位をつけて、twitterで共有しましょう

ユーザーがつけた順位を集計した人気ランキングを閲覧しましょう

好みが似ているユーザーをフォローしましょう
## 機能一覧
| 機能名 | 機能説明 |
|:---:|:---:|
|ランキング作成 |お気に入りに登録したラジオをドラッグ&ドロップで順位付け |
|ランキング共有 |ランキングTOP５をtwitterに投稿 |
|twitter認証ログイン | |
|ラジオ検索 |ラジオの持つ各要素から検索 |
|コメント投稿 |ラジオ詳細ページに投稿/crudはそのページ内で完結 |
|人気ラジオランキング |ユーザーが着けた順位にpointを付与し、それを集計 |
|ユーザー検索 |ユーザーがTOP5に入れた番組から検索 |
|ユーザーフォロー | |

## カタログ設計
[カタログ設計.pdf](https://github.com/takayuki-takahashi-dic/radio-sort/files/4050315/-.1.pdf)


## テーブル定義
[テーブル定義.pdf](https://github.com/takayuki-takahashi-dic/radio-sort/files/4050138/-.pdf)


## ER図
![スクリーンショット 2020-01-12 10 57 22](https://user-images.githubusercontent.com/53632056/72213365-42496f80-3531-11ea-8d37-742a78e9961d.png)



## 画面遷移図
![画面遷移図proto2](https://user-images.githubusercontent.com/53632056/72213368-45dcf680-3531-11ea-8526-a2a43afc9612.png)


## ワイヤーフレーム
[ワイヤーフレーム.pdf](https://github.com/takayuki-takahashi-dic/radio-sort/files/4050139/default.pdf)


## 使用予定Gem
| gem | usage |
|:---:|:---:|
|ranked-model |お気に入りに順位を与える |
|jquery-ui-rails |順位をドラッグ&ドロップでつける |
|slim-rails |viewファイルをslimに変換 |
|materialize-sass |CSSフレームワーク |
|ransack |ラジオ検索・ユーザー検索 |
|select2-rails |検索可能なセレクトタグ |
|devise |ログイン機能(twitter認証) |
|nokogiri |radikoAPIからデータをパース |

## バージョン情報
ruby '2.6.5'

Rails '5.2.4.1'

PostgreSQL '9.1'
