cask 'starsector' do
  name "Starsector"
  version "0.9.1a-RC8"
  homepage "https://fractalsoftworks.com/"

  auto_updates true

  url "http://www.fractalsoftworks.com/starsector/release/starsector_mac-#{version}.zip"
  sha256 "b11e2d15c5ce16572ac8731f2ab649183a3f285b39ea6c8dc74ece7b8dc9fc78"
  app "#{name}.app"
end

