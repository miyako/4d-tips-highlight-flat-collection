# 4d-tips-highlight-flat-collection
リストボックスにフラットなコレクションを表示してハイライトをカスタマイズするには？

### 回避策の背景 

フラットなコレクション（オブジェクト型のコレクションではなく``This.value``で値が返されるタイプ）の場合，リストボックスのハイライト処理を制御するのが大変です。「コレクションまたはエンティティセレクション型」のリストボックスには，ハイライト処理を支援するためのプロパティが用意されていますが，基本的に**項目がオブジェクト型（エンティティを含む）であることが前提になっている**ためです。

* カレント項目：項目がオブジェクト型でない場合，何も返されません。
* カレント項目位置：項目の位置，つまり 1 を起点とする番号が返されます。
* 選択された項目：フラットなコレクションが返されます。

#### 問題点

「選択された項目」はわかっても，処理中の行がそれに含まれるのかどうかの判断ができません。値は``This.value``で取れますが，``collection.indexOf()``で選択された項目のコレクションをサーチすることはできますが，行を描画するたびに検索を実行するのでは速度的に問題がありますし，重複する値が含まれる場合，正しくない結果が返される可能性があります。

<img width="669" alt="Screen Shot 2020-06-28 at 11 36 58" src="https://user-images.githubusercontent.com/1725068/85936254-bb981b80-b933-11ea-91ce-d9a03d16b6ef.png">

#### 回避策

``This.value``は残しつつ，``This.pos``で位置も取れるようにコレクションを加工することができます。

```4d
$items.index:=Formula(This.col:=This.col.map("map_flat_collection";New object("pos";1)))
```

```4d
// map_flat_collection
C_OBJECT($1;$2)

$1.result:=New object("value";$1.value;"pos";$2.pos)

$2.pos:=$2.pos+1
```

メタ情報式には「選択された項目」そのものではなく，``collection.extract("pos")``のように選択された項目の位置をコレクションで渡します。これと``This.pos``を照合することにより，ハイライト処理をカスタマイズすることができます。

```4d
C_LONGINT($1;$pos)
C_COLLECTION($2;$sel)
C_OBJECT($3;$4;$0)

$pos:=$1
$sel:=$2

$isSelected:=($sel.indexOf($pos)#-1)

If ($isSelected)
	$0:=$3
Else 
	$0:=$4
End if 
```

<img width="669" alt="Screen Shot 2020-06-28 at 11 36 06" src="https://user-images.githubusercontent.com/1725068/85936244-97d4d580-b933-11ea-85c2-8d274c1af4b6.png">
