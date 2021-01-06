
#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& $HOME"\.miniconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion

# Bash Aliases
Set-Alias which get-command
Set-Alias edit "C:\Program Files (x86)\Notepad++\notepad++.exe"

# Oh My Zsh Git Plugin Aliases
Set-Alias g git
function gst {git 'status'}
function gss {git 'status' '-s'}
function gco {git 'commit' '-v'}
function ga {git add $args }
function gd {git 'diff' $args }
function gcb {git "checkout" "-b" $args }
function glg {git "log" "--stat" }
function glog {git "log" "--oneline" "--decorate" "--graph" }
function glols {git "log" "--oneline" "--decorate" "--graph" "--stat" }

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme SimplePrompt
