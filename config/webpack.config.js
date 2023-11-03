
const path = require('path');

module.exports = {
  // ビルドの起点となるファイルの設定
  entry: './path/to/your/entry/file.js',
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