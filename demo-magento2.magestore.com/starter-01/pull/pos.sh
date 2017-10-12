DIRECTORY="webpos"
if [ -d "$DIRECTORY" ]; then
    cd "$DIRECTORY"
    STATUS=`git pull`
    if [ "$STATUS" -ne "Already up-to-date." ]; then
        DO_DEPLOY=1
    fi
else
    git config --global credential.helper 'cache --timeout=99999999999'
    git clone -b Omnichannel https://github.com/Magestore/WebPOS-Magento2-New "$DIRECTORY"
    cd "$DIRECTORY"
    DO_DEPLOY=1
fi
chown -R www-data:ftpuser *
cp -R -p * ../../