FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://0001-gray8_padding_removal.patch \
             file://0001-Fix-to-provide-default-delegates.patch \
	     file://0001-meson.build-Support-NumPy-2.2-header-path-changes.patch \
"
