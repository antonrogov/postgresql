#/postgresql.conf.
# Cookbook Name:: postgresql
# Recipe:: server
#
# Author:: Joshua Timberman (<joshua@opscode.com>)
# Author:: Lamont Granquist (<lamont@opscode.com>)
# Copyright 2009-2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Include the right "family" recipe for installing the server
# since they do things slightly differently.
# Include the right "family" recipe for installing the server
# since they do things slightly differently.
case node['platform_family']
when "rhel", "fedora", "suse"
  quit "I have nothing to serve here"
when "debian"
  include_recipe "postgresql::server_debian"
end
