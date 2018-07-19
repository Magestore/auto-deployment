# OLD
AUTO_DEPLOY="auto-deployment"

if [ -d "$AUTO_DEPLOY/.git" ]; then
    cd "$AUTO_DEPLOY"
    git pull
else
    rm -rf $AUTO_DEPLOY
    git clone -b master https://github.com/Magestore/auto-deployment "$AUTO_DEPLOY"
fi
