.PHONY: build 

deployment=xxxxx

run:
	#php -S localhost:3000

install:
	npm install

build:
	./node_modules/.bin/node-sass dev/fuga.scss build/fuga.css


s3copy:
	aws s3 cp index.html s3://tsubasa-code-deploy-exercise/$(deployment)/ --acl public-read


