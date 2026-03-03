class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/always-further/nono"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.9.0/nono-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "e130f3e82441d80222c8558e081a69a6f58bc65114914529ee82a69dbc345c18"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.9.0/nono-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "448cadf390158b54cfbb329584021b2c1da247cd34aaa9040164974be72af563"
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
