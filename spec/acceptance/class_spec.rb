require 'spec_helper_acceptance'

case fact('osfamily')
when 'Debian'
  package_name     = 'screen'
  config_dir_path  = '/etc'
  config_file_path = '/etc/screenrc'
end

describe 'screen', if: SUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  it 'is_expected.to work with no errors' do
    pp = <<-EOS
      class { 'screen': }
    EOS

    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes: true)
  end

  describe 'screen::install' do
    context 'defaults' do
      it 'is_expected.to work with no errors' do
        pp = <<-EOS
          class { 'screen': }
        EOS

        apply_manifest(pp, catch_failures: true)
      end

      describe package(package_name) do
        it { is_expected.to be_installed }
      end
    end

    context 'when package latest' do
      it 'is_expected.to work with no errors' do
        pp = <<-EOS
          class { 'screen':
            package_ensure => 'latest',
          }
        EOS

        apply_manifest(pp, catch_failures: true)
      end

      describe package(package_name) do
        it { is_expected.to be_installed }
      end
    end

    context 'when package absent' do
      it 'is_expected.to work with no errors' do
        pp = <<-EOS
          class { 'screen':
            package_ensure => 'absent',
          }
        EOS

        apply_manifest(pp, catch_failures: true)
      end

      describe package(package_name) do
        it { is_expected.not_to be_installed }
      end
      describe file(config_file_path) do
        it { is_expected.to be_file }
      end
    end

    context 'when package purged' do
      it 'is_expected.to work with no errors' do
        pp = <<-EOS
          class { 'screen':
            package_ensure => 'purged',
          }
        EOS

        apply_manifest(pp, catch_failures: true)
      end

      describe package(package_name) do
        it { is_expected.not_to be_installed }
      end
      describe file(config_file_path) do
        it { is_expected.not_to be_file }
      end
    end
  end

  describe 'screen::config' do
    context 'defaults' do
      it 'is_expected.to work with no errors' do
        pp = <<-EOS
          class { 'screen': }
        EOS

        apply_manifest(pp, catch_failures: true)
      end

      describe file(config_file_path) do
        it { is_expected.to be_file }
      end
    end

    context 'when source dir' do
      it 'is_expected.to work with no errors' do
        pp = <<-EOS
          class { 'screen':
            config_dir_source => "puppet:///modules/screen/common/#{config_dir_path}",
          }
        EOS

        apply_manifest(pp, catch_failures: true)
      end

      describe file(config_dir_path) do
        it { is_expected.to be_directory }
      end
    end

    context 'when source dir purged' do
      it 'is_expected.to work with no errors' do
        pp = <<-EOS
          class { 'screen':
            config_dir_purge  => true,
            config_dir_source => "puppet:///modules/screen/common/#{config_dir_path}",
          }
        EOS

        apply_manifest(pp, catch_failures: true)
      end

      describe file(config_dir_path) do
        it { is_expected.to be_directory }
      end
    end

    context 'when source file' do
      it 'is_expected.to work with no errors' do
        pp = <<-EOS
          class { 'screen':
            config_file_source => "puppet:///modules/screen/common/#{config_file_path}",
          }
        EOS

        apply_manifest(pp, catch_failures: true)
      end

      describe file(config_file_path) do
        it { is_expected.to be_file }
        it { is_expected.to contain 'THIS FILE IS MANAGED BY PUPPET' }
      end
    end
  end
end
