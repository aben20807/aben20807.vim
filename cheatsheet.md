## Comment
+ \<M-/\>: 如果未註解就加上註解, 反之解除註解
+ 支援一次選取多行 (v mode)

## Sourround
+ pat = ["'", '"', '(', '[', '{', '<']
+ \<leader\>s + pat: 左右加上 pat, 會自動對應, 支援v mode, 先按數字
+ \<leader\>d + pat: 左右刪除 pat
+ \<leader\>f + pat\_1 + pat\_2: 把 1 取代成 2

## Multiple cursor
+ \<C-o\>: 找下一個
+ \<C-p\>: 回上一個
+ \<C-x\>: 跳過一個

## Key mapping
t: N mode 游標下加一空行
T: N mode 游標上加一空行
\<C-n\>: NERDTree
\<C-t\>: taglist
\<M-a\>: ALEToggle
\<M-w\>: ale, last error or warning
\<M-e\>: ale, next error or warning
\<F2\>: 行號顯示切換 (預設顯示)
\<F3\>: 對其符號顯示切換 (預設顯示)
\<F4\>: 針對c, c++, python增加開頭作者資訊, 若已存在則更新時間
\<F5\>: 針對c, c++, python編譯並執行, markdown開啟瀏覽器查看排版
\<F6\>: 到上一個buffer分頁
\<F7\>: 儲存後到下一個buffer分頁, i mode: completor toggle
\<F10\>: 不儲存就離開 (:q!)
\<F11\>: 儲存 (:w), 大部分為全螢幕
\<F12\>: 儲存後離開 (:wq)
\<ctrl-方向鍵\>: 分屏間移動
\<ctrl-shift-方向鍵\>: 移動分屏
\<M-n\>: 關閉搜尋結果
\>\>: 向右縮排, tab in v mode
\<\<: 向左縮排, S-tab in v mode

## Basic tip
w: 移到下一個單字字首 (特殊字元, 英數字獨立)
W: 移到下一個單字字首 (純粹看空白分割單字)
b: 移到上一個單字字首 (特殊字元, 英數字獨立)
B: 移到上一個單字字首 (純粹看空白分割單字)

^: 移到行首
$: 移到行尾
(: 移到上一個區塊 (空行間隔)
): 移到下一個區塊 (空行間隔)

h: 左移
j: 下移
k: 上移
l: 右移

H: 移到視窗最上行
L: 移到視窗中間行
M: 移到視窗最下行

gg: 移到文件首
G: 移到文件尾

n-: 相對上移n行 (n為正整數
n+: 相對下移n行

''(兩個單引號): 移到跳來之前的行
``(兩個反單引號): 移到跳來之前的字元

u: 上一步
ctrl + r: 重作

y: 複製
Y, yy: 複製整行
d, x: 剪下
dd: 剪下整行
D: 剪下游標到行尾
X: 剪下游標前一字元
p: 游標後貼上, 若整行則貼在所在行的下一行
P: 游標前貼上, 若整行則貼在所在行的上一行

i: 游標處進入insert模式
I: 到行首insert
o: insert所在行下方
O: insert所在行上方
a: 游標後insert模式, 類似加入在後方
A: 到行尾insert
s: 刪除游標處字母後insert
S, C, cc: 刪除整行後insert
r: normal模式下取代一個字母
R: 進入replace模式下取代, 直到回到normal
v: 選取模式(字元)
V: 選取模式(整行)
ctrl+v: 選取模式(區塊)

fx: 在行中尋找下一個x (x可為任何字元

~: 交換大小寫

qx: 錄製macro至暫存器x (x可為任何字元
@x: 使用暫存器x裡的macro
@@: 使用最近使用的macro
