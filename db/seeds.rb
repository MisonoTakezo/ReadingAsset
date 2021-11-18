# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup)
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1  = User.create!(
  name: "user1",
  bio: "this is user1",
  email: "user1@user.com",
  password: "password",
  status: :verified,
  remote_profile_image_url: "https://user-images.githubusercontent.com/40426755/142000286-a79180a2-685a-4c24-85ba-b3357afa87cd.jpg"
)

user2  = User.create!(
  name: "user2",
  bio: "this is user2",
  email: "user2@user.com",
  password: "password",
  status: :verified,
  remote_profile_image_url: "https://user-images.githubusercontent.com/40426755/142000752-31453319-5e4d-47f8-8e99-678b887f5a1c.jpg"
)

user3  = User.create!(
  name: "user3",
  bio: "this is user3",
  email: "user3@user.com",
  password: "password",
  status: :verified,
  remote_profile_image_url: "https://user-images.githubusercontent.com/40426755/142001029-4375b47b-01cd-4343-9039-b26be2bd17aa.jpg"
)

author1 = Author.create!(
  name: "川村元気"
)

author2 = Author.create!(
  name: "中山七里"
)

author3 = Author.create!(
  name: "結城浩"
)

author4 = Author.create!(
  name: "Dustin"
)
author5 = Author.create!(
  name: "Boswell"
)

author6 = Author.create!(
  name: "Trevor"
)

author7 = Author.create!(
  name: "Foucher"
)

author8 = Author.create!(
  name: "恩田陸"
)

book1 = Book.create!(
  google_books_api_id: "GJHJMgEACAAJ",
  title: "世界から猫が消えたなら",
  image: "https://books.google.com/books/content?id=GJHJMgEACAAJ&printsec=frontcover&img=1&zoom=5&imgtk=AFLRE70lJqBzTksTD5ZQaGxKEfN3kL7WfVqe-08IBXZcXQbKOMiV4STZvNmCzhMIra5TTiDP7XxEX98JYN1Grp2W3A7UFbepLGnwX5KAVrjykELAG7TbX2buRfYsAihvqe29HLtlErJp&source=gbs_api",
  description: "僕の葬式。僕の枕元に集まる人はどんな人たちだろうか。かつての友達、かつての恋人、親戚、教師、同僚たち。そのなかで僕の死を心から悲しんでくれる人は、何人いるのだろうか。僕と猫と陽気な悪魔の7日間の物語",
  published_at: nil 
)

book2 = Book.create!(
  google_books_api_id: "Gcz4rQEACAAJ",
  title: "七色の毒",
  image: "https://books.google.com/books/content?id=Gcz4rQEACAAJ&printsec=frontcover&img=1&zoom=5&imgtk=AFLRE71HZAJczp_o8eKWPlYnGFLDohGwOZ8UPAEpk4j1Lv_FMzD4ivfGWNTVOP74rINgV9CYFsfVLlyn6P6llAYzgTWcm1dQ0RI7NoLsphphWCWYbA1jLJrd9DyNEWGlm47OPfQFZ9NO&source=gbs_api",
  description: "中央自動車道を岐阜から新宿に向かっていた高速バスが防護柵に激突。1名が死亡、重軽傷者8名の大惨事となった。運転していた小平がハンドル操作を誤ったとして逮捕されるも、警視庁捜査一課の犬養は事故に不審を抱く。死亡した多々良は、毎週末に新宿便を利用する際、いつも同じ席に座っていた。やがて小平と多々良の過去の関係が明らかになり...。(「赤い水」)人間の悪意をえぐり出した、どんでん返し満載のミステリ集!",
  published_at: nil
)

book3 = Book.create!(
  google_books_api_id: "vmfvDwAAQBAJ",
  title: "数学ガールの秘密ノート／複素数の広がり",
  image: "https://books.google.com/books/publisher/content?id=vmfvDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE73Z78dGfKFbTDql43v1xSVxRXZoblk-_KPv5sCANWZ2kP2jPtZyhuOb9kye2PQuqBSDxmrH9M0rTB--o0fJZo56b4rNrArdjMbiwbVRN7lhFd_9KA1KOSpG4bDkkejeSP0-pU03&source=gbs_api",
  description: "複素数を基礎の基礎から解き明かす。※この電子書籍は固定レイアウト型で配信されております。固定レイアウト型は文字だけを拡大することや、文字列のハイライト、検索、辞書の参照、引用などの機能が使用できません。「ぼく」と三人の数学ガール（ユーリ、テトラちゃん、ミルカさん）のトークを通して、「中高生レベルの数学を楽しく学ぶ『数学ガールの秘密ノート』シリーズの最新作。本書のテーマは、多くの人が苦手意識をもつ複素数です。抽象的で理解しにくい複素数の世界を、多数の図版を使ってやさしく解き明かしていきます。登場人物たちの楽",
  published_at:	"2020-07-07"
)

book4 = Book.create!(
  google_books_api_id: "Wx1dLwEACAAJ",
  title: "リーダブルコード",
  image: "https://books.google.com/books/content?id=Wx1dLwEACAAJ&printsec=frontcover&img=1&zoom=5&imgtk=AFLRE72lo8bJvShG_5zb70ZvfpSrATlTKhL-IAgknI7Agvk20-2FPZH4nY8EBSZOENExckARzSWE3FZsQYr7My1hd3uzdn1OzSTSxLV0q1UU0OzDvnse_xciUZ1ZVnSliDdHgn0wNBsD&source=gbs_api",
  description: "コードは理解しやすくなければならない。本書はこの原則を日々のコーディングの様々な場面に当てはめる方法を紹介する。名前の付け方、コメントの書き方など表面上の改善について。コードを動かすための制御フロー、論理式、変数などループとロジックについて。またコードを再構成するための方法。さらにテストの書き方などについて、楽しいイラストと共に説明する。日本語版ではRubyやgroongaのコミッタとしても著名な須藤功平氏による解説を収録。",
  published_at: nil
)

book5	= Book.create!(
  google_books_api_id: "bedAvgAACAAJ",
  title: "蜜蜂と遠雷",
  image: "https://books.google.com/books/content?id=bedAvgAACAAJ&printsec=frontcover&img=1&zoom=5&imgtk=AFLRE71g2DsdcRRDHAoS6SSyUC1sHjUwpHnXlf4jBHoB_UuPXIL0Sb3ADwRJzW8agS-d9acZOTfCobebm9sIhsEPvu8pFI1v_mctbVneQUlQaaOtin_rLnbj4G9JkttGrl3RtV3TKhON&source=gbs_api",
  description: "3年每に開催される芳ヶ江国際ピアノコンクール. 「ここを制した者は世界最高峰のS国際ピアノコンクールで優勝する」というジンクスがあり近年, 覇者である新たな才能の出現は音楽界の事件となっていた. 養蜂家の父とともに各地を転々とし自宅にピアノを持たない少年, 風間鹿16歲. かつて天才少女として国内外のジュニアコンクールを制覇しCDデビューもしながら13歲のときの母の突然の死去以来, 長らくピアノが弾けなかった栄伝亞夜20歲. 音大出身だが今は楽器店勤務のサラリーマンで妻子もおりコンクール年齡制限ギリギリ",
  published_at:	nil
)

book6 = Book.create!(
  google_books_api_id: "cgRLDwAAQBAJ",
  title: "プログラマの数学 第2版",
  image: "https://books.google.com/books/publisher/content?id=cgRLDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE72tR0T0Z6wm47Irvg9fJsVG4Jx-PfMOfMRI68b5LKMQeK3TmfGdA85c5XDPcWR9CM_VOQ84c8SPpMK1lU2WshemCOL9Qm4OlUKw7K0VKlFJwt6RrUyPzdmc1TcID0sNnc7sgrzD&source=gbs_api",
  description: "「機械学習への第一歩」を新たに加筆！！※この電子書籍は固定レイアウト型で配信されております。固定レイアウト型は文字だけを拡大することや、文字列のハイライト、検索、辞書の参照、引用などの機能が使用できません。プログラミングに役立つ「数学的な考え方」を身につけよう。2005年の刊行以来、数学書として異例の大ロングセラーを続けている前著の改訂版です。プログラミングや数学に関心のある読者を対象に、プログラミング上達に役立つ「数学の考え方」をわかりやすく解説しています。数学的な知識を前提とせず、たくさんの図とパズル",
  published_at: "2018-01-16"
)

books_authors1 =  BooksAuthor.create!(
  author: author1,
  book: book1
)

books_authors2 =  BooksAuthor.create!(
  author: author2,
  book: book2
)

books_authors3 =  BooksAuthor.create!(
  author: author3,
  book: book3
)

books_authors4 =  BooksAuthor.create!(
  author: author4,
  book: book4
)

books_authors5 =  BooksAuthor.create!(
  author: author5,
  book: book4
)

books_authors6 =  BooksAuthor.create!(
  author: author6,
  book: book4
)

books_authors7 =  BooksAuthor.create!(
  author: author7,
  book: book4
)

books_authors8 =  BooksAuthor.create!(
  author: author8,
  book: book5
)

books_authors9 =  BooksAuthor.create!(
  author: author3,
  book: book6
)

post1 = Post.create!(
  user: user1,
  book: book1,
  impression: "家族との関係やこれまでの出来事を振り返るきっかけになった。
いつ死んでも後悔しないように毎日を大切に生きたい。" 
)

post2 = Post.create!(
  user: user1,
  book: book2,
  impression: "犬養シリーズの短編集。 どんでん返しの帝王と呼ばれるだけあって、 短編なのに、先の読めない展開に読むスピードが止まらなかった。" 
)

post3 = Post.create!(
  user: user2,
  book: book3,
  impression: "面白かった。複素数平面は高校でやっていないからこそ、色々面白い性質とか知らないままでいたので、改めて学べてよかった。" 

)

post4 = Post.create!(
  user: user2,
  book: book3,
  impression: "面白かった。複素数平面は高校でやっていないからこそ、色々面白い性質とか知らないままでいたので、改めて学べてよかった。" 

)


post5 = Post.create!(
  user: user3,
  book: book4,
  impression: 'コードは書く時間より読まれる時間が長い。 原則として読みやすいコードかどうか。 読みやすいは、"行数が少ないこと"と"頭から順にシンプルで読みやすい"ことの良い落としどころをとること。 ・一度に頭に浮かばせることを絞る。 ・名前で意図を伝える。単語を厳密に用いる。 ・コードでわかることをコメントで書くことはむしろ悪。思考過程を書く。 ・スコープをなるべく絞る。 ・構造を統一して視認性を高める。 ・コメントでコードの欠陥をカバーしない、それはコードを改良すべき。 ・ネストを浅くする。'
)

post6 = Post.create!(
  user: user3,
  book: book5,
  impression: "ものすごく満足感があった！！音もない小説からその場にいるかのような躍動感のあるコンクールの会場が勝手に思い描かれる。音楽に興味ない私でもどんどん引き込まれていきました。誰かの演奏中のシーンがあれば、この人はどう思うんやろうと考えてた人がちゃんと出てきたり、プロって音楽に対してここまで想像力を膨らませて演奏するのかと感心した。分野は違えど自分の仕事もプロとしてここまで考え込んでできているか思い返すこともでき、すごくいい作品に出会えた。" 
)

post7 = Post.create!(
  user: user3,
  book: book6,
  impression: "計算機科学やアルゴリズムの背景にある最低限の数学理論をざっくり優しく。どれも平易な言葉でわかりやすく説明されており、またプログラミングではどのように活かされるのかを併せて詳細されているので、イメージを持って読み進めやすかった。以下引用。・「ゼロ」はシンプルなルールを作る・「論理」は２分割・「剰余」はグルーピング・「数学的帰納法」は２ステップで無限に挑む・「順列・組み合わせ」では性質を見抜くことが大切・「再起」は自分の中の自分を見つける・「指数的な爆発」は…・「計算不可能な問題」は原理的な限界を示す" 
)


