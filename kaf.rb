class Kaf < Formula
  desc "Kafka CLI inspired by kubectl & docker"
  homepage "https://github.com/birdayz/kaf"
  version "0.1.38"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/birdayz/kaf/releases/download/v#{version}/kaf_#{version}_Darwin_x86_64.tar.gz"
    sha256 "ccd92ff62beb2ef3d6adc4ef6ffe3dda6c0ecea9ff377b95371aea4815761476"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/birdayz/kaf/releases/download/v#{version}/kaf_#{version}_Linux_x86_64.tar.gz"
      sha256 "f36ed5eab0f0eb53b192b1d8c23cee6d80daaae0b52283343196194bda1ffb70"
    end
  end

  def install
    bin.install "kaf"

    output = Utils.popen_read("#{bin}/kaf completion bash")
    (bash_completion/"kaf").write output

    output = Utils.popen_read("#{bin}/kaf completion zsh")
    (zsh_completion/"_kaf").write output
  end
end
