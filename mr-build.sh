#!/bin/bash
#
# mr-hammerhead.sh: the overarching build script for the MultiROM for hammerhead.
# Copyright (C) 2016 https://github.com/multirom-htc Project
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#

NUMCORES=`getconf _NPROCESSORS_ONLN`
JSYNC=`echo $(( $NUMCORES * 2 ))`

. build/envsetup.sh && lunch omni_$TARGET_DEVICE-eng && rm -rf $OUT && time make -j$JSYNC recoveryimage && time make -j$JSYNC multirom_zip && time make -j$JSYNC multirom_uninstaller
