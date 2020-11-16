class Verascli < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/VerasThiago/verascli"
  url "https://github.com/VerasThiago/verascli/releases/tag/v2.119.1"
  sha256 "20ac8b1a9fe2e81083cb36cb2401a6ef1eee672f16e37bf6cce20ee048664d95"
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
  