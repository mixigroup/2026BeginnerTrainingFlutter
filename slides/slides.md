<!-- {"layout": "title"} -->

# Flutter研修

## MIXI 26新卒技術研修

## 川瀬 寛也

---

<!-- {"layout": "title-and-body-2col", "freeze": true} -->

# 講師/チューター

---

<!-- {"layout": "section"} -->

# はじめに

---

## はじめに

# 事前準備

研修の前に、以下をインストールしてください

- [mise](https://mise.jdx.dev/getting-started.html)
    - 各ランタイムのバージョンを管理するツールです
- [Xcode](https://developer.apple.com/xcode/resources/) 26.2
    - ダウンロードにはApple IDが必要です
    - [xcodes](https://github.com/XcodesOrg/xcodes) を使ってインストールするのがおすすめです
- [Android Studio](https://developer.android.com/studio) 2025.2

<!--
Getting Started | mise-en-place https://mise.jdx.dev/getting-started.html
Resources - Xcode - Apple Developer https://developer.apple.com/xcode/resources/
XcodesOrg/xcodes: The best command-line tool to install and switch between multiple versions of Xcode. https://github.com/XcodesOrg/xcodes
Download Android Studio & App Tools - Android Developers https://developer.android.com/studio
-->

---

## はじめに

# 事前準備

```sh
# このリポジトリをクローン
git clone https://github.com/mixigroup/2026BeginnerTrainingFlutter.git
cd 2026BeginnerTrainingFlutter

# Rosetta2をインストール
sudo softwareupdate --install-rosetta --agree-to-license

# 各ランタイムをインストール
mise trust
mise install
```

---

## はじめに

# 事前準備

`flutter doctor`を実行して、以下のように表示されればOKです
（指定していないツールのバージョンは違っても大丈夫です）

```sh
› flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.38.9, on macOS 15.7.3 24G419 darwin-arm64, locale ja-JP)
[✓] Android toolchain - develop for Android devices (Android SDK version 36.1.0)
[✓] Xcode - develop for iOS and macOS (Xcode 26.2)
[✓] Chrome - develop for the web
[✓] Connected device (2 available)
[✓] Network resources

• No issues found!
```

うまく行かない場合 / macOS環境でない場合は https://docs.flutter.dev/get-started/install に従ってください

---

## はじめに

# この研修のゴール

- Flutterを使ってモバイルアプリ開発の基礎を理解する
- なぜFlutterを選ぶのか、選ばないのかを判断できるようになる
- 生成AIと協力して設計/開発できる状態になる

---

## はじめに

# この研修のポリシー

- やらないこと
    - 基本文法の解説
    - 手順の写経
        - 各演習では参考となるコードを載せていますが、従わなくても良いです

- やること
    - 講義 + 演習 … 手を動かしながら学ぶ
    - 小さくても運用を見据えた構成

---

## はじめに

# 旅路

1. モバイルアプリ開発とFlutter
2. アプリアーキテクチャ 〜実装に入る前に〜
3. アプリを”ひとまず"作ってみる
4. 今回作るアプリの概要
5. UI構築
6. 状態管理とDI
7. 非同期値の取り扱い
8. ルーティング
9. 送信処理
10. テスト
11. UI品質保証
12. Flutter以外の選択肢と技術選定力
13. まとめ・振り返り

---

<!-- {"layout": "section"} -->

# モバイルアプリ開発とFlutter

---

## モバイルアプリ開発とFlutter

# モバイルアプリ開発で考えること

- UI
    - レイアウト、ナビゲーション、アニメーション、デザインシステム
- 状態管理
    - ローカル状態、グローバル状態、非同期処理の整合性
- 通信と同期
    - ネットワーク通信、データ同期、オフライン対応、キャッシュ戦略
- 認証とセキュリティ
    - ユーザー認証、データ保護
- 品質保証
    - テスト、デバッグ、モニタリング
- 運用と配信
    - CI/CD、バージョン管理、ストア配信

etc…

---

<!-- {"layout": "title-and-body-2col"} -->

## モバイルアプリ開発とFlutter

# 開発アプローチの種類

## ネイティブ

- 代表技術
    - Swift + SwiftUI / Kotlin + Jetpack Compose
- 特徴
    - OSに最適化された公式スタック
    - 最良のパフォーマンスとユーザー体験

## クロスプラットフォーム

- 代表技術
    - (後述)

- 特徴
    - 単一コードベースで複数プラットフォーム対応
    - 保守性と再利用性のバランス

<!--
SwiftUI | Apple Developer Documentation https://developer.apple.com/documentation/swiftui
Jetpack Compose UI App Development Toolkit - Android Developers https://developer.android.com/compose
-->

---

## モバイルアプリ開発とFlutter

# クロスプラットフォームの分類

- WebView
    - 代表技術: TypeScript + Capacitor / Rust + Tauri
    - 特徴: Web資産流用に最適

ネイティブUI
_ 代表技術: TypeScript + React Native / Kotlin + Compose Multiplatform / Swift + Skip
_ 特徴: ネイティブに近い体験

独自レンダリング
_ 代表技術: `Dart + Flutter` / C# + Unity
_ 特徴: 高いカスタマイズ性

<!--
Capacitor by Ionic - Cross-platform apps with web technology https://capacitorjs.com/
Tauri 2.0 | Tauri https://tauri.app/
React Native · Learn once, write anywhere https://reactnative.dev/
Compose Multiplatform UI Framework | JetBrains https://www.jetbrains.com/compose-multiplatform/
Skip | Dual-platform app development in Swift https://skip.tools/
Unity Real-Time Development Platform | 3D, 2D, VR & AR Engine https://unity.com/
-->

---

## モバイルアプリ開発とFlutter

# Flutterとは？

- Googleが開発・保守するクロスプラットフォームUIフレームワーク
    - 2014年に Sky として開発開始、2018年にFlutter 1.0リリース
- 単一コードベースで iOS / Android™ / Web / Windows / macOS / Linux / (Fuchsia) に対応
- 世界中で 100万人以上 の月間アクティブ開発者
- 新規iOSアプリの 約30% がFlutterで構築されている（2024年）

<!--
Flutter-on-Fuchsia Velocity https://fuchsia.dev/fuchsia-src/contribute/roadmap/2021/flutter_on_fuchsia_velocity
Celebrating Flutter’s “Production Era” | by Michael Thomsen | Flutter | Medium https://medium.com/flutter/flutter-in-production-f9418261d8e1
※「Android」は、Google LLC の商標または登録商標です。
-->

---

## モバイルアプリ開発とFlutter

# Flutterアーキテクチャ概要

_Framework_
アプリ開発者が主に触れる層（Dart）
Widget, Rendering, Animationなど

_Engine_
ランタイムのコア（C++）
Impeller または Skia による描画、Text Rendering、Dart Runtime

_Embedder_
各プラットフォーム固有
OSのエントリーポイント

> 明確に分離された3層構造 → 高いパフォーマンスと柔軟なUI構築を実現

<!--
Flutter architectural overview | Flutter https://docs.flutter.dev/resources/architectural-overview
-->

---

<!-- {"layout": "section"} -->

# アプリアーキテクチャ

## 実装に入る前に

---

## アプリアーキテクチャ

# アーキテクチャとは何か、なぜ必要か？

- アーキテクチャとは
    - アプリケーションを構成する技術・構造・方針の集合
    - 構成要素の責務と関係性を定義する枠組み
- なぜ存在するのか
    - 開発の初期段階から運用・保守まで破綻しない構造を提供するため
    - 拡張性・テスト容易性・保守性を確保するため
- なぜ学ぶ必要があるのか
    - 運用に耐えるアプリを設計・評価するため

> 動くアプリではなく「運用できるアプリ」を作るために不可欠

---

## アプリアーキテクチャ

# 基本原則

- Separation of Concerns（関心の分離）
    - 機能ごとに自己完結したユニットに分離
    - UIロジックとビジネスロジックを明確に分ける
    - ウィジェットは再利用可能かつロジックを最小限に保つ
- Layered Architecture（レイヤードアーキテクチャ）
    - アプリケーションを3層（UI層, ロジック層, データ層）に分離
    - 各層は隣接する層としか通信しない

<!--
Architecture concepts | Flutter https://docs.flutter.dev/app-architecture/concepts
-->

---

## アプリアーキテクチャ

# データの流れ

- Single Source of Truth（SSOT, 信頼できる唯一の情報源）
    - 各データ型は唯一の責務を持つクラスで管理
    - 同じデータを複数箇所で保持しない。バグを抑制
- Unidirectional Data Flow（単方向データフロー）
    - ユーザー操作は UI → ロジック → データ の順にイベントとして処理される
    - 逆に状態は データ → ロジック → UI の順に流れる
    - 状態の更新は常にデータ層（SSOT）を通じて行う

<!--
Architecture concepts | Flutter https://docs.flutter.dev/app-architecture/concepts
-->

---

## アプリアーキテクチャ

# 関心の分離を保ちつつ機能単位でまとめる

- Co-location （コロケーション）
    - 関連するリソースをまとまりで管理する
    - 機能をディレクトリ単位で並置して認知負荷を下げる
- Screaming Architecture（叫ぶアーキテクチャ）
    - ディレクトリ構成等から「何をするか」が即座に伝わる状態
    - コロケーション文脈では、機能ベースのフォルダ名

> レイヤーは論理構造、コロケーションは物理配置

<!--
Colocation https://kentcdodds.com/blog/colocation
Clean Coder Blog https://blog.cleancoder.com/uncle-bob/2011/09/30/Screaming-Architecture.html
-->

---

## アプリアーキテクチャ

# まとめ: 実装時の心がけ

- 責務は分離し、コードは局所化する
- レイヤーと流れを意識する
- 状態は単一の真実を持ち、UIはその結果として定義する
- 構造でアプリケーションの目的を表現する

> 技術（フレームワーク）より先に設計、設計より先に目的

---

<!-- {"layout": "section"} -->

# アプリを”ひとまず”作ってみる

---

## アプリを”ひとまず”作ってみる

# はじめの一歩

1. 好きな名前でFlutterプロジェクトを作ってみよう
    - 英小文字、数字、アンダースコアが使えます
2. 起動してみよう
    - iOSでもAndroidでもWebでも 実機・エミュレータのどちらでも大丈夫です

```sh
flutter create <プロジェクト名>
cd <プロジェクト名>
flutter run
```

---

## アプリを”ひとまず”作ってみる

# Let’s Vibe Coding!

1. DartPad https://dartpad.dev/ にアクセス
2. 「Flutter Snippet」から自然言語で作りたいアプリを説明
    - プレビューで確認しながら、気に入るまで「Update code」
3. `lib/main.dart` にコピー&ペースト
    - 必要ならパッケージのインストール（例：`flutter pub add provider`）
4. （`flutter run`を実行したterminal上で）`r` で Hot reload、`R` で Hot restart

---

<!-- {"layout": "section"} -->

# 今回作るアプリの概要

---

## 今回作るアプリの概要

# 簡易SNSクライアントを作ろう

- 主な機能
    - 投稿一覧機能
    - 投稿作成機能
    - 投稿データはサーバーとリアルタイム同期
- 画面構成
    - `/` … ホーム画面（タイムライン）
    - `/compose` … 投稿作成画面

---

## 今回作るアプリの概要

# 補足: 利用するSNSプロトコル

- Nostrというプロトコルを利用 (Note and Other Stuff Transmitted by Relays)
    - WebSocketで接続できる分散型ソーシャルネットワークプロトコル
        - WebSocket … 双方向リアルタイム通信を維持するための常時接続プロトコル
    - 投稿を含むあらゆるものをイベントとして、リレーによって送信する
- なぜ使うのか？
    - 自前でプロトコルを定義しなくてよい
    - 既存のリレーサーバーに繋ぐだけで”利用者の多いSNSアプリ”になる

<!--
nostr-protocol/nostr https://github.com/nostr-protocol/nostr
-->

---

<!-- {"layout": "section"} -->

# UI構築

---

## UI構築

# タイムラインのベースを作ろう

- `StatelessWidget`
    - 状態を持たないウィジェットの基本クラス

1. `lib/` 下に `pages/timeline/page.dart` を作成して、`TimelinePage` を作ってみよう
2. `lib/main.dart` から呼び出してみよう

```dart
class TimelinePage extends StatelessWidget {
    const TimelinePage({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('タイムライン')),
            body: ListView(
                children: const [
                    ListTile(title: Text('投稿1')),
                    ListTile(title: Text('投稿2')),
                    ListTile(title: Text('投稿3')),
                ],
            ),
        );
    }
}
```

<!--
StatelessWidget class - widgets library - Dart API https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
-->

---

## UI構築

# FlutterのUI設計思想

- Everything is a Widget
    - 視覚要素（ボタン、テキスト）だけでなく、レイアウトや振る舞いなど全てがウィジェット
    - コンポジション（合成）によって複雑なUIをシンプルに組み立てる
- 宣言的UI
    - UI = f(state) の純粋関数的なモデルに基づく
    - 状態が変化すれば、該当するウィジェットツリーを再構築する
    - 明示的にUI更新ロジックを書く必要はない
    - 再描画は差分検知で最適化される

> 「全てがウィジェットである」

<!--
Layout | Flutter https://docs.flutter.dev/ui/layout
Inside Flutter | Flutter https://docs.flutter.dev/resources/inside-flutter
-->

---

## UI構築

# 2つの描画アーキテクチャ

- FlutterはネイティブUIをラップしない。React Native等との差別点
- Skia
    - 長年利用されてきたクロスプラットフォーム2D描画エンジン
    - CPU/GPU混在の柔軟なパイプライン
    - パフォーマンスや安定性の面で限界があった
- Impeller
    - Flutter独自開発の新しい描画エンジン
    - Vulkan/MetalなどのモダングラフィックスAPIを積極的に活用
    - シェーダーの事前コンパイルで描画の一貫性とフレーム飛びを抑制

> Flutter 3.27以降、iOS/AndroidでImpellerがデフォルトに

<!--
Impeller Availability https://docs.google.com/spreadsheets/d/1AebMvprRkxP-D6ndx920lbvDBbhg-sNNRJ64XY2P2t0/edit?gid=0#gid=0
-->

---

## UI構築

# 投稿カードを作ろう

- Material 3
    - Googleのデザインシステムで、Flutter標準採用

1. `lib/pages/timeline/` 下に `components/post_card.dart` を作成して、
   `PostCard` を作ってみよう
    - Material 3 の `Card` と `ListTile` などが利用できそう！
2. `page.dart` で `PostCard` を使ってみよう

<!--
Material Design 3 - Google's latest open source design system https://m3.material.io/
Card class - material library - Dart API https://api.flutter.dev/flutter/material/Card-class.html
ListTile class - material library - Dart API https://api.flutter.dev/flutter/material/ListTile-class.html
-->

---

## UI構築

# アプリテーマを設定しよう

1. `lib/` 下に `themes/colors.dart` を作成して、
   アプリ全体のカラーテーマを作ってみよう
2. `lib/main.dart` の `ThemeData` に設定しよう

3. 余裕があれば `themes/fonts.dart` に
   アプリ全体のテキストスタイルを作ってみよう

```dart
class AppColors {
    static const primary = Color (0xFF8839EF);
    static const background = Color (0xFFF5F5F5);
    static const secondary = Color(0xFFFE640B);
    static const text = Color (0xFF4C4F69);
    static const error = Color (0xFFE64553);

    // ColorSchemeを生成
    static ColorScheme toColorScheme() {
        return const ColorScheme(
            brightness: Brightness.light,
            primary: primary,
            onPrimary: background,
            secondary: secondary,
            onSecondary: background,
            error: error,
            onError: background,
            surface: background,
            onSurface: text,
        );
    }
```

---

## UI構築

# デザインシステム

- デザインシステムとは
    - UIに一貫性と再利用性を与える設計のルール
    - デザイナーと共通の”言語”を持つために不可欠
- Material 3 の拡張性
    - UI構築に必要な要素が体系的に提供されている
    - これをベースに、自分でデザインシステムを作っていける
- Flutterのデザインシステム
    - UIの一貫性を保ちつつ、メンテナンス性を向上できる
    - `ThemeData` を活用して色や文字のテーマを一元管理

> クロスプラットフォームで統一感のあるUIを実現

<!--
Material | Flutter https://docs.flutter.dev/ui/widgets/material
-->

---

<!-- {"layout": "section"} -->

# 状態管理とDI;

---

## 状態管理とDI

# タイムラインに投稿を追加しよう

- `StatefulWidget` (+ `setState`)
    - 状態を持つウィジェットの基本クラス

1. `TimelinePage` に `FloatingActionButton` を設置しよう
2. ボタンを押すと投稿がタイムラインに追加されるようにしてみよう

```dart
class TimelinePage extends StatefulWidget {
    const TimelinePage({super.key});

    @override
    State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
    final posts = <String>[];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('タイムライン')),
            body: ListView(
                children:
                    posts
                        .map((post) => PostCard(username: 'user', text: post))
                        .toList(),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => _addPost('投稿 ${posts.length + 1}'),
                child: const Icon(Icons.add),
            ),
        );
    }

    void _addPost(String text) {
        setState(() {
            posts.insert(0, text);
        });
    }
}
```

---

## 状態管理とDI

# Flutterにおける「状態」とは？

- UIやリソース管理に関わるオブジェクト
- ユーザーの操作や外部イベントによって変化する
- UIを構築するためのSSOT（信頼できる唯一の情報源）として扱われるべきもの
    - 効率的に組織して管理する必要がある

> 状態はUIのSSOTである

<!--
State management | Flutter https://docs.flutter.dev/get-started/fundamentals/state-management
-->

---

## 状態管理とDI

# [再掲] データの流れ

- Single Source of Truth（SSOT, 信頼できる唯一の情報源）
    - 各データ型は唯一の責務を持つクラスで管理
    - 同じデータを複数箇所で保持しない。バグを抑制
- Unidirectional Data Flow（単方向データフロー）
    - ユーザー操作は UI → ロジック → データ の順にイベントとして処理される
    - 逆に状態は データ → ロジック → UI の順に流れる
    - 状態の更新は常にデータ層（SSOT）を通じて行う

<!--
Architecture concepts | Flutter https://docs.flutter.dev/app-architecture/concepts
-->

---

## 状態管理とDI

# 2つの「状態」

- Ephemeral State（ローカル状態）
    - 単一ウィジェット内で完結するもの
    - UIの一時的な状態。アニメーション進行度など
- App State（グローバル状態）
    - アプリ全体で共有されるもの
    - ページ間で情報は共有されるべきであるため、モバイルアプリはApp Stateが多い

<!--
Differentiate between ephemeral state and app state | Flutter https://docs.flutter.dev/data-and-backend/state-mgmt/ephemeral-vs-app
-->

---

## 状態管理とDI

# setStateの限界

- 状態が複数のウィジェットにまたがると管理が難しい
    - 親から子ウィジェットへの伝播が煩雑
- 状態がウィジェットに埋め込まれると再利用が難しい
    - ロジックとUIが密結合し、可読性も低下
- アプリケーション全体の状態を一元管理できない
    - グローバルに共有すべき状態に対応不可

> setStateはローカルには有効だが、アプリ全体の設計には不十分

---

## 状態管理とDI

# グローバル状態の管理とRiverpod

- 状態管理ライブラリは複数あるが、特に日本語圏ではRiverpodが代表的
- なぜRiverpodを利用するのか
    - 状態とUIを分離できる
    - UIとロジックのテスト性を向上できる
    - 非同期や複数画面でも簡単に状態管理できる
- Riverpodの仕組み
    - 状態をプロバイダー経由で注入
    - UIは必要な状態だけを監視すれば良い

<!--
Riverpod https://riverpod.dev/
-->

---

## 状態管理とDI

# Riverpodで書き換えよう

1. `flutter_riverpod` を依存関係に追加する

2. `ProviderScope` を `main.dart` に追加する
    - スコープ単位で状態の分離ができる
    - 今回はアプリのエントリーポイントに配置

```dart
void main() {
    runApp(
        const ProviderScope(
            child: MyApp(),
        ),
    );
}
```

<!--
Riverpod https://riverpod.dev/
-->

---

## 状態管理とDI

# Riverpodで書き換えよう

3. `lib/pages/timeline/` 下に `provider.dart` を作成して、`timelineProvider` を作ろう
4. `TimelinePage` を書き換えよう

```dart
class TimelineNotifier extends Notifier<List<String>> {
    @override
    List<String> build() => [];

    void addPost (String text) {
        state = [text, ...state];
    }
}

final timelineProvider = NotifierProvider<TimelineNotifier, List<String>>(() {
    return TimelineNotifier();
});
```

```dart
class TimelinePage extends ConsumerWidget {
    const TimelinePage({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final posts = ref.watch(timelineProvider);

        return Scaffold(
            appBar: AppBar(title: const Text('タイムライン')),
            body: ListView(
                children:
                    posts
                        .map((post) => PostCard(username: 'user', text: post))
                        .toList(),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed:
                    () => ref
                        .read(timelineProvider.notifier)
                        .addPost('投稿 ${posts.length + 1}'),
                child: const Icon(Icons.add),
            ),
        );
    }
}
```

<!--
Notifier class - riverpod library - Dart API
https://pub.dev/documentation/riverpod/latest/riverpod/Notifier-class.html
-->

---

## 状態管理とDI

# DI (Dependency Injection)

- DIとは？
    - 依存関係（= 他のオブジェクトやリソース）を外部から提供する設計手法
    - オブジェクトが自ら依存対象を生成せず、外部から受け取る
    - 保守性・テスト容易性・再利用性の向上につながる
- RiverpodとDIの関係
    - プロバイダーがDIのユニットになっている
    - 依存オブジェクトを定義し、必要な場所で注入する設計

> 構造を明示的にし、アプリの保守性を支える

<!--
Providers | Riverpod https://riverpod.dev/docs/concepts/providers#why-use-providers
-->

---

<!-- {"layout": "section"} -->

# 非同期値の取り扱い

---

## 非同期値の取り扱い

# 投稿の中身

- WebSocketでリアルタイムに投稿を受け取る
- 投稿データは簡単なJSONイベントになっている

```jsonc
{
    // ID
    "id": "3296c5fdfa35e2346edd81e983023adc5bc5557630c1cf79b90a7eb523efc8485",
    // 作成者の公開鍵
    "pubkey": "f1479c106e570534568a7424195dc155a04448d3d71d4090adec95915dd1eba9",
    // 作成時刻
    "created_at": 1671394897,
    // 種類（1は投稿）
    "kind": 1,
    // タグ
    "tags": [],
    // イベントの内容
    "content": "hi",
    // 署名
    "sig": "880c8239720830a04f4b7a28a771149a39b3fcedb574531092f152b7638021e0f126a8a64c8eaa23654594539944466283da2638105f79d152b17280adfa101af0",
}
```

<!--
nips/10.md at master · nostr-protocol/nips https://github.com/nostr-protocol/nips/blob/master/10.md
-->

---

## 非同期値の取り扱い

# 投稿データモデルを定義しよう

- `lib/` 下に `entities/post.dart` を作成し、`Post` を定義
- JSONイベントをDartで扱えるようにしよう

```json
{
    "id": "イベントID",
    "pubkey": "ユーザーの公開鍵(ユーザーID)",
    "created_at": 1234567890,
    "kind": 1,
    "content": "投稿の本文",
    "sig": "署名"
}
```

```dart
class Post {
    Post({
        required this.id,
        required this.pubkey,
        required this.createdAt,
        required this.content,
        required this.sig,
    });

    factory Post.fromJson(Map<String, dynamic> json) {
        return Post(
            id: json['id'] as String,
            pubkey: json['pubkey'] as String,
            createdAt: json['created_at'] as int,
            content: json['content'] as String,
            sig: json['sig'] as String,
        );
    }

    final String id;
    final String pubkey;
    final int createdAt;
    final String content;
    final String sig;
}
```

---

## 非同期値の取り扱い

# `AsyncNotifier` / `StreamNotifier`

- 非同期状態管理のための `Notifier` 派生型
- 状態は `AsyncValue<T>` で管理され、ローディングやエラーを明示的に扱える
- `AsyncNotifier`
    - 一過性の非同期処理に最適（初回ロード、操作後の更新など）
    - 呼び出しごとに処理が完結し、開始を明示的に制御できる
- `StreamNotifier`
    - 継続的な状態変化を扱う（WebSocketの購読など）
    - ストリームに流れるデータをリアクティブに処理したい場合に適する

> 一過性の非同期処理には`AsyncNotifier`、継続的な変化には`StreamNotifier`

<!--
AsyncNotifier class - riverpod library - Dart API https://pub.dev/documentation/riverpod/latest/riverpod/AsyncNotifier-class.html
StreamNotifier class - riverpod library - Dart API https://pub.dev/documentation/riverpod/latest/riverpod/StreamNotifier-class.html
-->

---

## 非同期値の取り扱い

# 投稿データを取得しよう

1. `web_socket_channel` を依存関係に追加
    - 標準の`dart:io`を使っても良いが、クロスプラットフォーム対応したい
2. `StreamNotifier` で `timelineProvider` を書き換えてみよう
    - 研修のために用意したリレーサーバーのURLはSlackに貼ります

```dart
class TimelineNotifier extends StreamNotifier<List<Post>> {
    @override
    Stream<List<Post>> build() async* {
        final channel = WebSocketChannel.connect(
            Uri.parse('wss://mini-relay-5b7atwsxwa-an.a.run.app'),
        );

        channel.sink.add(
            jsonEncode([
                'REQ',
                'test',
                {
                    'kinds': [1],
                    'limit': 50,
                },
            ]),
        );

        final posts = <Post>[];

        await for (final message in channel.stream) {
            final decoded = jsonDecode(message as String);
            if (decoded is List && decoded.length >= 3 && decoded[0] == 'EVENT') {
                final post = Post.fromJson(decoded[2] as Map<String, dynamic>);
                posts.insert(0, post);
                yield List.unmodifiable(posts);
            }
        }
    }
}

final timelineProvider = StreamNotifierProvider<TimelineNotifier, List<Post>>(
    () {
        return TimelineNotifier();
    },
);
```

<!--
web_socket_channel | Dart package https://pub.dev/packages/web_socket_channel
WebSocket class - dart:io library - Dart API https://api.dart.dev/dart-io/WebSocket-class.html
StreamNotifier class - riverpod library - Dart API https://pub.dev/documentation/riverpod/latest/riverpod/StreamNotifier-class.html
-->

---

## 非同期値の取り扱い

# 投稿データを取得しよう

3. ウィジェットに反映しよう

- 研修リポジトリの `server/` を見て、ローカルにリレーサーバーを立ててもOK
- 動作に問題がなければ実世界のリレーサーバーに接続しても勿論OK

```dart
class TimelinePage extends ConsumerWidget {
    const TimelinePage({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final postsAsync = ref.watch(timelineProvider);

        return Scaffold(
            appBar: AppBar(title: const Text('タイムライン')),
            body: postsAsync.when(
                data:
                    (posts) => ListView.builder(
                        itemCount: posts.length,
                        itemBuilder:
                            (context, index) => PostCard(
                                username: posts[index].pubkey,
                                text: posts[index].content,
                            ),
                    ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text(error.toString())),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    // 処理なし
                },
                child: const Icon(Icons.add),
            ),
        );
    }
}
```

<!--
AsyncValue class - riverpod library - Dart API https://pub.dev/documentation/riverpod/latest/riverpod/AsyncValue-class.html
-->

---

<!-- {"layout": "section"} -->

# ルーティング

---

## ルーティング

# 投稿作成画面を作ろう

- `ConsumerStatefulWidget`
    - `ConsumerWidget` + `StatefulWidget`

- 投稿作成画面を作ってみよう
- 投稿送信処理は今は空でOK
    - 非同期処理を行う予定なので `AsyncNotifier`

```dart
class ComposeNotifier extends AsyncNotifier<void> {
    @override
    Future<void> build() async {}

    Future<void> post(String content) async {
        state = const AsyncValue.loading();
        state = await AsyncValue.guard(() async {
            // TODO: 投稿の送信処理
        });
    }
}

final composeProvider = AsyncNotifierProvider<ComposeNotifier, void>(() {
    return ComposeNotifier();
});
```

```dart
class ComposePage extends ConsumerStatefulWidget {
    const ComposePage({super.key});

    @override
    ConsumerState<ComposePage> createState() => _ComposePageState();
}

class _ComposePageState extends ConsumerState<ComposePage> {
    final _textController = TextEditingController();

    @override
    void dispose() {
        _textController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        final postState = ref.watch(composeProvider);

        return Scaffold(
            appBar: AppBar(
                title: const Text('投稿作成'),
                actions: [
                    IconButton(
                        onPressed: () => ref
                            .read(composeProvider.notifier)
                            .post(_textController.text),
                        icon: const Icon(Icons.send),
                    ),
                ],
            ),
            body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    children: [
                        TextField(
                            controller: _textController,
                            decoration: const InputDecoration(hintText: 'いまどうしてる？'),
                        ),
                        if (postState.isLoading) const LinearProgressIndicator(),
                        if (postState.hasError) Text(postState.error.toString()),
                    ],
                ),
            ),
        );
    }
}
```

---

## ルーティング

# ルーティングとは？

- 画面遷移の定義と制御を行う仕組み
- 2つのアプローチが存在する
    - Navigator … 命令的ルーティング
        - `push()` / `pop()` を用いて遷移する
    - Router … 宣言的ルーティング
        - URLベースの定義。Web対応するならほぼ必須
        - `go_router` などライブラリを利用することが推奨されている
            - パラメーター・クエリ・遷移アニメーション対応

<!--
Navigation and routing | Flutter https://docs.flutter.dev/ui/navigation
-->

---

## ルーティング

# go_router で画面遷移

1. `go_router` を依存関係に追加
2. `lib/` 下に `router.dart` を追加し、`router` を定義
3. `main.dart` で `router` を設定
4. 各ページで遷移先を指定
    - `context.push()` / `context.pop()` が使えます

```dart
return MaterialApp.router(
    title: 'Flutter Demo',
    theme: ThemeData(
        colorScheme: AppColors.toColorScheme(),
        textTheme: AppTextStyles.toTextTheme(),
    ),
    routerConfig: router,
);
```

```dart
final router = GoRouter(
    routes: [
        GoRoute(path: '/', builder: (context, state) => const TimeLinePage()),
        GoRoute(path: '/compose', builder: (context, state) => const ComposePage()),
    ],
);
```

---

<!-- {"layout": "section"} -->

# 送信処理

---

## 送信処理

# Nostrの投稿には署名が必要

- 投稿データ = JSONイベント
    ```json
    {
        "id": "イベントID",
        "pubkey": "ユーザーの公開鍵(ユーザーID)",
        "created_at": 1234567890,
        "kind": 1,
        "content": "投稿の本文",
        "sig": "署名"
    }
    ```
- 秘密鍵で署名する
    - bip340 … Schnorr署名に準拠したライブラリ
- 秘密鍵を保存する（=ユーザー作成機能をつける）なら
    - flutter_secure_storage … セキュアにローカルにデータを保存するライブラリ

<!--
bip340 | Dart package https://pub.dev/packages/bip340
flutter_secure_storage | Flutter package https://pub.dev/packages/flutter_secure_storage
-->

---

## 送信処理

# 投稿しよう

1. `bip340` を依存関係に追加
2. 秘密鍵の生成、イベント署名など関数を用意
   `utils/nostr.dart` など

```dart
/// イベントのIDを生成
String generateEventId(
    String pubkey,
    int createdAt,
    int kind,
    List<String> tags,
    String content,
) {
    final data = jsonEncode([0, pubkey, createdAt, kind, tags, content]);
    return sha256.convert(utf8.encode(data)).toString();
}

/// ランダムな16進数文字列を生成
/// 秘密鍵を生成するためにも使用する
String generateRandomHex([int length = 32]) {
    final rand = Random.secure();
    final bytes = List<int>.generate(length, (_) => rand.nextInt(256));
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
}

/// イベントの署名を生成
String signEvent(String privateKey, String eventId) {
    final aux = generateRandomHex();
    return sign(privateKey, eventId, aux);
}
```

<!--
bip340 | Dart package https://pub.dev/packages/bip340
-->

---

## 送信処理

# 投稿しよう

3. 投稿を署名して送信してみよう
4. 余裕があれば秘密鍵の保存をしてみよう

```dart
class Post {
    // ...
    factory Post.create({
        required String privateKey,
        required String pubkey,
        required int createdAt,
        required String content,
    }) {
        final id = generateEventId(pubkey, createdAt, 1, <String>[], content);
        return Post(
            id: id,
            pubkey: pubkey,
            createdAt: createdAt,
            content: content,
            sig: signEvent(privateKey, id),
        );
    }

    Map<String, dynamic> toEventJson() {
        return {
            'id': id,
            'pubkey': pubkey,
            'created_at': createdAt,
            'kind': 1, // 投稿
            'tags': <String>[], // タグは未実装
            'content': content,
            'sig': sig,
        };
    }
}
```

```dart
class ComposeNotifier extends AsyncNotifier<void> {
    late WebSocketChannel _channel;

    @override
    Future<void> build() async {
        _channel = WebSocketChannel.connect(
            Uri.parse('wss://mini-relay-5b7atwsxwa-an.a.run.app'),
        );
    }

    Future<void> post(String content) async {
        state = const AsyncValue.loading();
        state = await AsyncValue.guard(() async {
            final privateKey = generateRandomHex();

            final post = Post.create(
                privateKey: privateKey,
                pubkey: getPublicKey(privateKey),
                createdAt: DateTime.now().millisecondsSinceEpoch ~/ 1000,
                content: content,
            );

            _channel.sink.add(jsonEncode(['EVENT', post.toEventJson()]));
        });
    }
}
```

---

<!-- {"layout": "section"} -->

# テスト

---

## テスト

# アーキテクチャとテストの関係性

- テストしやすい設計とは？
    - 状態とUIの責務が分かれている
    - ロジックがウィジェットから独立している
    - DIにより依存対象を差し替えられる

> 今まで作ってきた構造は、すでに「テストしやすい」状態にある

---

## テスト

# Flutterにおけるテストの種類 (1)

- 単体テスト
    - 小さな単位のロジックを検証
    - ランタイムが高速
    - アプリの核となるロジックを高速かつ確実に保証する
- ウィジェットテスト
    - Widgetの表示内容や操作に対する動作を検証
    - 中程度の速度
    - UIが意図通りか、操作に応答するかを局所的に確認する

---

## テスト

# Flutterにおけるテストの種類 (2)

- ゴールデンテスト
    - 見た目が意図通りかを画像として検証
    - 基準画像（ゴールデンファイル）とのピクセル差分比較
    - デザインの不整合をCIで早期に検出する
- 統合テスト
    - アプリ全体の動作を検証
    - ユーザーが実際に操作する流れをシミュレートする
    - ネットワーク通信や画面遷移の一貫性を保証する

---

## テスト

# ウィジェットテストを書いてみよう

1. タイムラインから投稿画面への画面遷移のテストを書いてみよう
2. 余裕があるなら投稿作成のテストを書いてみよう
    - `ProviderScope(overrides: )` が利用できます

```dart
void main() {
    testWidgets('TimeLinePageでFABを押すとComposePageに移する', (
        WidgetTester tester
    ) async {
        await tester.pumpWidget(
            ProviderScope(child: MaterialApp.router(routerConfig: router)),
        );

        expect(find.text('タイムライン'), findsOneWidget);
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
        expect(find.text('投稿作成'), findsOneWidget);
    });
}
```

<!--
ProviderScope class - flutter_riverpod library - Dart API https://pub.dev/documentation/flutter_riverpod/latest/flutter_riverpod/ProviderScope-class.html
-->

---

## テスト

# ゴールデンテストを書いてみよう

- `PostCard` のテストを書いてみよう
- `alchemist` https://pub.dev/packages/alchemist を利用するのが簡単です

<!--
Betterment/alchemist: A Flutter tool that makes golden testing easy. https://github.com/Betterment/alchemist
-->

---

## テスト

# テストは銀の弾丸ではない

- 現実的な課題
    - テストは書いて終わりではなくメンテナンスする必要がある
    - UI変更に追従できないテストはすぐ”腐る”
    - （特にフロントエンドにおいて）TDDが必ずしも生産性を上げるとは限らない
- 現実的な運用
    - 価値の高い箇所に重点的に適用する。認証機能など
    - カバレッジよりも、変更に強い構造を優先する

---

## テスト

# CI/CD・監視

- 自動化による品質維持
    - テストはCIでの検証を前提にする
    - PR単位でのフィードバックで修正コストを抑える
    - 本番環境を見据えたビルド検証や段階的リリース
- テストで補えない領域への対応
    - テストが補足できない問題（パフォーマンス、設定ミスなど）も多い
    - メトリクス・ログ・トレースを使った継続的なシステム監視

> テストだけに依存しない設計と運用の仕組みが品質を支える

---

<!-- {"layout": "section"} -->

# UI品質保証

---

## UI品質保証

# ゴールデンテストの限界と代替案

- ゴールデンテストの課題
    - UIの見た目を画像で保証 → 画面変更に脆弱
    - 画像差分が生じるとfalse positive（偽陽性）が頻発
    - 実際に「目で確認したい」だけのケースも多い
- UIカタログがその代替になり得る
    - FlutterだとWidgetbookが代表的

<!--
Widgetbook - Review all UI changes of your Flutter app in seconds https://www.widgetbook.io
-->

---

## UI品質保証

# Widgetbookとは？

- Flutter製のUIカタログツール
- 各コンポーネントの「状態違い」を一覧で表示できる
- Webで言うStorybookのような、開発者（+ デザイナー）向けツール
- UIパーツの集約場所として活用できる

<!--
Widgetbook - Review all UI changes of your Flutter app in seconds https://www.widgetbook.io
Storybook: Frontend workshop for UI development https://storybook.js.org/
-->

---

## UI品質保証

# monorepo + design system

- `design_system` を中心に、`client` と `ui_catalog` でUIを共有
- UIとロジックの分離を強制しやすい

---

## UI品質保証

# 追加演習: Widgetbook を導入しよう

- Widgetbook で投稿カードを表示してみよう

---

## UI品質保証

# 実務での適用戦略

- UIテスト・レビューの実務構成
    - デザインシステムの運用
    - ゴールデンテスト + UIカタログ + QA
- UIが壊れてないことだけでなく、
  「意図通りに表示されているか」を確認したいならUIカタログが有効

---

<!-- {"layout": "section"} -->

# Flutter以外の選択肢と技術選定力

---

## Flutter以外の選択肢と技術選定力

# 技術選定でまず考えるべきこと

- 最初に問うべきこと
    - そもそもアプリを作るべきなのか？
    - ユーザーはどのような体験を求めているのか？
    - 何に対して一番コストをかけるべきか？
- 技術（フレームワーク）は目的を達成するための手段に過ぎない

---

## Flutter以外の選択肢と技術選定力

# Flutterが有効なケース

- チームが小さく、1コードベースで複数プラットフォームに対応したい
- 開発スピードと拡張性の両立が求められる
- UIが複雑すぎず、一貫した表現が求められる
- UIの制御を柔軟にしたい

---

## Flutter以外の選択肢と技術選定力

# Flutterを選ばない方がいいケース

- 各プラットフォームで最新・最良のUI/UXに準拠したい
- 特殊なハードウェアやセンサーAPIと深く連携する必要がある
- すでにネイティブの大規模なコードベースがある

---

## Flutter以外の選択肢と技術選定力

# Flutterを選ぶときの判断軸

- Flutterを選ぶなら
    - 目的が「スピード」「複数OS対応」「UIの統一性」である
    - Dart/Flutterの設計思想に共感できる
- Flutterに固執しない
    - ネイティブを選択しない損失を理解する
    - 他のクロスプラットフォームフレームワークも正解になり得る
        - 例: すでにWebアプリがありバックエンドがNode.jsで書かれている → React Nativeが有力候補

> 技術選定の前に、事業の前提を見直す

---

## Flutter以外の選択肢と技術選定力

# まとめ

- 技術選定の本質は前提と制約の理解
    - 誰のために、どんな価値を提供したいのか？
    - 何を優先して、どこを妥協するか？
    - 運用体制（人・時間・資金）は現実に即しているか？
- Flutterは強力なツールだが、万能ではない
- 技術から始めない、目的から始める

> 「何を作るか」「どう運用するか」

---

<!-- {"layout": "section"} -->

# まとめ・振り返り

---

## まとめ・振り返り

# 今日のゴールの再確認

- Flutterを使ってモバイルアプリ開発の基礎を理解する
- なぜFlutterを選ぶのか、選ばないのかを判断できるようになる
- 生成AIと協力して設計/開発できる状態になる

---

## まとめ・振り返り

# この研修で得たもの

- UI構築
    - 宣言的UI、デザインシステムとコロケーション
- 状態管理
    - ローカル状態とグローバル状態
    - ネットワーク通信、非同期処理
- テスト
    - 4つのテスト手法、現実的な適用法
- 技術選定
    - 目的から技術を選ぶ視点

---

## まとめ・振り返り

# 実際の現場でどう応用するか？

- プロトタイピング
    - Flutterならあらゆるプラットフォームで即座に動く画面が作れる
- 設計・レビュー
    - アーキテクチャ、状態とUIの責務分離をレビューできる
- 技術選定
    - 「Flutterにする？しない？」を根拠をもって議論できる

---

## まとめ・振り返り

# おまけ：「ぼくのかんがえたさいきょうのSNS」を作ろう

- 今日作ったアプリは…
    - WebSocketで実際のソーシャルネットワーク (Nostr) と接続している
    - 任意のリレーサーバーにアクセスすれば、リアルタイムに人の投稿が見える
    - UIや機能を拡張すれば、公開可能なSNSクライアントになる
- あとは:
    - いいね、リアクション、フォロー機能、プロフィール編集、ダイレクトメッセージ....

---
