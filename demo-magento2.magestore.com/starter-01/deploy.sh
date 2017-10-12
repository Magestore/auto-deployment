MAGENTO_ROOT="/var/www/omnichannel/starter/01"
PACKAGE="packages"
AUTO_DEPLOY="auto-deploy"
DO_DEPLOY=0;

if [ -d "$PACKAGE" ]; then
    cd ./
else
    mkdir "$PACKAGE"
fi

cd "$MAGENTO_ROOT"

sh "$AUTO_DEPLOY"/auto-deploy.sh

cd "$PACKAGE"

sh ../"$AUTO_DEPLOY"/demo-magento2.magestore.com/starter-01/pull/pos.sh

if [ $DO_DEPLOY -eq 1 ]; then
    cd ../
    php bin/magento setup:upgrade
    php bin/magento cache:clean
    chmod -R 777 var pub
fi


