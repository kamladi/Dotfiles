#!/bin/bash
# bash_aliases

alias smlnj='rlwrap /usr/local/smlnj-110.75/bin/sml'
alias sml='smlnj'

#folder/remote server shortcuts
CMU="/Users/kamladi/Dropbox/CMU"
alias cmu='cd $CMU'
SOPH='cd $CMU/Soph\ Spring/'
UNIX="kamladi@unix.andrew.cmu.edu"
ECE="kamladi@ece005.ece.cmu.edu"

#filesystem shortcuts
alias ..='cd ..'
alias ...='cd ../../'
alias ~='cd ~'
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias la="ls -a"
alias prev='cd -'
function cdl { cd $1; ls;}
function mcd() { mkdir -p "$1" && cd "$1"; }

#misc aliases
alias myip='curl ip.appspot.com'
alias please="sudo"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias dec2hex='printf "%x\n" $1'
alias hex2dec='printf "%d\n" 0x$1'
alias ccat='pygmentize -O bg=dark'
alias stfu="osascript -e 'set volume output muted true'"
alias pumpit="osascript -e 'set volume 7'"

#run a local server at the current directory
serve(){
	if [ -z "$1" ]
	then
		port=80
	else
		port=$1
	fi
 	python -m SimpleHTTPServer $port
}

#merge multiple PDFs to one PDF file
pdfmerge()
{
  tomerge="";
  for file in "$@"; do
    tomerge=$tomerge" "$file;
  done
  pdftk $tomerge cat output mergd.pdf;
}

#download youtube video to mp3 audio file
mp3() {
  youtube-dl $1 --extract-audio --title --audio-format mp3
}

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

#git aliases
alias gs="git status"
alias gb="git branch"
alias gc="git commit -m "
alias gpom='git push origin master'
alias gdiff='git diff|tig'
alias pubkey="more ~/.ssh/id_rsa.public | pbcopy | echo '=> Public key copied to pasteboard.'"
