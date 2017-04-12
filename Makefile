.PHONY: build

bucketname=tsubasa-code-deploy-exercise
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

upload/artifact:
	aws s3 cp artifact.zip s3://$(bucketname)/$(deployment)/ --acl public-read

deploy/artifact:
	aws deploy push \
		--application-name tsubasa-app \
		--s3-location s3://$(bucketname)/$(deployment)/artifact.zip \
		--source ./ \
		--region ap-northeast-1
	aws deploy create-deployment \
		--application-name tsubasa-app\
		--s3-location bucket=tsubasa-code-deploy-exercise,key=xxxxx/artifact.zip,bundleType=zip,eTag=34068d4ce684b6ad37c78cb10bd41ea7 \
		--deployment-group-name tsubasa-app-deploygroup \
		--region ap-northeast-1
