class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.3.2/nono-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "500452c9b088186704a9c8410238f26c139fca1740bf1392ebedd7114882f371"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.3.2/nono-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "38f250d7568aaf7bb6596ea414fb47a172b43d30bb0a48ff5fcbebebc26ecc31"
    end
  end

  def install
    bin.install "nono"
  end

  def caveats
    <<~EOS
      nono uses macOS Seatbelt for sandboxing.

      Quick start:
        nono run --allow . -- your-command

      For more information:
        nono --help
        nono run --help
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nono --version")
  end
end
