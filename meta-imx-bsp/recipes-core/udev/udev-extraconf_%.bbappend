# Freescale i.MX SOC extra configuration udev rules
FILESEXTRAPATHS:prepend:imx-nxp-bsp := "${THISDIR}/${PN}:"

SRC_URI:append:imx-nxp-bsp = " file://blacklist.conf"

do_install:prepend:imx-nxp-bsp () {
    if [ -e "${UNPACKDIR}/blacklist.conf" ]; then
        install -d ${D}${sysconfdir}/modprobe.d
        install -m 0644 ${UNPACKDIR}/blacklist.conf ${D}${sysconfdir}/modprobe.d
    fi
}


FILES:${PN}:append:imx-nxp-bsp = " ${sysconfdir}/modprobe.d"

PACKAGE_ARCH:mx6-nxp-bsp = "${MACHINE_SOCARCH}"
PACKAGE_ARCH:mx7-nxp-bsp = "${MACHINE_SOCARCH}"
