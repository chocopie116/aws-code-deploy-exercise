run:
	php -S localhost:3000

install:
	npm install

build:
	./node_modules/.bin/node-sass dev/fuga.scss build/fuga.css
