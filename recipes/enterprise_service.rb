#
# Cookbook Name:: sensu
# Recipe:: enterprise_service
#
# Copyright 2014, Heavy Water Operations, LLC.
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

service "sensu-enterprise" do
  subscribes :restart, resources("package[sensu-enterprise]"), :immediately
  subscribes :restart, resources("template[/etc/default/sensu-enterprise]"), :immediately
  subscribes :reload, resources("ruby_block[sensu_service_trigger]"), :delayed
  supports :status => true, :start => true, :stop => true, :restart => true, :reload => true
  action [:enable, :start]
end