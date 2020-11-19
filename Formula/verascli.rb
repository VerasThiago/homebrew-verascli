class Verascli < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/VerasThiago/verascli"
  url "https://github.com/VerasThiago/verascli/releases/download/v2.119.2/verascli-v2.119.2-darwin-x64.tar.gz"
  sha256 "5bb74a05e52b4e69d754df31befefcd2463c58c26cfe5cff030a6bb7722be1a7"
  license "MIT"
  version "2.119.2"

  def install
    inreplace "bin/verascli", /^CLIENT_HOME=/, "export VERASCLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/verascli"
    system "ln", "-s", libexec, libexec/"node_modules/vtex"
  end

  def caveats; <<~EOS
    VTEX installed!
  EOS
  end

  test do
    system bin/"verascli", "version"
  end
end
  