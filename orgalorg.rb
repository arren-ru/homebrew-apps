class Orgalorg < Formula
  desc "Parallel SSH commands executioner and file synchronization tool"
  version "200630.160_84ef7d26"
  url "https://github.com/reconquest/orgalorg.git", :revision => "84ef7d267f2fcc836675501a4cac07b5ef5d691b"

  bottle :unneeded

  depends_on "go" => :build
  def install
    ENV["GOPATH"] = buildpath
    
    contents = buildpath.children - [buildpath/".brew_home"]
    (buildpath/"src/github.com/reconquest/orgalorg").install contents
    (buildpath/"bin").mkpath

    cd "src/github.com/reconquest/orgalorg" do
      system "go", "mod", "vendor"
      system "go", "build", "-mod=vendor", "-ldflags=-X main.version=#{version}", "-gcflags=-trimpath #{buildpath}/src"
      bin.install "orgalorg"
    end
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/orgalorg --version")
  end
end

