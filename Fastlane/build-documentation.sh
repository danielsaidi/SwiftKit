#!/bin/sh

rm -rf Docs
mkdir -p Docs

xcodebuild docbuild \
    -scheme SwiftKit \
    -destination generic/platform=iOS \

echo "Copying documentation archive..."

find ~/Library/Developer/Xcode/DerivedData \
    -name "SwiftKit.doccarchive" \
    -exec cp -R {} Docs \;

cd Docs

echo "Compressing documentation archive..."

zip -r \
    SwiftKit.doccarchive.zip \
    SwiftKit.doccarchive

rm -rf SwiftKit.doccarchive

cd ..
