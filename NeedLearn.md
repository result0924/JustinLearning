
# Need learn
===
## ssh key
```
ls ~/.ssh 
#列出目前擁有的ssh key

ssh-keygen
#創造一個ssh key

cat ~/.ssh/xxx.pub | pbcopy
#直接copy公開金鑰
#pbcopy mac內建的複製快速鍵
```
## knife-solo
```
安裝knife-solo時發生ruby版本過舊
於是brew upgrade ruby
安裝了最新版本但ruby -v 仍然是舊本
所以brew link ruby如果還行就要
brew link --overwrite ruby
```

## chef(https://learn.chef.io/modules/learn-the-basics#/)

## ssh config
