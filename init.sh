export DEST_DIR=`pwd`
export DIST_NAME=`basename $DEST_DIR`

if ! test -d $DEST_DIR/.git; then
    git init
fi
if ! test -f $DEST_DIR/.gitignore; then
    cp $MICROPROJECT_DIR/.gitignore $DEST_DIR
    sed -i "s/TODO-PACKAGE-NAME/$DIST_NAME/g" .gitignore
    git add .gitignore
    git commit -m"Add gitignore"
fi

export FORCE=false
export RUN_CONFIG=false
export RUN_PACKAGES=false
export RUN_DEMO=false
export RUN_MAKEFILE=false
export BUMP_VERSION=none

for arg in $*; do
    case "$arg" in
        --force|-f|-force) FORCE=true ;;
        package|pkg) RUN_PACKAGES=true ;;
        up|upgrade) RUN_PACKAGES=true ;;
        files) RUN_CONFIG=true ;;
        demo) RUN_DEMO=true ;;
        makefile|make) RUN_MAKEFILE=true ;;
        bump-patch|patch*) BUMP_VERSION=patch ;;
        bump-minor|minor*) BUMP_VERSION=minor ;;
        bump-major|major*) BUMP_VERSION=major ;;
        all)
            RUN_PACKAGES=true
            RUN_CONFIG=true
            RUN_DEMO=true
            RUN_MAKEFILE=true
            ;;
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

if test y"$TMUX" = y; then
    tmuxify stop
fi
mkdir -p $DEST_DIR/dist
if find $DEST_DIR/*zip -maxdepth 0 &>/dev/null; then
    mv -fv $DEST_DIR/*zip $DEST_DIR/dist
fi
if find $DEST_DIR/*gz -maxdepth 0 &>/dev/null; then
    mv -vf $DEST_DIR/*gz $DEST_DIR/dist
fi
test -f $DEST_DIR/Makefile && make clean
git pull
