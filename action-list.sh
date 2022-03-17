function actionList(){

  # list notes in fzf
  find -type f \
  | \
  fzf \
    --preview "bat --color=always --style=numbers -l markdown {}"\
    --multi\
    --bind "ctrl-a:execute(kb --action add --category {})+abort"\
    --bind "ctrl-d:execute(kb --action remove --note {})+abort"\
    --bind "enter:execute(kb --action edit --note {})+abort"\
    --preview-window "up:50%"
}
