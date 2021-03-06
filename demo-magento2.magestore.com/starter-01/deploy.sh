SERVER_ROOT="/var/www"
MAGENTO_ROOT="/var/www/omnichannel/starter/01"
DEPLOY_PATH="demo-magento2.magestore.com/starter-01"
PACKAGE="packages"
AUTO_DEPLOY="auto-deploy"
DO_DEPLOY=0;

cd "$SERVER_ROOT"
sh "$AUTO_DEPLOY"/auto-deploy.sh

cd "$MAGENTO_ROOT"

if [ -d "$PACKAGE" ]; then
    cd ./
else
    mkdir "$PACKAGE"
fi

cd "$PACKAGE"

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/pos.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/im.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/starter.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh "$SERVER_ROOT"/"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/demotool.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

if [ "$DO_DEPLOY" = "1" ]; then
    cd ../
    php bin/magento setup:upgrade
    php bin/magento cache:clean
    chmod -R 777 var pub
fi


