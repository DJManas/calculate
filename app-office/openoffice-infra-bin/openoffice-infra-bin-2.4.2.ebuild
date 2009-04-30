# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-office/openoffice-bin/openoffice-bin-2.4.0.ebuild,v 1.1 2008/03/27 08:14:06 suka Exp $

inherit eutils fdo-mime multilib

IUSE="gnome java human"

DESCRIPTION="Сборка OpenOffice от компании Инфра-ресурс"

SRC_URI="x86?   ( http://download.i-rs.ru/pub/openoffice/${PV}/ru/OOo_${PV}_LinuxIntel_ru_infra.tar.gz )
        amd64?  ( http://download.i-rs.ru/pub/openoffice/${PV}/ru/OOo_${PV}_LinuxX86-64_ru_infra.tar.gz )"
        
        HOMEPAGE="http://www.i-rs.ru/"
        
        LICENSE="LGPL-2"
        SLOT="0"
        KEYWORDS="amd64 x86"
        
        RDEPEND="!app-office/openoffice
                !app-office/openoffice-infra
                        gnome? ( x11-themes/gnome-icon-theme )
                                human? ( x11-themes/human-icon-theme )
                                    x11-libs/libXaw
                                        sys-libs/glibc
                                            >=dev-lang/perl-5.0
                                                app-arch/zip
                                                    app-arch/unzip
                                                        >=media-libs/freetype-2.1.10-r2
                                                            java? ( >=virtual/jre-1.5 )"
                                                            
                                                            DEPEND="${RDEPEND}
                                                                sys-apps/findutils"
                                                                                                                                
                                                                                                                                
                                                                                                                                PROVIDE="virtual/ooo"
                                                                                                                                RESTRICT="strip"
                                                                                                                                
                                                                                                                                src_unpack() {
                                                                                                                                        unpack ${A}
                                                                                                                                        }
                                                                                                                                        
                                                                                                                                        src_install () {
                                                                                                                                        
                                                                                                                                                #Multilib install dir magic for AMD64
                                                                                                                                                        has_multilib_profile && ABI=x86
                                                                                                                                                        
                                                                                                                                                                local instdir="/usr/$(get_libdir)"
                                                                                                                                                                        local basecomponents="base calc draw impress math writer printeradmin"
                                                                                                                                                                                local allcomponents
                                                                                                                                                                                        local instdirp=$(echo $(echo ${instdir}|sed     's/\//\\\//g')\\/openoffice.org2.4\\/program )
                                                                                                                                                                                        
                                                                                                                                                                                                dodir "${instdir}"
                                                                                                                                                                                                
                                                                                                                                                                                                        mv "${WORKDIR}"/openoffice.org2.4 "${D}${instdir}"
                                                                                                                                                                                                        
                                                                                                                                                                                                                #Menu entries, icons and mime-types
                                                                                                                                                                                                                        cd "${D}${instdir}/openoffice.org2.4/share/xdg/"
                                                                                                                                                                                                                        
                                                                                                                                                                                                                                for desk in ${basecomponents}; do
                                                                                                                                                                                                                                                sed -i -e s/"Exec=openoffice.org2\.4"/"Exec=ooffice"/   ${desk}.desktop || die
                                                                                                                                                                                                                                                                sed -i -e s/"Icon=openofficeorg24-"/"Icon=ooo_"/  ${desk}.desktop || die
                                                                                                                                                                                                                                                                                domenu ${desk}.desktop
                                                                                                                                                                                                                                                                                        done
                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                        # Component symlinks
                                                                                                                                                                                                                                                                                                                for app in ${basecomponents}; do
                                                                                                                                                                                                                                                                                                                                if [[ ${app} == "printeradmin" ]]; then
                                                                                                                                                                                                                                                                                                                                                        dosym ${instdir}/openoffice.org2.4/program/spadmin.bin /usr/bin/ooffice-printeradmin
                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                dosym ${instdir}/openoffice.org2.4/program/s${app} /usr/bin/oo${app}
                                                                                                                                                                                                                                                                                                                                                                                                                fi
                                                                                                                                                                                                                                                                                                                                                                                                                        done
                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                        dosym ${instdir}/openoffice.org2.4/program/soffice      /usr/bin/soffice
                                                                                                                                                                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                                                                                                                                                                                # Install wrapper script
                                                                                                                                                                                                                                                                                                                                                                                                                                                        newbin "${FILESDIR}/wrapper.in" ooffice
                                                                                                                                                                                                                                                                                                                                                                                                                                                                sed -i -e s/"\/usr\/LIBDIR\/openoffice\/program"/"${instdirp}"/g "${D}/usr/bin/ooffice" || die
                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        # Change user install dir
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                sed -i -e s/".openoffice.org\/2.4"/.ooo-2.4/g "${D}${instdir}/openoffice.org2.4/program/bootstraprc" || die
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        # Non-java weirdness see bug #99366
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                use !java && rm -f "${D}${instdir}/openoffice.org2.4/program/javaldx"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        # install java-set-classpath
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if use java; then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            insinto /usr/$(get_libdir)/openoffice/program
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        newins "${FILESDIR}/java-set-classpath.in"  java-set-classpath
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        fperms 755      /usr/$(get_libdir)/openoffice/program/java-set-classpath
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                fi
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        # prevent revdep-rebuild from attempting to rebuild all the time
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                insinto /etc/revdep-rebuild && doins "${FILESDIR}/50-openoffice-infra-bin"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                pkg_postinst() {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        fdo-mime_desktop_database_update
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                fdo-mime_mime_database_update
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        [[ -x /sbin/chpax ]] && [[ -e /usr/$(get_libdir)/openoffice/program/soffice.bin ]] && chpax -zm /usr/$(get_libdir)/openoffice/program/soffice.bin
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                elog " Чтобы запустить OpenOffice.org ${PV} Pro, выполните:"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        elog
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                elog " $ ooffice"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        elog
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                elog " Также, для конкретных компонентов, вы можете использовать следующее:"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        elog
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                elog " oobase, oocalc, oodraw, ooimpress, oomath, или oowriter"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                