class Verascli < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/VerasThiago/verascli"
  url "https://github.com/VerasThiago/verascli/releases/tag/v2.119.1"
  sha256 "cf1368d29e29c858b90be6cb024261facfeb89738542694a8a818ede67c7d6f8"
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
  