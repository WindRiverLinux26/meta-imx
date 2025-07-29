FILESEXTRAPATHS:prepend:use-nxp-bsp := "${THISDIR}/${PN}:"

DEPENDS:append:use-nxp-bsp = " readline"

SRC_URI:remove:use-nxp-bsp = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
                              file://0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch \
"

PACKAGECONFIG:append:use-nxp-bsp := "${@bb.utils.contains_any('DISTRO_FEATURES', 'openssl-no-weak-ciphers', '', ' openssl', d)}"

SRC_URI:append:use-nxp-bsp = "${@bb.utils.contains_any('DISTRO_FEATURES', 'openssl-no-weak-ciphers', '', ' \
                              ${FSL_MIRROR}/wpa_supplicant-${PV}-${IMX_SRCREV_ABBREV}.tar.gz', d)}"
IMX_SRCREV_ABBREV = "aaa7ec2f"
SRC_URI[sha256sum] = "10d31e37d6d08a7d383e907aac252895d42518e9cd53d122d6591e08f0f1cd87"

S = "${UNPACKDIR}/wpa_supplicant-${PV}-${IMX_SRCREV_ABBREV}"

do_configure:append:use-nxp-bsp () {
    # Use NXP version of defconfig
    cp wpa_supplicant/defconfig wpa_supplicant/.config
}
