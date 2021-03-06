# Author:: Christopher M Luciano (<cmlucian@us.ibm.com>)
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

Ohai.plugin(:Rust) do
  provides "languages/rust"

  depends "languages"

  collect_data do
    output = nil

    rust = Mash.new
    so = shell_out("rustc --version")
    if so.exitstatus == 0
      output =  so.stdout.split
      rust[:version] = output[1]
      languages[:rust] = rust if rust[:version]
    end
  end
end
