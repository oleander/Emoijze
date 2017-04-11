APP=Emojize
CONSTRUCT=xcodebuild -workspace $(APP).xcworkspace -scheme $(APP)

install_deps:
	pod install --verbose --repo-update
test: install_deps plain_test
build: install_deps
	$(CONSTRUCT) build | xcpretty
plain_test:
	/usr/bin/xcodebuild -workspace Emojize.xcworkspace -scheme Emojize test
