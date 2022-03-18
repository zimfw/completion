completion
==========

Enables and configures smart and extensive tab completion.

This module calls `compinit` for you. You should remove any `compinit` calls from
your `~/.zshrc` when you use this module.

Initialize this module *after* all modules that add completion definitions, like
[zsh-users/zsh-completions] for example.

Many thanks to [Robby Russell](https://github.com/robbyrussell) and
[Sorin Ionescu](https://github.com/sorin-ionescu) for the original code.

Settings
--------

By default, the completion configuration is dumped to `${ZDOTDIR:-${HOME}}/.zcompdump`.
This file is produced to speed up the completion initialization. The file path
can be customized with the following zstyle:

    zstyle ':zim:completion' dumpfile '/path/to/.zsh_dumpfile'

Add the zstyle to your `~/.zshrc` before where the modules are initialized.

Zsh options
-----------

  * `ALWAYS_TO_END` moves cursor to end of word if a full completion is inserted.
  * `NO_CASE_GLOB` makes globbing case insensitive.
  * `NO_LIST_BEEP` doesn't beep on ambiguous completions.

[zsh-users/zsh-completions]: https://github.com/zsh-users/zsh-completions
