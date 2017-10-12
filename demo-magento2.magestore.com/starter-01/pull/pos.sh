DIRECTORY="webpos"
if [ -d "$DIRECTORY" ]; then
    cd "$DIRECTORY"
    git pull
else
    git config --global credential.helper 'cache --timeout=99999999999'
    git clone -b Omnichannel https://github.com/Magestore/WebPOS-Magento2-New "$DIRECTORY"
    cd "$DIRECTORY"
fi
chown -R www-data:ftpuser *
cp -R -p * ../../