DO_DEPLOY=0
REPO="SupplierSuccess"
DIRECTORY=$REPO
if [ -d "$DIRECTORY" ]; then
    cd "$DIRECTORY"
    STATUS=`git pull`
    if [ "$STATUS" != "Already up-to-date." ]; then
        DO_DEPLOY=1
    fi
else
    git config --global credential.helper 'cache --timeout=99999999999'
    git clone -b master https://github.com/Magestore/"$REPO" "$DIRECTORY"
    cd "$DIRECTORY"
    DO_DEPLOY=1
fi

if [ "$DO_DEPLOY" = "1" ]; then
    chown -R www-data:www-data *
    rm -rf ../../app/code/Magestore/SupplierSuccess
    mkdir ../../app/code/Magestore/SupplierSuccess
    cp -R -p * ../../app/code/Magestore/SupplierSuccess
fi

echo $DO_DEPLOY