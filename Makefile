# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

all: clean
	mkdir --parents $(PWD)/build/Boilerplate.AppDir
	wget --output-document=$(PWD)/build/build.tar.gz https://download-cdn.jetbrains.com/webide/PhpStorm-2021.2.2.tar.gz

	tar -zxvf $(PWD)/build/build.tar.gz  -C $(PWD)/build/Boilerplate.AppDir/
	cp --force --recursive $(PWD)/build/Boilerplate.AppDir/PhpStorm-*/* $(PWD)/build/Boilerplate.AppDir
	rm -rf $(PWD)/build/Boilerplate.AppDir/PhpStorm-*

	rm -f $(PWD)/build/Boilerplate.AppDir/*.desktop 		|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.png 		  	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.svg 		  	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.jpg 		  	|| true

	cp --force $(PWD)/AppDir/*.svg 		  	$(PWD)/build/Boilerplate.AppDir 			|| true
	cp --force $(PWD)/AppDir/*.desktop 		$(PWD)/build/Boilerplate.AppDir 			|| true
	cp --force $(PWD)/AppDir/*.png 		  	$(PWD)/build/Boilerplate.AppDir 			|| true
	cp --force $(PWD)/AppDir/AppRun 		$(PWD)/build/Boilerplate.AppDir 			|| true

	chmod +x $(PWD)/build/Boilerplate.AppDir/AppRun

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/Boilerplate.AppDir $(PWD)/PhpStorm.AppImage
	chmod +x $(PWD)/PhpStorm.AppImage

clean: 
	rm --recursive --force $(PWD)/build