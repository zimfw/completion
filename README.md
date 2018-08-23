completion
==========

Enables and configures smart and extensive tab completion.

Completions are sourced from
[zsh-completions](https://github.com/zsh-users/zsh-completions).

Settings
--------

By default, the configuration is dumped to `${ZDOTDIR:-${HOME}}/.zcompdump`.
This file is produced to speed up the completion initialization. The file path
can be customized with the following zstyle:

    zstyle ':zim:completion' dumpfile '/path/to/.zcompdump-custom'

Contributing
------------

Command completions should be submitted [upstream to
zsh-completions](https://github.com/zsh-users/zsh-completions).
