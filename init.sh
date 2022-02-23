export DEST_DIR=`pwd`
export DIST_NAME=`basename $DEST_DIR`

if ! test -d $DEST_DIR/.git; then
    git init
fi
if ! test -f $DEST_DIR/.gitignore; then
    cp $MICROPROJECT_DIR/.gitignore $DEST_DIR
    git add .gitignore
    sed -i "s/TODO-PACKAGE-NAME/$DIST_NAME/g" .gitignore
    git commit -m"Add gitignore"
fi

export FORCE=false
export RUN_CONFIG=false
export RUN_PACKAGES=false

for arg in $*; do
    case "$arg" in
        --force|-f|-force) FORCE=true ;;
        up|yarn|upgrade|package|pkg) RUN_PACKAGES=true ;;
        files|make|cfg|conf|config) RUN_CONFIG=true ;;
    esac
done

if ! git diff --quiet || ! git diff --cached --quiet; then
    if test $FORCE = true; then
        git add .
        git commit -m"oops wip"
    else
        echo "You have unstaged stages" >&2
        exit 1
    fi
fi
