pkg_name=telegraf
pkg_origin=jplimack
pkg_version="1.3.1"
pkg_maintainer="Jake Plimack <jake.plimack@gmail.com>"
pkg_license=('The MIT License (MIT)')
pkg_scaffolding=core/scaffolding-go
pkg_svc_run="bin/telegraf"

do_begin() {
    export GOBIN="${GOPATH}/bin"
}

do_download() {
    git clone --branch "${pkg_version}" https://github.com/influxdata/telegraf || true
    cd telegraf && \
        git pull origin $pkg_version
}

do_verify() {
    do_default_verify
}

do_clean() {
    return 0
}

do_unpack() {
    do_default_unpack
}

do_prepare() {
    return 0
}

do_build() {
    go get github.com/influxdata/telegraf
    cd $GOPATH/src/github.com/influxdata/telegraf
    echo "GOPATH: $GOPATH"
    make
}

do_check() {
    return 0
}

do_install() {
    return 0
}

do_strip() {
    do_default_strip
}

do_end() {
    return 0
}
