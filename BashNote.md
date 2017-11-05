# bash learning note
## 參考
鳥哥的私房菜(http://linux.vbird.org/)

## 安裝Linux 

### 安裝編譯核心模組所需套件

1. 確認 Linux 的版本
由於 Linux 的核心編譯程序中，若版本不符，將不能正確在系統中執行，可用檢查你的 Linux 。
```
#uname -a
```

2. 安裝編譯核心模組所需套件
```
#dns install kernel-devel
```

3. 有些第三方的套件帶有自動編譯核心模組的程序，可以在其更新時依需求自動執行核心模組編譯的程序。但是，要讓這個功能啟動，Linux 系統要先安裝一個 dkms 的套件
```
#dns install dkms

DKMS 全名為 Dynamic Kernel Module Support ，是由 Dell 所貢獻的一套 Linux 驅動程式安裝管理機制。
它提供一組統一的驅動程式管理方式，讓使用者不需要在檔案系統中找尋驅動程式源碼與編譯。
更可於載入 Linux kernel 時自動檢查需不需要為此 kernel 編譯驅動程式
```

4. 升級安裝套件
```
#dnf update
```

5. 如果是安裝virtualBox、加載他的外掛`VirtualBox Guest Additions installation`

## vim 常用快速鍵
```
在非編輯模式
0:游標移到當行的第一個字
$:游標移到當行的最後一個字
^:游標移到當行的第一個非空白的字

gg: 游標移到該文件第一行
G: 游標移到該文件最後一行
```

## command line 快速鍵
```
ctrl + a: 游標移動到指令最前面
ctrl + e: 游標移動到指令最後面
ctrl + u: 刪除整行
ctrl + k: 游標處向後刪除指令串
ctrl + d: 刪除游標所在位置的字元
ctrl + l: 相當於clear
ctrl + r: 進入歷史命令查找狀態、輸入關鍵字、尋找使用過的指令

```

## Note
- 如何得知目前正在使用的shell
```
echo $0
```

- standard outoput
```
1> ：以覆蓋的方法將『正確的資料』輸出到指定的檔案或裝置上；(replace)
1>>：以累加的方法將『正確的資料』輸出到指定的檔案或裝置上；(append)
2> ：以覆蓋的方法將『錯誤的資料』輸出到指定的檔案或裝置上；(error replace)
2>>：以累加的方法將『錯誤的資料』輸出到指定的檔案或裝置上；(error append)

ex. find /home -name > list_right 2> list_error #list_error會有內容 list_right沒有內容

將指令的資料全部寫入名為 list 的檔案中
[dmtsai@study ~]$ find /home -name > list 2> list  <==錯誤
[dmtsai@study ~]$ find /home -name > list 2>&1     <==正確
[dmtsai@study ~]$ find /home -name &> list         <==正確
```

- && ||

- cmd1 && cmd2 
  1. 若 cmd1 執行完畢且正確執行($?=0)，則開始執行 cmd2。
  2. 若 cmd1 執行完畢且為錯誤 ($?≠0)，則 cmd2 不執行。
- cmd1 || cmd2
  1. 若 cmd1 執行完畢且正確執行($?=0)，則 cmd2 不執行。
  2. 若 cmd1 執行完畢且為錯誤 ($?≠0)，則開始執行 cmd2。
  
- let bash中用來計算的指令

## bash 練習

- /bin/bash(Linux預設的shell)

```
#!/bin/bash 

name=tea 
#變數與變數內容以一個等號『=』來連結
#等號兩邊不能直接接空白字元
#變數名稱只能是英文字母與數字，但是開頭字元不能是數字
#通常大寫字元為系統預設變數，自行設定變數可以使用小寫字元，方便判斷
#取消變數的方法為使用 unset 
#變數內容若有空白字元可使用雙引號『"』或單引號『'』將變數內容結合起來，
 但雙引號內的特殊字元如 $ 等，可以保有原本的特性，如下所示：
 『var="lang is $LANG"』則『echo $var』可得『lang is zh_TW.UTF-8』
 單引號內的特殊字元則僅為一般字元 (純文字)，如下所示：
 『var='lang is $LANG'』則『echo $var』可得『lang is $LANG』

#可用跳脫字元『 \ 』將特殊符號(如 [Enter], $, \, 空白字元, '等)變成一般字元，如：
『myname=VBird\ Tsai』

#在一串指令的執行中，還需要藉由其他額外的指令所提供的資訊時，可以使用反單引號『`指令`』或 『$(指令)』。
 特別注意，那個 ` 是鍵盤上方的數字鍵 1 左邊那個按鍵，而不是單引號！ 例如想要取得核心版本的設定：
 『version=$(uname -r)』再『echo $version』可得『3.10.0-229.el7.x86_64』

#若該變數為擴增變數內容時，則可用 "$變數名稱" 或 ${變數} 累加內容，如下所示：
『PATH="$PATH":/home/bin』或『PATH=${PATH}:/home/bin』
```

```
version=$(uname -r)
ehoo $version 
#show your liunx version like 
3.10.0-229.el7.x86_64
```

```
echo "The word $name contains ${#name} chars" 
#show
The word tea contains 3 chars

echo ((2#111)) 
#show
7

echo "hey there"; echo "you there?" #二個命令間要加分號、否則會被認為是前一個指令繼續執行

var=10
if ["$var" -gt 0]; then echo "YES"; else echo "NO" #-gt:大於 -lt:小於 -eq:等於
fi
#show 
YES

someWord=tEsT
echo ${someWord^}
#show
TEsT

echo ${someWord^^}
#show
TEST
```

```
colors="red black white"

for col in $colors
do
    echo $col
done
#show
red
black
white

for col in "$colors"
do
    echo $col
done
#show
red black white

for col in '$colors'
do
    echo $colors
done
#show
$colors

```

```
let "y=((x=20, 10/2))"
echo $y

#show
5

var = DSLCoNnEctioN

echo ${var,}
#show
dSLCoNnEction

echo ${var,,}
#show
dslconnection

let val=500/2
val2=`ecjp $val`
#show
250
```

```
touch wood.txt
echo "here is something, use it" > wood.txt #把字寫到wood.txt裡
cat wood.txt
#show
here is something, use it

echo "something else" > wood.txt #會覆寫原本的字
cat wood.txt
#show
something else

echo "something more" >> wood.txt #會接在原本的字後面
cat wood.txt
#show
something else
something more

: > wood.txt #清空整個文件的字
cat wood.txt
#show nothing

: >> wood.txt #不會有任何改變
```

```
var1=1+2+3            # '1+2+3' 預設爲字串
declare -i var2=1+2+3 # 6  使用declare宣告爲數字
var3=$(( 1 + 2 + 3 )) # 6
((var4 = 1 + 2 + 3))  # 6  沒有等號兩邊不可空白問題，怎麼寫都行！  
```

```
echo \${test1, test2, test3}\$
#show
$test1$ $test2$ $test3$

echo \"{test1, test2, test3}\"
#show
"test1" "test2" "test3"

echo {0..9}
#show
0 1 2 3 4 5 6 7 8 9

```

```
hi = $(ls -la)
echo $hi
#show
all file
```
```
./test.sh -f config.conf -v --prefix=/home

在手工處理方式中，首先要知道幾個變量，還是以上面的命令行為例：

$0 ： ./test.sh,即命令本身，相當於C/C++中的argv[0]
$1 ： -f,第一個參數.
$2 ： config.conf
$3, $4 ... ：類推。
$# 參數的個數，不包括命令本身，上例中$#為4.
$@ ：參數本身的列表，也不包括命令本身，如上例為 -f config.conf -v --prefix=/home
$* ：和$@相同，但"$*" 和 "$@"(加引號)並不同，"$*"將所有的參數解釋成一個字符串，而"$@"是一個參數數組。如下例所示：

for arg in "$*"
do
    echo $arg
done

for arg in "$@"
do
    echo $arg
done

執行./test.sh -f config.conf -n 10 會打印：

#"$*"的輸出
-f config.conf -n 10 

#以下為$@的輸出
-f 
config.conf
-n
10

if [ -n $1 ]  #$1不为空
```


