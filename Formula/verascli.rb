class Verascli < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/VerasThiago/verascli"
  url "https://github.com/VerasThiago/verascli/releases/download/v2.119.1/verascli-v2.119.1-darwin-x64.tar.gz"
  sha256 "85b799e19426f5891a1a2cca620660c4107df4e4bad33d781b0ff63eb5ab0d0d"
  license "MIT"
  version "2.119.1"

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
  