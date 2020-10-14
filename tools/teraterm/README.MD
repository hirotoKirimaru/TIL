# これなに？

自動ログインのteraterm。


# 使い方

1. ttl拡張子を「Tera Term Macro Interpreter」と紐づける。**ttpmacro.exe**がその対象！**ttermpro.exe**は違う。通常ログインは後者でいいが、マクロは全社じゃないと「無効なホスト」と出力されて処理が終わる。

1. AP1~4.INIを**ttpmacro.exe**があるディレクトリに配備する。背景色等の違いなので特別になくてもいいが、反映したい場合は必要。ttl拡張子からの相対パスではなく、ttpmacro.exeからの相対パスなので、設定ファイルは同一ディレクトリに配備しておく必要がある。

1. APLogin.ttlをクリックして起動し、起動対象のサーバを選ぶだけ。

# 参考
https://qiita.com/backgroundcolor/items/df2ed5d40e8960e72ee4

