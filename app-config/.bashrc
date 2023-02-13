source /etc/env-vars.sh
alias ci="xclip -sel clip"
alias co="xclip -sel clip -o"

alias ls="lsd"
alias ll="lsd -la"

alias cdf='cd $(find . -type d 2>/dev/null | fzf)'
alias cda='cd / && cdf'
alias cdh='cd ~ && cdf'
alias cde='cd /etc/nixos'

alias xda='cd / && fzf-xdg'
alias xdh='cd ~ && fzf-xdg'
alias xdf='fzf-xdg'

alias ns="nix-shell"

# https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete
function _dotnet_bash_complete()
{
  local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n'
  local candidates

  read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)

  read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
}
complete -f -F _dotnet_bash_complete dotnet


if [ -z "$DISABLE_STARSHIP" ]; then
    eval "$(starship init bash)"
fi

