#!/usr/bin/env ruby
#
# Copyright (c) 2022 BlackBerry Limited. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'xcodeproj'

class CapacitorSecureIccProject

  public

  def prepare_project
    patch_all_xcodeproj
  end

  private

  def patch_all_xcodeproj
    project_path = ENV['INIT_CWD'] || Dir.pwd
    Dir.glob("#{project_path}/ios/App/*.xcodeproj").each do |xcode_path|
    @product_name = File.basename(xcode_path).sub(/\.xcodeproj$/, "")
      @xcodeproj = Xcodeproj::Project.open(xcode_path)
      @www_path = "#{project_path}/ios/App/App/www"
      @native_target = get_native_target
      patch_xcodeproj
    end
  end

  def get_native_target
    @xcodeproj.targets.select do |target|
      target.name == @product_name
    end.first
  end

  def patch_xcodeproj

    app_group = @xcodeproj.groups.select do |group|
      if group.path != nil and @product_name != nil
        group.path == @product_name
      end
    end.first

    if app_group.files.select do |file|
      file.name == 'www'
    end.empty? then
      www_resource_ref = Xcodeproj::Project::Object::FileReferencesFactory.new_reference(
        app_group, @www_path, 'SOURCE_ROOT'
      )
      @native_target.add_resources([www_resource_ref])
    end

    @xcodeproj.save
  end
end

capacitor_project = CapacitorSecureIccProject.new
capacitor_project.prepare_project
