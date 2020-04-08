class Kaf < Formula
  desc "Kafka CLI inspired by kubectl & docker"
  homepage "https://github.com/birdayz/kaf"
  version "0.1.32"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/birdayz/kaf/releases/download/v#{version}/kaf_#{version}_Darwin_x86_64.tar.gz"
    sha256 "0c63a17c8d708ad5d2f210ade63b487ea165b0f1a59cd1b9ddca00d02c022358"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/birdayz/kaf/releases/download/v#{version}/kaf_#{version}_Linux_x86_64.tar.gz"
      sha256 "4c54f098782bcfa494bd29f479d1ce64e3eee3eea99c9c752e4418cdf73110e5"
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

