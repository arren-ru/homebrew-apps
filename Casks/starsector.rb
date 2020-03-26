cask 'starsector' do
  version '0.9.1a-RC8'
  sha256 "b11e2d15c5ce16572ac8731f2ab649183a3f285b39ea6c8dc74ece7b8dc9fc78"

  url 'http://www.fractalsoftworks.com/starsector/release/starsector_mac-#{version}.zip'
  name 'Starsector'
  homepage 'https://fractalsoftworks.com/'

  auto_updates true
  app '#{name}.app'
end

