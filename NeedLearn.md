
# Need learn
===
## ssh key
```
$ ls ~/.ssh 
# ls your ssh key

$ ssh-keygen
# create a ssh key

$ cat ~/.ssh/xxx.pub | pbcopy
# copy your public key
`pbcopy` // mac's keyboard shortcut, can let user copy what they want to copy

# Adding your SSH key to the ssh-agent
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#adding-your-ssh-key-to-the-ssh-agent
```
## knife-solo
```
安裝knife-solo時發生ruby版本過舊
於是`$ brew upgrade ruby`
安裝了最新版本但`$ ruby -v`仍然是舊本
所以`$ brew link ruby`如果還行就要
`$ brew link --overwrite ruby`
```

## chef(https://learn.chef.io/modules/learn-the-basics#/)

## ssh config
