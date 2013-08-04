关键词：推文, 中文, 乱码, CSV, Excel, JSON, 推文下载, Tweet Archive

含有 UTF8 字符推文的 Tweets Archive CSV 文件生成
============================

将含有 UTF-8 字符的 Tweets Archive 导出文件中的 JSON 转换成一个大 CSV 文件

开发环境：Ruby 1.9.3-p327，操作系统：Mac OS X 10.8.2

除 Ruby 标准库外没有任何依赖。

---

将下载的 Tweets ZIP 压缩包解开

得到一个 tweets 目录

运行：

    ./tweets_json2csv.rb <data/js/tweets 所在目录>

或者

    ruby ./tweets_json2csv.rb <data/js/tweets 所在目录>

执行后将在当前目录生成：

my_tweets_archive_natural.csv（推文按照先后顺序排列）

my_tweets_archive_timeline.csv（推文按时间线顺序排列）
