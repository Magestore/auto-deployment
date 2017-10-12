DIRECTORY="webpos"
if [ -d "$DIRECTORY" ]; then
    cd "$DIRECTORY"
    git pull
else
    git clone -b Omnichannel https://github.com/Magestore/WebPOS-Magento2-New "$DIRECTORY"
    cd "$DIRECTORY"
fi
chown -R www-data:ftpuser *
cp -R -p * ../../