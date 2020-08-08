#! /bin/zsh

WIN=$(xprop -id $(xprop -root -f _NET_ACTIVE_WINDOW 0x " \$0\\n" _NET_ACTIVE_WINDOW | awk "{print \$2}"))
WINDOW_CLASS=$(echo $WIN | awk '/WM_CLASS/{print $4}' | tr --delete \")
WINDOW_NAME=$(echo $WIN | awk '/WM_NAME\(STRING\)/{print $3}')

if [[ "$WINDOW_CLASS" == "Termite" ]] && [[ $WINDOW_NAME =~ tmux ]]
then
  echo $(tmux list-windows | grep '(active)' | awk '{print $2}' | sed 's/\*//')
else
  echo $WINDOW_CLASS
fi
