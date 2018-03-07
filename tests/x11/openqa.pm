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

sub install_webui {
    select_console('root-console');
    zypper_call('in openQA');
}

sub configure_webui {
    select_console('root-console');
    assert_script_run('for mod in headers proxy proxy_http proxy_wstunnel; do a2enmod $mod; done');
    assert_script_run('cp /etc/apache2/vhosts.d/openqa.conf.template /etc/apache2/vhosts.d/openqa.conf');
    assert_script_run('systemctl start openqa-webui');
    assert_script_run('systemctl --no-pager status apache2');
    assert_script_run('systemctl --no-pager status openqa-resource-allocator');
    assert_script_run('systemctl --no-pager status openqa-websockets');
    assert_script_run('systemctl --no-pager status openqa-scheduler');
    assert_script_run('systemctl --no-pager status openqa-webui');
}

sub assert_webui_login {
    select_console('x11');
    x11_start_program('firefox http://localhost', 60, { valid => 1 } );
}

sub run {
    install_webui();
    configure_webui();
    assert_webui_login();
}

1;
# vim: set sw=4 et:
