class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.4/nono-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "a2a114be321890b85296b23d69d70482a95a254dd9c5ba1eba3ac7df0c8d3d73"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.4/nono-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "6740b090d12f3bc4088d9e6415b90f263db5af33d17095b250bf1cd3a18d8573"
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
