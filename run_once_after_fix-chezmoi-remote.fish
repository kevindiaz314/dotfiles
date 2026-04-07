#!/usr/bin/env fish

set chezmoi_dir (chezmoi source-path)
set current_remote (git -C $chezmoi_dir remote get-url origin)

if string match -q "https://*" $current_remote
    git -C $chezmoi_dir remote set-url origin git@github.com:kevindiaz314/dotfiles.git
    echo "chezmoi remote switched to SSH"
else
    echo "chezmoi remote already using SSH"
end
