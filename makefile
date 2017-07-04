.PHONY: build test
.ONESHELL:

install:
	@ npm i

build:
	@ mkdir -p build
	@ ./node_modules/.bin/babel src/ --out-dir build/ --compact true
	@ chmod +x build/myscript.js

run:
	@ ./node_modules/.bin/babel-node src/myscript.js

debug:
	@ DEBUG=all ./node_modules/.bin/babel-node src/myscript.js

test:
	@ NODE_ENV=test ./node_modules/.bin/mocha -t 9999999 --compilers js:babel-core/register --require babel-polyfill test/setup.js test/specs/*.spec.js

deploy:
	@ read -r -p "Do you really want to deploy ? [y/N] " REPLY;
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then
		npm publish
	fi

lint:
	@ ./node_modules/.bin/eslint src/

lint-fix:
	@ ./node_modules/.bin/eslint --fix src/

docker:
	@ docker build -t myscript .
	@ docker run -it --rm myscript
