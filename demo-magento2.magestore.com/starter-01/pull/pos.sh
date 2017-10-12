DIRECTORY="webpos"
if [ -d "$DIRECTORY" ]; then
    git clone -b Omnichannel https://github.com/Magestore/WebPOS-Magento2-New "$DIRECTORY"
    cd "$DIRECTORY"
else
    cd "$DIRECTORY"
    git pull
fi
chown -R www-data:ftpuser *
cp -R -p * ../../