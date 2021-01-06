#requires -Version 2 -Modules posh-git

# Conda Environment
function Get-CondaEnvironmentName {
    $env:CONDA_DEFAULT_ENV
}

function Add-Separator {
	$prompt += Write-Prompt -Object $sl.PromptSymbols.PromptSeparator -ForegroundColor $sl.Colors.PromptForegroundColor
}

function Write-Theme {
    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )

    $prompt += Write-Prompt -Object "PS"
  
    $dir = Get-FullPath -dir $pwd
	Add-Separator
    $prompt += Write-Prompt -Object $dir -ForegroundColor $sl.Colors.DriveForegroundColor

    # Conda

    $conda_env = Get-CondaEnvironmentName
    if($conda_env) {
		Add-Separator
        $prompt += Write-Prompt -Object $conda_env  -ForegroundColor $sl.Colors.CondaColor
    }

    # Writes the drive portion
    
    $status = Get-VCSStatus
    if ($status) {
        $themeInfo = Get-VcsInfo -status ($status)
        $info = "$($themeInfo.VcInfo)".Split(" ")[3..6] -join ' '
		Add-Separator
        $prompt += Write-Prompt -Object "$($status.Branch)" -ForegroundColor $sl.Colors.GitDefaultColor
		if ($status.Working.Length -gt 0) {
			$prompt += Write-Prompt -Object $sl.PromptSymbols.GitDirtyIndicator -ForegroundColor $sl.Colors.WithForegroundColor
		}
    }
        
    if ($with) {
        $prompt += Write-Prompt -Object "$($with.ToUpper()) " -BackgroundColor $sl.Colors.WithBackgroundColor -ForegroundColor $sl.Colors.WithForegroundColor
    }

	Add-Separator
    $prompt
}

$sl = $global:ThemeSettings #local settings
$sl.GitSymbols.BranchSymbol = [char]::ConvertFromUtf32(0xE0A0)
$sl.PromptSymbols.PromptIndicator = ">" #[char]::ConvertFromUtf32(0x27A4)
$sl.PromptSymbols.BadPromptIndicator = "x" #[char]::ConvertFromUtf32(0x274C)
$sl.PromptSymbols.HomeSymbol = '~'
$sl.PromptSymbols.GitDirtyIndicator = "*"
$sl.Colors.PromptSymbolColor = [ConsoleColor]::Green
$sl.Colors.PromptHighlightColor = [ConsoleColor]::Blue
$sl.Colors.DriveForegroundColor = [ConsoleColor]::Cyan
$sl.Colors.WithForegroundColor = [ConsoleColor]::Red
$sl.Colors.GitDefaultColor = [ConsoleColor]::Green
$sl.Colors.CondaColor = [ConsoleColor]::Magenta
$sl.PromptSymbols.PromptSeparator = " "
