# Environment Variables
$env:HF_HUB_ENABLE_HF_TRANSFER=1
$env:HF_HUB_DISABLE_TELEMETRY=1

# Bash Aliases
Set-Alias which get-command
Set-Alias edit "C:\Program Files\Notepad++\notepad++.exe"

# Git
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
	function git {wsl.exe git $args}
}

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

# Posh Git
Import-Module posh-git

# Conda
if(Test-Path $HOME/.miniforge3){
	$CondaPath = "$HOME\.miniforge3" 
	(& "$CondaPath\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
}
if(Test-Path $HOME/.miniconda3) {
	$CondaPath = "$HOME\.miniconda3"
	(& "$CondaPath\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
}

# Starship Prompt
Invoke-Expression (&starship init powershell)
