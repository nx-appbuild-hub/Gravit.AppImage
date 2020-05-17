SOURCE="https://designer.gravit.io/_downloads/linux/GravitDesigner.zip?v=2019-2.7"
DESTINATION="build.7z"
OUTPUT="GravitDesigner.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) --continue $(SOURCE)

	rm -rf AppDir/opt
	mkdir --parents AppDir/opt/application


	7za x $(DESTINATION)

	unzip build
	chmod +x $(OUTPUT)
	./$(OUTPUT) --appimage-extract
	sed -i 's/exec "$$BIN"/$$BIN --no-sandbox/g' squashfs-root/AppRun
	export ARCH=x86_64 && bin/appimagetool.AppImage squashfs-root $(OUTPUT)

	rm -rf build
	rm -rf squashfs-root
	rm -rf Installation-Guide.html
	rm -rf latest-linux.yml
	rm -f $(DESTINATION)
	rm -rf AppDir/opt
