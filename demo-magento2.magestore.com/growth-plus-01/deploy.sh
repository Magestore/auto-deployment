SERVER_ROOT="/var/www"
MAGENTO_ROOT="/var/www/omnichannel/growth-plus/01"
DEPLOY_PATH="demo-magento2.magestore.com/growth-plus-01"
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

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/barcode.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/dropship.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/fulfil.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/fulfilreport.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/giftcard.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/im.sh`
DO_DEPLOY=`[ "$SUB_DEPLOY" = "1" ] && echo "1" || echo $DO_DEPLOY`

SUB_DEPLOY=`sh ../"$AUTO_DEPLOY"/"$DEPLOY_PATH"/pull/ordersuccess.sh`
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
