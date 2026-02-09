class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.3.0/nono-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "8de9e940096396cb8921205e3b9a1a5e9a4d33b5e81646a19d0c1acec4dfd657"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.3.0/nono-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "f342a31949d790c56425ede80e17a3680cbe83bc2207584beaf19da2e7e3b1e0"
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
