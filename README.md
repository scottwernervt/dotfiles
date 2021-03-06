DOTFILES
========

Themes, Fonts, and Plugins
------------------

 1. [otf-san-francisco-pro](https://aur.archlinux.org/packages/otf-san-francisco-pro/)
 1. [arc-gtk-theme](https://github.com/horst3180/arc-theme)
 1. [arc-icon-theme](https://github.com/horst3180/arc-icon-theme)
 1. [iterm2-material-design](https://github.com/MartinSeeler/iterm2-material-design)
 1. [Spaceship ZSH](https://denysdovhan.com/spaceship-prompt/)

Local Setup
-----------

* **Env Vars:** `touch $HOME/.local_aliases`
* **Aliases:** `touch $HOME/.local_aliases`

Modifying
---------

First, set user name and email for home repo:

    $ dgit config user.name "Scott Werner"
    $ dgit config user.email scott.werner.vt@gmail.com

A `dgit status` shows nothing, since we’ve gitignored everything:

    $ dgit status
    On branch master
    nothing to commit, working directory clean

We add things by overriding the ignore with `-f`:

    $ dgit add -f .profile 
    $ dgit commit -m "Added .profile"
    [master f437f9f] Added .profile
     1 file changed, 22 insertions(+)
     create mode 100644 .profile

We can push our configuration files to a remote repository:

    $ dgit remote add origin git@github.com:scottwernervt/dotfiles.git
    $ dgit push origin master
     * [new branch]      master -> master

And easily deploy them to a new machine:

    $ ssh someothermachine
    $ git clone git@github.com:scottwernervt/dotfiles.git ./.dotfiles
    $ alias dgit='git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME'
    $ dgit reset --hard
    HEAD is now at f437f9f Added .profile

References
----------

- [Keep your home dir in Git with a detached working directory](https://www.electricmonk.nl/log/2015/06/22/keep-your-home-dir-in-git-with-a-detached-working-directory/)
- [Dotfiles](https://ronvalente.net/posts/dotfiles)
