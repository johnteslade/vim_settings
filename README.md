## My Personal Vim Settings

Setup vundle in same level as vim_settings

```
git clone https://github.com/gmarik/Vundle.vim.git ~/code/Vundle.vim
vim +PluginInstall +qall
```

### Fullscreen

```
yum install wmctrl
```

### Install powerline fonts

```
https://github.com/Lokaltog/powerline-fonts
```

### Build command t

Needs ruby

```
yum install ruby ruby-devel
cd ~/.vim/bundle/Command-T/ruby/command-t/
ruby extconf.rb
make
```

## Fedora Fonts

### Ubuntu Fonts
http://blog.andreas-haerter.com/2011/07/18/tune-improve-fedora-fonts-typeface-ubuntu-like-sharp-fonts
http://blog.andreas-haerter.com/2011/07/18/install-ubuntufonts-fedora.sh

```
wget "http://blog.andreas-haerter.com/_export/code/2011/07/18/install-ubuntufonts-fedora.sh?codeblock=1" -O "/tmp/install-ubuntufonts-fedora.sh"
chmod a+rx "/tmp/install-ubuntufonts-fedora.sh"
su -c "/tmp/install-ubuntufonts-fedora.sh"
```

### Hack Font

```
dnf copr enable heliocastro/hack-fonts
dnf install hack-fonts
```

## Bash prompt

https://github.com/twolfson/sexy-bash-prompt
