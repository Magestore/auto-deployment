DO_DEPLOY=0
REPO="Storecredit-Magento2"
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
chown -R www-data:ftpuser *
cp -R -p * ../../
echo $DO_DEPLOY
