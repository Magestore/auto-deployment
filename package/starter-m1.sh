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
git clone -b master https://github.com/Magestore/omc-starter-m1 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/Webpos-M1-Rebuild source
cp -R source/* ./package
