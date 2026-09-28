<img width="1255" height="580" alt="image" src="https://github.com/user-attachments/assets/ac2cb35b-04ce-4bfa-99e5-bf5b9eb2c1ca" />

## ADD NEW FOLDER: 
```shell
dot add ~/.config/hypr ~/.config/folder
dot commit -m "feat: add stuff"
```

## PUSH: 
```shell
dot push -u origin main
```

## CLONE: 
```shell
git clone --bare git@github.com:whlongg/dotfiles.git $HOME/.dotfiles
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -f
```

## CREATE ALIAS:
```shell
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot config --local status.showUntrackedFiles no
```
