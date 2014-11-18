vim_settings
============

My Personal Vim Settings

Setup vundle in same level as vim_settings

   git clone https://github.com/gmarik/Vundle.vim.git ~/code/Vundle.vim
   vim +PluginInstall +qall

Install powerline fonts

   https://github.com/Lokaltog/powerline-fonts

Build command t

Needs ruby

   yum install ruby ruby-devel

   cd ~/.vim/bundle/Command-T/ruby/command-t/
   ruby extconf.rb
   make
