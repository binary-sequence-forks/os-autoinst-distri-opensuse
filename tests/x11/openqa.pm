# SUSE's openQA tests
#
# Copyright © 2018 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: Test installation of openQA
# Maintainer: Sergio Lindo Mansilla <slindomansilla@suse.com>

use base "x11test";
use strict;
use testapi;

sub run {
    zypper_call('in openQA');
}

1;
# vim: set sw=4 et:
