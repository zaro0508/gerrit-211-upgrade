#!/bin/bash

# remove openstack/openstack-ci repo
mysql -uroot -ppassword reviewdb -e "DELETE FROM account_project_watches WHERE project_name='openstack/openstack-ci';"
mysql -uroot -ppassword reviewdb -e "DELETE FROM changes WHERE dest_project_name='openstack/openstack-ci';"
mysql -uroot -ppassword reviewdb -e "DELETE FROM submodule_subscriptions WHERE submodule_project_name='openstack/openstack-ci';"

# remove openstack-ci/gerrit-verification-status-plugin
mysql -uroot -ppassword reviewdb -e "DELETE FROM account_project_watches WHERE project_name='openstack-ci/gerrit-verification-status-plugin';"
mysql -uroot -ppassword reviewdb -e "DELETE FROM changes WHERE dest_project_name='openstack-ci/gerrit-verification-status-plugin';"
mysql -uroot -ppassword reviewdb -e "DELETE FROM submodule_subscriptions WHERE submodule_project_name='openstack-ci/gerrit-verification-status-plugin';"

# remove openstack-ci/gerrit-verification-status-plugin
# mysql -uroot -ppassword reviewdb -e "DELETE FROM account_project_watches WHERE project_name='openstack/openstack-puppet';"
# mysql -uroot -ppassword reviewdb -e "DELETE FROM changes WHERE dest_project_name='openstack/openstack-puppet';"
# mysql -uroot -ppassword reviewdb -e "DELETE FROM submodule_subscriptions WHERE submodule_project_name='openstack/openstack-puppet';"

