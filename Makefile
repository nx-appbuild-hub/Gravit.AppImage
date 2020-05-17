SOURCE="https://designer.gravit.io/_downloads/linux/GravitDesigner.zip?v=2019-2.7"
DESTINATION="build.7z"
OUTPUT="GravitDesigner.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) --continue $(SOURCE)

	rm -rf AppDir/opt
	mkdir --parents AppDir/opt/application

	command -v 7z && 7z x $(DESTINATION)
	# CentOs 7z version command 
	command -v 7za && 7za x $(DESTINATION)
	
	unzip build

	chmod +x $(OUTPUT)

	rm -rf build
	rm -rf Installation-Guide.html
	rm -rf latest-linux.yml
	rm -f $(DESTINATION)
	rm -rf AppDir/opt
