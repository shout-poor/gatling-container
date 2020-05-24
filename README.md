shout-poor/gatling-container
====

## このリポジトリは

[Gatling](https://gatling.io/) を簡単に使用するためのコンテナ定義等を格納している。

## 構成

```
gatling-client
├── README.md               # このファイル
├── Dockerfile              # Gatling コンテナを定義するDockerfile
├── reports                 # 実行結果が出力されるディレクトリ
├── run-gatling.sh          # Gatling 起動スクリプト
└── simulations             # Simulation (負荷試験シナリオ) の格納ディレクトリ
```

## 使用方法

### 事前準備

* Docker (Docker CE または Docker Desktop) が必要です

### Simulation ファイルを作成する

* `simulations` ディレクトリ以下に、任意のパッケージディレクトリを作成し、負荷試験シナリオを記述した Simulation を格納する。
    * Simulation については [Gatling のドキュメント](https://gatling.io/docs/current/) を参照

### 実行する

* `run-gatling.sh` を実行すると、コンテナのビルド後、Gatling が起動する。
* 複数の Simulation が格納されている場合、Simulation のリストが表示されるので、実行したいものを選択する (番号を入力)
* `Select run description (optional)` と表示され、実行するテストの説明の入力を促されるので、必要に応じて入力する。不要であればそのまま Enter を押す。
    * ここで入力した説明は、実行結果ファイルに出力されるので、複数パターンのテスト結果を区別したい場合などに使用できる。
* 選択した Simulation が実行され、エラーがなければ、 `reports` ディレクトリ以下に実行結果が格納される。