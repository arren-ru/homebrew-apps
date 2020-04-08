class Orgalorg < Formula
  desc "Parallel SSH commands executioner and file synchronization tool"
  version "200115.158_70019e7"
  url "https://github.com/reconquest/orgalorg.git", :revision => "70019e77521102efe3d062f31e2573ef10993334"

  bottle :unneeded

  depends_on "go" => :build
  def install
    ENV["GOPATH"] = buildpath
    
    contents = buildpath.children - [buildpath/".brew_home"]
    (buildpath/"src/github.com/reconquest/orgalorg").install contents
    (buildpath/"bin").mkpath

    cd "src/github.com/reconquest/orgalorg" do
      system "go", "build", "-ldflags=-X main.version=#{version}", "-gcflags=-trimpath #{buildpath}/src"
      bin.install "orgalorg"
    end
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/zabbixctl --version")
  end
end

