AUTO_DEPLOY="auto-deploy"
if [ -d "$AUTO_DEPLOY" ]; then
    git clone -b master https://github.com/Magestore/WebPOS-Magento2-New "$AUTO_DEPLOY"
else
    cd "$AUTO_DEPLOY"
    git pull
fi
