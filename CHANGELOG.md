# chef-yum-docker Cookbook CHANGELOG

This file is used to list changes made in each version of the chef-apt-docker cookbook.

## Unreleased

- resolved cookstyle error: spec/unit/recipes/default_spec.rb:16:7 warning: `ChefDeprecations/DeprecatedChefSpecPlatform`
- resolved cookstyle error: spec/unit/recipes/default_spec.rb:36:7 warning: `ChefDeprecations/DeprecatedChefSpecPlatform`

## 3.1.1 (2017-12-15)

- Fix repos not being setup on Fedora

## 3.1.0 (2017-12-15)

- Add Oracle to the metadata
- Throw a warning if not on RHEL 7+ / Fedora instead of potentially failing (like we did on Amazon Linux)

## 3.0.0 (2017-07-25)

- Require Chef 12.14+ for yum_repository and remove depedency on compat_resource
- Docker has changed their repository structure. Switch to the new docker repo. edge is now disabled by default. support for oracle, amazon, and centos 6 no longer exist from docker.

## 2.1.0 (2016-12-07)
- Ability to customize the yum properties and disable the cookbook entirely via attributes
- Add a basic ChefSpec test

## 2.0.0 (2016-11-26)
- Switch from yum to compat_resource cookbook
- Update integration testing
