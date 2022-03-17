function actionAdd() {
  title=''
  category=''

  case $1 in
    "--category")
      shift
      category=${1%/*}
      category=${category#\.}
  esac

  echo -n "title: ";
  read title

  echo -n "category: "
  read -p "$category" category

  # create note
  addNote $title $category
}

function addNote() {
  file="${pathKb}${2}/${1}.md"

  echo "--| file: ${file}" >> ~/Pets/kb/log.txt

  if [[ -n $1 && -n $2 ]]; then

    # create category if it doesn't exist
    if [[ ! -f "${pathKb}${2}" ]]; then
        mkdir -p "${pathKb}${2}"
    fi

    # create note if it doesn't exist
    if [[ ! -f "$file" ]]; then
        touch "$file" && $EDITOR "$file"
    else
        echo "error: note already exists"
    fi

  elif [[ -n $1 ]]; then
      echo "error: provide note's title and category"
  fi
}