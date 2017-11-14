rm -rf package
rm -rf source
mkdir package

git config --global credential.helper 'cache --timeout=99999999999'

git clone -b master https://github.com/Magestore/CoreSuccess-M1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/InventorySuccess-M1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/BarcodeSuccess-M1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Webpos-M1-Rebuild source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/PurchaseOrderSuccess-M1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/ReportSuccess-M1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Giftcard-Magento1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Rewardpoints-Standard-Magento1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Rewardpoints-Rule-Magento1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Rewardpoints-Loyaltylevel-Magento1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Rewardpoints-Api-Magento1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Storecredit-Magento1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Storepickup-Magento1 source
cp -R source/* ./package
