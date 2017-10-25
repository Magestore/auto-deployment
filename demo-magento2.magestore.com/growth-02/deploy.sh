MAGENTO_ROOT="/var/www/omnichannel/growth/02"
DEPLOY_PATH="demo-magento2.magestore.com/growth-02"
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

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/barcode.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/giftcard.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/im.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/po.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/pos.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/reward.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/storecredit.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/storepickup.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/supplier.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`


if [ "$DO_DEPLOY" = "1" ]; then
    cd ../
    php bin/magento setup:upgrade
    php bin/magento cache:clean
    chmod -R 777 var pub
fi
