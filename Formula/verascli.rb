class Verascli < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/VerasThiago/verascli"
  url "https://vtex-toolbelt-test.s3.amazonaws.com/vtex-v2.121.1/vtex-v2.121.1-darwin-x64.tar.gz"
  version "2.121.1"
  sha256 "b2cd27f1f333f4ec1d9e62971905e6f8d862625cf8503b5eafd2c0a32f120584"
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
