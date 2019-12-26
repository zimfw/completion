completion
==========

Enables and configures smart and extensive tab completion.

Additional completion definitions are available in the [zsh-completions]
module. This module must be sourced *after* it.

Settings
--------

By default, the configuration is dumped to `${ZDOTDIR:-${HOME}}/.zcompdump`.
This file is produced to speed up the completion initialization. The file path
can be customized with the following zstyle:

    zstyle ':zim:completion' dumpfile '/path/to/.zsh_dumpfile'

Zsh options
-----------

  * `ALWAYS_TO_END` moves cursor to end of word if a full completion is inserted.
  * `PATH_DIRS` performs path search even on command names with slashes in them.
  * `NO_CASE_GLOB` makes globbing case insensitive.
  * `NO_LIST_BEEP` doesn't beep on ambiguous completions.

[zsh-completions]: https://github.com/zsh-users/zsh-completions
