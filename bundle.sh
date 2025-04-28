mkdir -p .bundle
mkdir -p ./--bundles--/
cd .bundle
cp -a ../controllers/ controllers
cp -a ../definitions/ definitions
cp -a ../views/ views

# cd ..
total5 --bundle app.bundle
cp app.bundle ../--bundles--/app.bundle

cd ..
rm -rf .bundle
echo "DONE"