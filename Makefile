.PHONY: build 

deployment=xxxxx

run:
	#php -S localhost:3000

install:
	npm install

build:
	./node_modules/.bin/node-sass dev/fuga.scss build/fuga.css

build/artifact:
	rm -rf artifact/*
	cp index.html artifact
	zip artifact.zip artifact

s3copy:
	aws s3 cp index.html s3://tsubasa-code-deploy-exercise/$(deployment)/ --acl public-read


deploy:
	aws deploy push \
		--application-name tsubasa-app \
		--s3-location s3://tsubasa-code-deploy-exercise/$(deployment)/index.html \
		--source ./ \
		--region ap-northeast-1

zip:
	tar xzfv index.html app.zip
