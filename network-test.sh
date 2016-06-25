#!/bin/bash
# This file is part of LockSmith
# This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

source /usr/local/include/locksmith/common
source /usr/local/etc/locksmith/network.conf

function egress ()
{

}

function ingress ()
{
echoping -n 5 -w 10 -R -H "networking.test" -h "/port/22/port/80/port/443/port/8080" -C -4 ${testserver}

}

function run_tests ()
{

}
