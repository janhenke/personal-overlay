#!/bin/sh

EBUILDS="dev-cpp/ms-gsl media-fonts/cascadia-code media-fonts/jetbrains-mono media-fonts/polarsys-b612-fonts"

SOURCE="/var/db/repos/gentoo"
DEST=`readlink --canonicalize-existing "${0%/*}/.."`

for EBUILD in ${EBUILDS}; do
	mkdir --parents "${DEST}/${EBUILD}"
	rsync --archive --delete --verbose "${SOURCE}/${EBUILD}" "${DEST}/${EBUILD}/.."
done
