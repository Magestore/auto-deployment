MAGENTO_ROOT="/var/www/omnichannel/starter/01"
PACKAGE="packages"
AUTO_DEPLOY="auto-deploy"
cd "$MAGENTO_ROOT"
cd "$PACKAGE"
sh ../"$AUTO_DEPLOY"/demo-magento2.magestore.com/starter-01/pull/pos.sh
cd ../
php bin/magento setup:upgrade
php bin/magento cache:clean
chmod -R 777 var pub


