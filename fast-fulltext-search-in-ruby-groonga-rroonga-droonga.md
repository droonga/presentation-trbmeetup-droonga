# trbmeetup

subtitle
:   Fast fulltext search in Ruby, without Java
    -Groonga, Rroonga and Droonga-

author
:   YUKI Hiroshi

institution
:   ClearCode Inc.

allotted_time
:   30m

theme
:   groonga

# Fulltext search in Ruby?


  * タイトル
    * 日本語:
      Javaいらず！Rubyで高速全文検索 -Groonga, Rroonga, Droonga-
    * 英語:
      Fast full-text search in Ruby, without Java -Groonga, Rroonga and Droonga-

  * 内容
    * 日本語:
      Javaを使わずに大量のデータに対してRubyで高速に全文検索する方
      法としてGroonga/Rroonga/Droongaを使うやり方を紹介する。
    * 英語:
      Describe how to do full-text search for huge database
      in Ruby, with Groonga, Rroonga and Droonga, instead of
      using full-text search engine based on Java.

  * スピーカープロファイル:
    * 日本語:
      * 名前: 結城 洋志
      * 自己紹介:
        Droongaを開発したり、「Tree Style Tab（ツリー型タブ）」「Text Link（テキ
        ストリンク）」などのFirefox用アドオンを開発したり、日経Linux誌で技術解説
        マンガを連載したりしています。
        株式会社クリアコード所属。
    * 英語:
      * 名前: YUKI Hiroshi
      * 自己紹介:
        Officially, a developer of the Droonga project team, as an employee of
        ClearCode Inc.
        Personally, a developer of some Firefox add-ons, "Tree Style Tab", "Text
        Link", etc., and an author of a regular feature comic "Syskan-kei Joshi
        (System-administrator Girl)" on "Nikkei Linux".

概要：
大量のデータに対してRubyで高速に全文検索する方法について、
Javaベースの検索エンジンであるSolrを使わない別のやり方として
Groonga/Rroonga/Droongaを使うやり方を紹介する。



Rubyで何か作るならPure Rubyで作りたい！
JavaをRubyで呼び出すのは気持ち悪い！
そんなあなたにGroonga/Rroonga/Droonga。

Let's try rapid text search in Ruby with Droonga/Rroonga/Groonga (without Solr)

text search ("LIKE" in SQL) is slow for huge databases.

Sunspot: binding of Solr for Ruby and Rails
rapid text search
but... Solr is based on Java.

Rroonga/Droonga is based on Ruby, with libgroonga.
Java-free! Yeah!

libgroonga: full-featured text search engine library in C/C++
Groonga: simple front end for libgroonga (provide CLI and HTTP server)
Rroonga: binding of libgroonga for Ruby (provide low layer APIs)
Droonga: distributed full-featured text search engine based on Rroonga/libgroonga written in Ruby (replication and partitioning (sharding))
ActiveGroonga: ActiveRecord-like implementation for Groonga

Groonga is originally developed by MORI Daijiro, for a search service about "2ch": a major anonoymous online forum in Japan.
Because there are many many posts in every seconds, Groonga is designed to work with realtime indexing without reference lock.
Groonga has no transaction mechanism.

