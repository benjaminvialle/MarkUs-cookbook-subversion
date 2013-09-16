#
# Cookbook Name:: subversion
# Attributes:: default
#
# Licensed under the GPL License, Version 3.0 (the "License");
# you may not use this file except in compliance with the License.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
default[:subversion][:version]            = "1.8.3"
default[:subversion][:download_link]      = "http://archive.apache.org/dist/subversion"
default[:subversion][:ruby_sitedir]       = "/usr/local/lib/site_ruby"
