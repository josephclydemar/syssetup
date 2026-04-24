## Installation
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Aliases for using `fzf` with `cd`, `nvim`, `tmux`
Add to `~/.bashrc`
```bash
# cd-fzf func
fzf_cd() {
  local dir

  dir=$(find . -type d | fzf --preview "pwd; echo ''; ls -l {}" --preview-window=down:3) || return
  cd "$dir" || return
}
alias cdf="fzf_cd"

# nvim-fzf func
fzf_nvim() {
  local file
  file=$(find . -type f | fzf --preview "pwd; echo ''; ls -l {}" --preview-window=down:3) || return
  nvim "$file" || return
}
alias nvimf="fzf_nvim"

# tmux-fzf func
fzf_tmux() {
  local dir

  dir=$(find . -type d | fzf --preview "pwd; echo ''; ls -l {}" --preview-window=down:3) || return
  tmux new-session -s "$dir" -c "$dir" || return
}
alias tmuxf="fzf_tmux"
```

