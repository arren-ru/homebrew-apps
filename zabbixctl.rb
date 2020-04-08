class Zabbixctl < Formula
  desc "Zabbixctl is tool for working with zabbix server api using command line interface"
  version "20191128.52_64ed81a-1"
  url "https://github.com/kovetskiy/zabbixctl.git", :revision => "64ed81a0e3957596e68c0ae1e7d8f4df50a83aee"

  bottle :unneeded

  depends_on "go" => :build
  def install
    ENV["GOPATH"] = buildpath

    contents = buildpath.children - [buildpath/".brew_home"]
    (buildpath/"src/github.com/kovetskiy/zabbixctl").install contents
    (buildpath/"bin").mkpath

    cd "src/github.com/kovetskiy/zabbixctl" do
      system "make", "build"
      bin.install "zabbixctl"
    end
  end

  test do
    system "#{bin}/zabbixctl", "--version"
    assert_match "#{version}", shell_output("#{bin}/zabbixctl --version")
  end
end

