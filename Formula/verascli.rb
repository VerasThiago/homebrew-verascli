class Verascli < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/VerasThiago/verascli"
  url "https://github.com/VerasThiago/verascli/releases/download/v2.119.1/verascli-v2.119.1-darwin-x64.tar.gz"
  sha256 "90181447004c59703ae11c0e861e3893b8d74177872b78a927bdc9689801aa2a"
  license "MIT"

  def install
    inreplace "bin/verascli", /^CLIENT_HOME=/, "export VERASCLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/verascli"
  end

  def caveats; <<~EOS
    Testing CLI POC
  EOS
  end

  test do
    system bin/"verascli", "version"
  end
end
  