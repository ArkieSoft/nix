{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = "
neofetch
eval \"$(oh-my-posh init bash --config ~/.config/nix/M365Princess.omp.json)\"

export BASH_SILENCE_DEPRECATION_WARNING=1

alias cd='z'
alias updoot='cd ~/.config/nix && nix flake update . && darwin-rebuild switch --flake .'
alias switch='cd ~/.config/nix && darwin-rebuild switch --flake .'
alias nixconfig='cd ~/.config/nix && nvim'
alias v='nvim'
alias orphanstomper='nix store gc && nix-collect-garbage'
alias arkiemail.com='ssh root@mail.arkannon.com'
alias arkannon.com='ssh wyatt@arkannon.com'
alias arkdesk='ssh -p 230 arkannon@arkannon.com'
alias sl='ls'
alias grep='grep --color=auto'


if [ -z \"$__NIX_DARWIN_SET_ENVIRONMENT_DONE\" ]; then
  . /nix/store/lr100jhkyg6sdbj46ymyrp4qr8dj414l-set-environment
fi

[[ $- != *i* ]] && return


";
  };
}
