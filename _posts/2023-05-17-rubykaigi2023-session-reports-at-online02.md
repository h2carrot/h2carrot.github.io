---
layout: post
title: RubyKaigi2023 セッションレポート@オンライン参加
published_at: 2023-05-17
author: kcscarrot-hasumi
permalink: /2023/05/17-rubykaigi2023-session-reports-at-online02
categories: [Report, Tech]
tags: [Ruby]
---
こんにちは！H2開発グループのhasumiです。

今回は長野県松本市 まつもと市民芸術館で開催された、RubyKaigi2023にオンライン参加させていただきました。<br>
参加した感想や、気になったセッション等について書いていきたいと思います！！

### オンライン参加

オンラインでの参加だったので、会場の様子を実際に見ることは叶いませんでしたが、<br>
会場の熱気や、セッションの中でライブコーディングが始まった時など、<br>
参加されている皆様の歓声や笑い声が聞こえ、現地の盛り上がりが伝わってきました！<br>
同時にTwitterの#rubykaigiのハッシュタグを追いかけていたため、様々な情報を集めることができました。<br>

楽しそうな出展もたくさんあり、<br>
クックパッドさんの温度管理状況をリアルタイムでウォッチできる冷蔵庫や<br>
大変な混雑だったらしい各企業の限定ノベルティ等、気になるものがたくさんありました。<br>

オンオフどちらも良さがありますが、
離れていてもリアルタイムで現場の状況がわかることがたくさんある反面、<br>
実際に現地に行かないと味わえない部分はたくさんあると感じました。

### 気になったセッションは？

馴染みのある機能についてのものから、自分が全く知らない知識のものまでたくさんあり<br>
どれも興味深いものばかりでした。

中には難しくて頭がパンクしそうになったものも多々ありましたが、<br>
今回は特に気になったものについてレポートさせていただきます！

### <u>Fix SQL N+1 queries with RuboCop</u>

発表資料：[https://speakerdeck.com/sue445/fix-sql-n-plus-one-queries-with-rubocop](https://speakerdeck.com/sue445/fix-sql-n-plus-one-queries-with-rubocop)

@sue445さんによる「SQLのN+1クエリをRoboCopで自動修正する」がテーマのセッションで、<br>
[ISUCON(Iikanjini Speed Up Contest)](https://isucon.net/)でのN+1問題を感知するために作成された<br>
[rubocop-isucon](https://github.com/sue445/rubocop-isucon) というgemの紹介と、その作成の過程についてお話されていました。<br>
(※ActiveRecordではなく、クエリに対してのN+1検知になります)

ISUCONに特化したCopは現時点でも複数ありますが、<br>
rubocopを普段から使っていることとプラグイン機構であることから、rubocopを使用したと仰っていました。


- copからDBに接続してスキーマ情報を取得する<br>
  - twitterで「copからDBに接続...？！」というツイートが一斉に増えた瞬間を見ました。<br>
    これにより、indexが付いていないカラムをWHERE句で使用していた場合の検知ができるそうです。

- SQLのASTをRuboCopの世界に持ってくる
  - ASTの異世界転生<br>
    ただしlibgdaで取得したSQLのASTのnodeには位置情報が含まれていないため、<br>
    位置情報を取得する処理を自ら実装したとのこと......<br>
    これにより、N+1のオートコレクトが可能になったそうです。<br>
    (↓こちらはセッションを聞いている際に書いていた個人的なメモ。動揺が伝わります。)<br>
    ![image](/assets/images/rubocop_memo.png)

このセッションを聞く前は、
「業務でActiveRecordでは表せないような生のSQLを書くことがあったら<br>
このgemを使用して事前のN+1検知ができるのかも...？」
と考えたりもしましたが、<br>
視聴後に完全にISUCON専用のgemということがわかり、この考えは消失しました。<br>
Goで参戦するチームが多い中、絶対にRubyを使って速さを追求してみせる、という情熱が伝わってきた30分間でした。

「ISUCON は総合格闘技です」

### 松本市
せっかくなので、私も松本駅からまつもと市民芸術館までGoogleMapで散策してみました。(？)<br>

長野県は軽井沢にしか行ったことがないので、オンラインとはいえ初めて見る街にワクワクです。<br>
向かう途中にはおしゃれなカフェや美味しそうなレストランがたくさんあって、近くには素敵な公園もあって......<br>
何より周りを見渡すと大きな山に囲まれている景色が最高です、空気が綺麗！(※GoogleMap)<br>

今度個人的に行きたいと思います。

### 参加できて良かった

「Rubyを使って実現したいこと」がテーマになっていて、とても面白かったです。<br>
普段業務としてRuby on Railsを使っているだけでは得られない知識がたくさんありました。<br>
また、Matz Keynoteでは、Rubyは今年で生まれて30年で、<br>
その間様々な人からのフィードバックや支えあいがあり今に至るとお話されていました。<br>
Rubyは人と繋がることで進化していく言語だと感じ、<br>
コミュニティの場では対話が一番大事だと実感しました。
