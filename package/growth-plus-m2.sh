rm -rf package
rm -rf source
mkdir package

git config --global credential.helper 'cache --timeout=99999999999'

rm -rf source
git clone -b dev https://github.com/Magestore/OS-Inventorysuccess-M2 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/BarcodeSuccess-M2 source
cp -R source/* ./package

rm -rf source
git clone -b dev https://github.com/Magestore/WebPOS-Magento2-New source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/PurchaseOrderSuccess-M2 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Giftcard-Magento2 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Rewardpoints-Standard-Magento2 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Storecredit-Magento2 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Storepickup-Magento2 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/SupplierSuccess source
rm -rf package/app/code/Magestore/SupplierSuccess
mkdir package/app/code/Magestore/SupplierSuccess
cp -R source/* ./package/app/code/Magestore/SupplierSuccess

rm -rf source
git clone -b master https://github.com/Magestore/DropshipSuccess-M2 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/OrderSuccess source
rm -rf package/app/code/Magestore/OrderSuccess
mkdir package/app/code/Magestore/OrderSuccess
cp -R source/* ./package/app/code/Magestore/OrderSuccess

rm -rf source
git clone -b master https://github.com/Magestore/FulfilSuccess-M2 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/FulfilReport-M2 source
rm -rf package/app/code/Magestore/FulfilReport
mkdir package/app/code/Magestore/FulfilReport
cp -R source/* ./package/app/code/Magestore/FulfilReport

cd package
rm -rf dev
rm -rf .git
rm -f README.md
