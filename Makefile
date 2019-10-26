VERSION="2019-10-27"

all:
	curl "https://bellard.org/quickjs/quickjs-${VERSION}.tar.xz" > "tmp/quickjs-${VERSION}.tar.xz"
	tar -xf "tmp/quickjs-${VERSION}.tar.xz" -C "tmp"
	make install -C "tmp/quickjs-${VERSION}"
