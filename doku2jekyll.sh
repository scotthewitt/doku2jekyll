#Dokuwiki to jekyll script processor
#Using docker image
#usage doku2jekyll inputfile

FILENAME=$1

NAME=${FILENAME%%.*}

docker run --volume "`pwd`:/data" --user `id -u`:`id -g` pandoc/core --from dokuwiki --to markdown_strict -o $NAME.md $NAME.txt

echo -e "---\nlayout: default\npermalink:\ntitle:\n---\n$(cat $NAME.md)" > $NAME.md

echo $NAME.md written
