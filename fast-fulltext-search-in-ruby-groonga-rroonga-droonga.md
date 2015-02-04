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


# Introduction

How to do fulltext search
for huge database in Ruby?

# `LIKE` operator in SQL

~~~
SELECT name,location
  FROM Store
 WHERE name LIKE '%Tokyo%';
~~~

 * Easy, simple
 * Slow

# Fulltext search with indexing

![](images/latency.png){:relative_width="50" align="right"}

 * Fast

# 10000 records from Wikipedia(ja)

 * Simple `LIKE`: 1.3sec. per query
 * Fulltext search: 0.02-0.07sec. per query
 * *x20 faster!!*

# How introduce into your Ruby product?

[Sunspot](http://sunspot.github.io/)
: http://sunspot.github.io/

[elasticsearch-ruby](https://github.com/elasticsearch/elasticsearch-ruby)
: https://github.com/elasticsearch/elasticsearch-ruby

# Sunspot?

A binding of *Solr* for
Ruby and Rails (ActiveRecord)

~~~
class Post < ActiveRecord::Base
  searchable do
    ...
  end
end

result = Post.search do
  fulltext 'best pizza'
  ...
end
~~~

# elasticsearch-ruby?

A client library of *Elasticsearch* for Ruby

~~~
client = Elasticsearch::Client.new(log: true)
client.transport.reload_connections!
client.cluster.health
client.search(q: "test")
~~~

# But...

 * [Apache Solr](http://lucene.apache.org/solr/): "built on Apache Lucene™."
 * [Elasticsearch](http://www.elasticsearch.org/overview/elasticsearch/): "Build on top of Apache Lucene™"
 * [Apache Lucene](http://lucene.apache.org/): "written entirely *in Java*."

# In short

 * Both sunspot and elasticsearch-ruby require *Java*.
 * My Ruby product have to be combined with *Java*, to do fulltext search.

# Alternative choice

*Groonga*
and *Rroonga*

# Groonga?

 * Fast fulltext search engine written in *C++*

# Rroonga?

 * Low-level binding of Groonga for *Ruby*






# Droonga


# a



  * 内容
    * 日本語:
      Javaを使わずに大量のデータに対してRubyで高速に全文検索する方
      法としてGroonga/Rroonga/Droongaを使うやり方を紹介する。
    * 英語:
      Describe how to do full-text search for huge database
      in Ruby, with Groonga, Rroonga and Droonga, instead of
      using full-text search engine based on Java.

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

