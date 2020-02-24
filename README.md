# 概要
フリーランス向けの情報共有。  
 * テストアカウント  
  email:test123@gmail.com  
  password:12345678  
 
# 機能一覧
* ユーザー登録、編集  
* 各ユーザーの記事作成、編集、削除機能（編集、削除は本人のみ）  
* ユーザーフォロー機能  
* 記事のイイね機能  
* 記事をカテゴリ分類  
* ユーザー間の非同期チャット機能  

# 制作環境
* Ruby 2.5.1  
* Ruby on Rails 5.2.3  
* HAML, SCSS, JavaScript(ライブラリ: Jquery)  
* Heroku  
* AWS(S3)  
本番環境はHerokuを使用。画像アップロードはgem'CarrierWave'を使用し、S3へ保存。  

# 制作背景
フリーランスへの転向を検討している知人の意見を参考にし、話を聞いた中でも特に大きかった以下の悩みを「実体験が元となる情報」によって解決すべく開発を行っています。  
*  
*  
*  


当アプリは自身のアウトプットに加え、既知の機能実装を新しい技術を使用する事でいかに効率的に行うか、という事を常に考えて開発を行っています。
# 工夫した事


# 今後実装したい機能
* 地域カテゴリ実装：記事の内容を限定的にする事で特定のユーザーの満足度を高める
* コミュニティの作成及び当該コミュニティへの参加要望とその許可機能

# DB設計
