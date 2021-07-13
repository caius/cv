.PHONY: build
build:
	hugo --gc --cleanDestinationDir

.PHONY: clean
clean:
	rm -rf public/

.PHONY: deploy
deploy: build
	scp -r nonus3.vm.caius.name:www/cv.caius.name/htdocs html/