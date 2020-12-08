class Verascli < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/VerasThiago/verascli"
  url "https://vtex-toolbelt-test.s3.amazonaws.com/vtex-v2.120.0/vtex-v2.120.0-darwin-x64.tar.gz"
  version "2.120.0"
  sha256 "d7d53e9bb37473a978af1ba6f53f9efcea5b79d14e0049c3d9fd26c0d0777a16"
  license "MIT"

  def install
    inreplace "bin/verascli", /^CLIENT_HOME=/, "export VERASCLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/verascli"
    system "ln", "-s", libexec, libexec/"node_modules/vtex"
  end

  def caveats
    <<~EOS
      VTEX installed!
    EOS
  end

  test do
    system bin/"verascli", "version"
  end
end
