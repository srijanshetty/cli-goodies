Introduction
------------

These are a bunch of antigen/oh-my-zsh/prezto compatible shell scripts which make me productive on the commandline.

Installation
------------

I use [Prezto](https://github.com/sorin-inoescu/prezto) to manage `zsh`; ergo this repository should work seamlessly with it, with close to no impact to shell load time.

### Installing under [Prezto](https://github.com/sorin-ionescu/prezto)

    cd .zprezto
    git submodule add https://github.com/srijanshetty/cli-goodies.git modules/cli-goodies

Add `cli-goodies` to your `.zpreztorc` file:

    # Set the Prezto modules to load (browse modules).
    # The order matters.
    zstyle ':prezto:load' pmodule \
      'environment' \
      'terminal' \
      'editor' \
      'history' \
      'directory' \
      'spectrum' \
      'utility' \
      'completion' \
      'prompt' \
      'cli-goodies'

### Installing under oh-my-zsh

I haven't tried using `cli-goodies` with `oh-my-zsh` and I think the following should work in theory.

    wget https://raw.github.com/srijanshetty/cli-goodies/master/init.zsh -O $HOME/.oh-my-zsh/custom/cli-goodies.zsh

### Installing using [Antigen](https://github.com/zsh-users/antigen)

If you use [Antigen](https://github.com/zsh-users/antigen), adding the following line to `.zshrc` should load `cli-goodies`.

    antigen-bundle srijanshetty/zsh-dwim

### Using `cli-goodies` anywhere else

Anyone running `zsh` should only need to add the following line to their `.zshrc`:

    source init.zsh

Dependencies
------------

- You'll need to install `peru` to get the completions working. Peru is a simple file downloader with a declarative syntax. While `curl` could be used to accomplish the same, `peru` is simpler to read.
-

    pip install peru
    peru sync

Features
---------

## Completions

```
                              __     __  _
  _________  ____ ___  ____  / /__  / /_(_)___  ____  _____
 / ___/ __ \/ __ `__ \/ __ \/ / _ \/ __/ / __ \/ __ \/ ___/
/ /__/ /_/ / / / / / / /_/ / /  __/ /_/ / /_/ / / / (__  )
\___/\____/_/ /_/ /_/ .___/_/\___/\__/_/\____/_/ /_/____/
                   /_/
```

Completions for a bunch of commands collected in one place

- [_beet](https://github.com/sampsyo/beets/blob/master/extra/_beet)
- [_geeknote](https://github.com/s7anley/zsh-geeknote/master/_geeknote)
- [_git-annex](https://github.com/Schnouki/git-annex-zsh-completion/master/_git-annex)
- [_grunt](https://github.com/gruntjs/grunt-cli/master/completion/zsh)
- [_gulp](https://github.com/srijanshetty/gulp-autocompletion-zsh/master/_gulp)
- [_pip](https://github.com/srijanshetty/zsh-pip-completion/master/_pip)
- [_pandoc](https://github.com/srijanshetty/zsh-pandoc-completion/master/_pandoc)
- [_rvm](https://github.com/rvm/rvm/master/scripts/extras/completion.zsh/_rvm)
- [_sheet](https://github.com/oscardelben/sheet/master/contrib/completion/sheet.zsh)
- [_hub](https://github.com/github/hub/blob/master/etc/hub.zsh_completion)
- [_offline](https://github.com/srijanshetty/offline/blob/master/_offline)
- [_sdp](https://raw.githubusercontent.com/srijanshetty/sdp/master/_sdp)
- [_repos](functions/_repos)

## Scripts/Functions

```
        ___                             ___
  _____/ (_)     ____ _____  ____  ____/ (_)__  _____
 / ___/ / /_____/ __ `/ __ \/ __ \/ __  / / _ \/ ___/
/ /__/ / /_____/ /_/ / /_/ / /_/ / /_/ / /  __(__  )
\___/_/_/      \__, /\____/\____/\__,_/_/\___/____/
              /____/
```

- [cron-wallpaper](https://github.com/srijanshetty/cron-wallpaper): Change wallpapers using cron.
- [dnd](https://github.com/srijanshetty/dnd): DND mode for Elementary OS.
- [folder2md](https://github.com/srijanshetty/folder2md): Convert a directory tree to markdown.
- [offline](https://github.com/srijanshetty/offline): Stores commands when offline and execute later in batch.
- [pastebin](functions/pastebin): Create a pastie using [sprunge.us](http://sprunge.us)
- [proxy](functions/proxy): Enable/disable proxy settings.
- [repos](functions/repos): Helper for [myrepos](myrepos.branchable.com).
- [sdp](https://github.com/srijanshetty/sdp): scp for directories.
- [showtoiletfonts](functions/showtoiletfonts): Show available toilet fonts.
- [stats-cli](https://github.com/srijanshetty/stats-cli): Compute avg, sd, min, max from a list.
- [transfer](http://transfer.sh): Use [transfer.sh](https://transfer.sh) to transfer files from the CLI.
