SERVER_ROOT="/var/www"
MAGENTO_ROOT="/var/www/m2/growth/01"
DEPLOY_PATH="demo-omni.magestore.com/m2-starter-01"
PACKAGE="packages"
AUTO_DEPLOY="auto-deployment"
DO_DEPLOY=0;

cd "$SERVER_ROOT"
sh "$AUTO_DEPLOY"/auto-deploy.sh

rm -rf "$MAGENTO_ROOT"/"$AUTO_DEPLOY"

cp -R "$AUTO_DEPLOY"/"$DEPLOY_PATH" "$MAGENTO_ROOT"/"$AUTO_DEPLOY"

cd "$MAGENTO_ROOT"

if [ -d "$PACKAGE" ]; then
    cd ./
else
    mkdir "$PACKAGE"
fi

cd "$PACKAGE"

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/pull/demotool.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/pull/starter.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/pull/im.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/pull/pos.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`


if [ "$DO_DEPLOY" = "1" ]; then
    cd ../
    php bin/magento setup:upgrade
    php bin/magento cache:clean
    chmod -R 777 var pub generated
fi
