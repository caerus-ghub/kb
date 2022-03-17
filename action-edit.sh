function actionEdit() {
  note=''

  case $1 in
    "--note")
      shift
      note=${1}
  esac

  # open new note in editor
  < /dev/tty $EDITOR $note
}
