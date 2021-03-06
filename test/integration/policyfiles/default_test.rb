# # encoding: utf-8

# Inspec test for recipe managed-chef-server::policyfiles

# check output of chef show-policy

# verify the ChefDK
describe command('chef') do
  it { should exist }
end

describe command('chef show-policy -c /etc/opscode/managed/config.rb') do
  its ('stdout') { should match /\* _default:  bea04861be$/ }
  its ('stdout') { should match /\* _default:  d99228eafe$/ }
  its ('stdout') { should match /\* _default:  3e28786370$/ }
end

describe command('chef show-policy base -c /etc/opscode/managed/config.rb') do
  its ('stdout') { should match /\* _default:  bea04861be$/ }
end

describe command('chef show-policy beaglebone -c /etc/opscode/managed/config.rb') do
  its ('stdout') { should match /\* _default:  d99228eafe$/ }
end

describe command('chef show-policy macbookpro -c /etc/opscode/managed/config.rb') do
  its ('stdout') { should match /\* _default:  3e28786370$/ }
end
