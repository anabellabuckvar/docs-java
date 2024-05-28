curl -L -o snooty-parser.zip https://github.com/mongodb/snooty-parser/releases/download/v0.16.6/snooty-v0.16.6-linux_x86_64.zip
unzip -d ./snooty-parser snooty-parser.zip

echo RUNNING PARSER!

ls -l ./snooty-parser
chmod +x ./snooty-parser/snooty
./snooty-parser/snooty/snooty build . --output=./bundle.zip
git clone -b v0.16.14 --depth 1 https://github.com/mongodb/snooty.git 
echo GATSBY_MANIFEST_PATH=$(pwd)/bundle.zip >> ./snooty/.env.production
cd snooty                
npm ci --legacy-peer-deps
git clone --depth 1 https://github.com/mongodb/docs-tools.git
mkdir -p ./static/images
mv ./docs-tools/themes/mongodb/static ./static/docs-tools
mv ./docs-tools/themes/guides/static/images/bg-accent.svg ./static/docs-tools/images/bg-accent.svg