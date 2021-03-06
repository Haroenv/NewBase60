SHELL = /bin/bash -o pipefail
project = NewBase60

test: test-unit test-carthage test-cocoapods

test-unit:
	xctool -project $(project).xcodeproj -scheme $(project) -sdk iphonesimulator test

test-carthage:
	carthage build --verbose --no-skip-current | xcpretty

test-cocoapods:
	pod lib lint $(project).podspec

bootstrap:
	bundle install

   # Detect Travis CI, see http://docs.travis-ci.com/user/environment-variables/
ifeq ($(TRAVIS_CI),true)
   # Cannot brew install carthage on Travis-CI
	curl -OL https://github.com/Carthage/Carthage/releases/download/0.8/Carthage.pkg
	sudo /usr/sbin/installer -pkg Carthage.pkg -target /
else
	brew install carthage
endif

deps:
	carthage bootstrap --use-ssh --verbose | xcpretty

release:
	zip -r -9 $(project).framework.zip Carthage/Build/iOS/*.framework

clean:
	git clean -xfd
	git submodule foreach git clean -xfd
	rm -rf  ~/Library/Developer/Xcode/DerivedData/$(project)-*

.PHONY: all clean test test-unit test-carthage test-cocoapods bootstrap deps release
