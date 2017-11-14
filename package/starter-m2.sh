rm -rf package
rm -rf source
mkdir package

git config --global credential.helper 'cache --timeout=99999999999'

rm -rf source
git clone -b master https://github.com/Magestore/omc-starter source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/OS-Inventorysuccess-M2 source
cp -R source/* ./package

rm -rf source
git clone -b master https://github.com/Magestore/WebPOS-Magento2-New source
cp -R source/* ./package


cd package
rm -rf dev
rm -rf .git
rm -f README.md
