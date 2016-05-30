#
# Cookbook Name:: wordpress_lamp
# Recipe:: default
#
# Copyright 2016, Jesse Whitham
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'lamp::default'
include_recipe 'wordpress_lamp::httpd'
include_recipe 'wordpress_lamp::sql'
include_recipe 'wordpress_lamp::word_press'
include_recipe 'wordpress_lamp::git'