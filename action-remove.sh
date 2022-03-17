function actionRemove(){
  note=''

  case $1 in
    "--note")
      shift
      note=${1}
  esac

  # remove note
  removeNote $note
}

removeNote(){
  if [[ -n "${1}" ]]; then
    echo "--| do you really want to remove note: y (yes)"

    read decision;

    if [[ "$decision" == 'y' || "$decision" == 'yes' ]]; then
        rm ${1}

        if [[ $? ]]; then
          echo "note has been removed"
        else
          echo "error: note has not been removed"
        fi
    fi
  else
    echo "error: provide note"
  fi
}
