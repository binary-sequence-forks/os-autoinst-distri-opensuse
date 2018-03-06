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
use utils qw(zypper_call);

sub run {
    select_console('root-console');
    zypper_call('in openQA');
    assert_script_run('systemctl start openqa-webui');
    assert_script_run('systemctl status openqa-webui');
    assert_script_run('systemctl status openqa-websockets');
    assert_script_run('systemctl status openqa-scheduler');
    assert_script_run('systemctl status openqa-resource-allocator');
    select_console('x11');
}

1;
# vim: set sw=4 et:
