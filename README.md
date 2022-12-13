# Dotfiles

Instructions for the dotfile repository on <https://github.com/weibeld/dotfiles>.

```bash
git push -uf origin main
```

## Introduction

The dotfiles in this repository are installed using a **bare Git repository**. This method does not use symlinks (like most other dotfile repositories).

After the installation, all the dotfiles will be physically present in your home folder, yet, you will still have them under full version control.

## Installation

```bash
 sh -c "$(wget -O- https://gitlab.raphael-christopher.de/xmg/zsh-dotfile-bare/-/raw/main/deploy.sh)"
```

The URL <http://bit.ly/get-my-dotfiles> is simply a shortened link to the [dotfiles-install.sh](https://gist.github.com/weibeld/869f723063811e5088708a9386bf52bf#file-dotfiles-install-sh) file in this Gist, and the above command downloads this file and executes it in a sub-shell.

In particular, the `dotfiles-install.sh` file does the following:

- Clone the [dotfile repository](https://github.com/weibeld/dotfiles) to a bare Git repository into `~/.dotfiles`
- Move your existing dotfiles to `~/.dotfiles.backup`
- Check out all the dotfiles (and dot-directories) to your home directory

If you don't need your old dotfiles anymore, you can safely delete the created `~/.dotfiles.backup` directory.

## And Now?

Now all the dotfiles from the repository are installed in your home directory. However, as mentioned, you still have them under full version control via the bare Git repository in `~/.dotfiles`.

To interact with the bare Git repository, you need the following alias:

```bash
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Note: the [`.bashrc`](https://github.com/weibeld/dotfiles/blob/master/.bashrc) file in the dotfile repository already contains this alias definition, so you're fine to go.

With the `dotfiles` alias, you can now manage the dotfiles via the bare Git repository, just as you would with the `git` command:

Edited your dotfiles? No problem, commit and push the changes:

```bash
dotfiles add ~/.vimrc
dotfiles commit -m "Edit .vimrc"
dotfiles push
```

Pushed changes to the remote repository from another machine? Easy, just pull down the new version:

```bash
dotfiles pull
```

Want to know what's going on? Sure:

```bash
dotfiles status
```

## Submodules

The dotfile repository supports [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) (Git repositories within another Git repository).

The case for submodules occurs typically with Vim plugins, if you install them with [pathogen.vim](https://github.com/tpope/vim-pathogen) by cloning the respective Git repository into a directory under `~/.vim/bundle`.

Here are some common tasks when using submodules:

- Add a Vim plugin as a submodule to the repository:
  
  ```bash
    dotfiles submodule add https://github.com/tpope/vim-surround .vim/bundle/vim-surround
    dotfiles commit
    dotfiles push
    # Download files of submodule on local machine
    dotfiles submodule init
  ```

- Pull changes that inlude a newly added submodule on another machine:
  
  ```bash
    dotfiles pull
    dotfiles submodule init
    dotfiles submodule update
  ```

- List all submodules in the repository (including the commit that is used for each submodule):
  
  ```bash
    dotfiles submodule status
  ```

- Update the submodules in the repository to the newest commits:
  
  ```bash
    dotfiles submodule update --remote
    dotfiles add <changed_files>
    dotfiles commit
  ```

## References

The used installation method using a bare Git repository is described here:

- <https://gist.github.com/weibeld/869f723063811e5088708a9386bf52bf#file-readme-md/>
- <https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/>
