#!/bin/sh

source build-config.sh

copy_manpages

echo "[+] Building Effing macos package..."
fpm --input-type virtualenv \
    --output-type osxpkg \
    --iteration `date +%s` \
    --log info \
    --name "$PKG_NAME" \
    --description "$PKG_DESCRIPTION" \
    --version "$VERSION" \
    --maintainer "$PKG_MAINTAINER" \
    --url "$PKG_URL" \
    --osxpkg-identifier-prefix org.openobservatory.pyooniprobe \
    --virtualenv-install-location "/Library/Application Support/ooniprobe/venv" \
    --after-install conf/macos/after-install.sh \
    --before-remove conf/macos/before-remove.sh \
    --virtualenv-other-files-dir conf/macos/extra-files \
    --force \
    "ooniprobe==$VERSION"
