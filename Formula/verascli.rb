class Verascli < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/VerasThiago/verascli"
  url "https://vtex-toolbelt-test.s3.amazonaws.com/vtex-v2.121.2/vtex-v2.121.2-darwin-x64.tar.gz"
  version "2.121.2"
  sha256 "410baa95cc15ef457c80b87b000f9755d53d1c492226a0bdb921a1a2389d0064"
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
