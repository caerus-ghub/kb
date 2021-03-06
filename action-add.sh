function actionAdd() {
  title=''
  category=''

  case $1 in
    "--note")
      shift
      title=${1##*/}
      category=${1%/*}
      category=${category#\.}
  esac

  read -p "title: " -e -i "$title" -- title
  read -p "category: " -e -i "$category" -- category

  # create note
  addNote $title $category
}

function addNote() {
  note="${pathKb}/${2}/${1}.md"

  if [[ -n $1 && -n $2 ]]; then

    # create category if it doesn't exist
    if [[ ! -f "${pathKb}/${2}" ]]; then
        mkdir -p "${pathKb}/${2}"
    fi

    # create note if it doesn't exist
    if [[ ! -f "$note" ]]; then
        touch "$note" && $EDITOR "$note"
    else
        echo "error: note already exists"
    fi

  elif [[ -n $1 ]]; then
      echo "error: provide note's title and category"
  fi
}
