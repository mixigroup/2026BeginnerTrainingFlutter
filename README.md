# 2026年 Flutter研修

## 事前準備

研修の前に、以下をインストールしてください

- [mise](https://mise.jdx.dev/getting-started.html)
    - 各ランタイムのバージョンを管理するツールです
    - 利用したくない場合は、[`mise.toml`](./mise.toml) を見てそれぞれインストールしてください
- [Xcode](https://developer.apple.com/xcode/resources/) 26.2
    - ダウンロードにはApple IDが必要です
    - [xcodes](https://github.com/XcodesOrg/xcodes) を使ってインストールするのがおすすめです
- [Android Studio](https://developer.android.com/studio) 2025.2

### セットアップ

```sh
# このリポジトリをクローン
git clone https://github.com/mixigroup/2026BeginnerTrainingFlutter.git
cd 2026BeginnerTrainingFlutter
```

```sh
# Rosetta2をインストール
sudo softwareupdate --install-rosetta --agree-to-license

# 各ランタイムをインストール
mise trust
mise install
```

または、以下を実行してください  
上記のツールを全てインストールします ([Homebrew](https://brew.sh/)に依存しています)

```sh
./setup.sh
```

`flutter doctor` を実行して、以下のように表示されればOKです (上記で指定していないツールのバージョンは違っても大丈夫です)

```sh
❯ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.38.9, on macOS 15.7.3 24G419 darwin-arm64, locale ja-JP)
[✓] Android toolchain - develop for Android devices (Android SDK version 36.1.0)
[✓] Xcode - develop for iOS and macOS (Xcode 26.2)
[✓] Chrome - develop for the web
[✓] Connected device (2 available)
[✓] Network resources

• No issues found!
```

起動したことがなければ、XcodeとAndroid Studioを起動しておくと良いでしょう

うまく行かない場合や、macOS環境でない場合は、 https://docs.flutter.dev/get-started/install に従ってください

### テキストエディタ

使用するテキストエディタは何でも良いですが、[Visual Studio Code](https://code.visualstudio.com/)を推奨しています
