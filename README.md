OmniAuthを使ってtwitterで認証する

認証、ツイート機能実装

参考
1. Ruby on Railsの認証 - OmniAuthでtwitter認証 + 簡単なRSpec http://undersourcecode.hatenablog.com/entry/20130414/1365900399

2. (メモ) Rails+OmniAuthによるTwitterログイン http://d.hatena.ne.jp/m-kawato/20130105/1357399125

3. omniauth-twitter https://github.com/arunagw/omniauth-twitter

備考
2の記事で、ツイートするupdateメソッドのレシーバーを、Twitter::Client.newで作っているが、それだと、updateがundefinedメソッドになってしまって、ツイートできない。The Twitter Ruby Gem http://rdoc.info/gems/twitter によると、レシーバーを

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

としている。このclientを使うと、client.updateでツイートできる。

