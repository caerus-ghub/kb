function actionList(){

  width=$(tput cols)
  previewConfig=""

  # set preview
  if (( width > 100 )); then
    previewConfig="right:50%"
  else
    previewConfig="up:50%"
  fi

  # list notes in fzf
  find -type f \
  | \
  fzf \
    --preview "bat --color=always --style=numbers -l markdown {}"\
    --multi\
    --bind "ctrl-a:execute(kb --action add --note {q})+abort"\
    --bind "ctrl-d:execute(kb --action remove --note {})+abort"\
    --bind "enter:execute(kb --action edit --note {})+abort"\
    --preview-window "${previewConfig}"
}
