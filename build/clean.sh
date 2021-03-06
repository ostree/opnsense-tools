#!/bin/sh

# Copyright (c) 2014-2016 Franco Fichtner <franco@opnsense.org>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

set -e

. ./common.sh && $(${SCRUB_ARGS})

for ARG in ${@}; do
	case ${ARG} in
	base)
		echo ">>> Removing base set"
		rm -f ${SETSDIR}/base-*-${ARCH}.txz
		rm -f ${SETSDIR}/base-*-${ARCH}.txz.sig
		rm -f ${SETSDIR}/base-*-${ARCH}.obsolete
		rm -f ${SETSDIR}/base-*-${ARCH}.obsolete.sig
		;;
	distfiles)
		echo ">>> Removing distfiles set"
		rm -f ${SETSDIR}/distfiles-*.tar
		;;
	iso)
		echo ">>> Removing iso image"
		rm -f ${IMAGESDIR}/*-cdrom-${ARCH}.iso
		;;
	kernel)
		echo ">>> Removing kernel set"
		rm -f ${SETSDIR}/kernel-*-${ARCH}.txz
		rm -f ${SETSDIR}/kernel-*-${ARCH}.txz.sig
		;;
	memstick)
		echo ">>> Removing memstick images"
		rm -f ${IMAGESDIR}/*-serial-${ARCH}.img
		rm -f ${IMAGESDIR}/*-vga-${ARCH}.img
		;;
	nano)
		echo ">>> Removing nano image"
		rm -f ${IMAGESDIR}/*-nano-${ARCH}.img
		;;
	packages)
		echo ">>> Removing packages set"
		rm -f ${SETSDIR}/packages-*-${PRODUCT_FLAVOUR}-${ARCH}.tar
		;;
	release)
		echo ">>> Removing release set"
		rm -f ${SETSDIR}/release-*-${PRODUCT_FLAVOUR}-${ARCH}.tar
		;;
	stage)
		setup_stage ${STAGEDIR}
		;;
	src)
		setup_stage /usr/obj${SRCDIR}
		;;
	esac
done
