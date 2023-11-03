
const path = require('path');

module.exports = {
  // ビルドの起点となるファイルの設定
  entry: './path/to/your/entry/file.js',
  resolve: {
    fallback: {
      "dgram": false,
      "fs": false,
      "net": false,
      "tls": false,
      "child_process": false,
      // その他の必要に応じてポリフィルが必要なモジュール
    }
  },
  node: {
    global: false, // 'global' のポリフィルを無効化
    __filename: false, // '__filename' のポリフィルを無効化
    __dirname: false, // '__dirname' のポリフィルを無効化
  },
  // ビルド後のファイルの出力設定
  output: {
    path: path.resolve(__dirname, 'dist'), // 出力ディレクトリの絶対パス
    filename: 'bundle.js' // 出力ファイル名
  },
  // モジュールに関する設定
  module: {
    rules: [
      {
        test: /\.js$/, // ローダーの処理対象ファイル
        exclude: /node_modules/, // 除外するディレクトリ
        use: {
          loader: 'babel-loader', // 使用するローダー
          options: {
            presets: ['@babel/preset-env'] // Babelのプリセット設定
          }
        }
      },
      {
        test: /\.css$/, // CSSファイルに対するルール
        use: [
          'style-loader', // スタイルをDOMに注入するローダー
          'css-loader' // CSSをJavaScriptに読み込むローダー
        ]
      }
      // 他のルールを追加する場合はここに追加
    ]
  },
  // 開発ツールの設定（例：ソースマップの利用）
  devtool: 'inline-source-map',
  // 開発サーバの設定
  devServer: {
    contentBase: './dist'
  }
};