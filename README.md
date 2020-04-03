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

### Using `cli-goodies` anywhere else

Anyone running `zsh` should only need to add the following line to their `.zshrc`:

    source init.zsh

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

- [_aws](https://github.com/aws/aws-cli/blob/develop/bin/aws_zsh_completer.sh)
- [_doctl]()
- [_gcloud]()
- [_pandoc](https://github.com/srijanshetty/zsh-pandoc-completion/master/_pandoc)
- [_podman](https://github.com/containers/libpod/blob/master/completions/zsh/_podman)
- [_snips](https://github.com/srijanshetty/snips/blob/master/_snips)

## Other features
- Will document features for fzf, git, httpie, and other googness
