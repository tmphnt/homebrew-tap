class GhosttySmoothscroll < Formula
  desc "Smooth, Vimium-style keyboard scrolling for Ghostty on macOS"
  homepage "https://github.com/tmphnt/ghostty-smoothscroll"
  url "https://github.com/tmphnt/ghostty-smoothscroll/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "23c6cc101c58d9189f6bec369f824a806c79f4d35970d80bcac2a863a883a5eb"
  license "MIT"

  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/ghostty-smoothscroll"
  end

  def caveats
    <<~EOS
      To finish setting up, run:
        ghostty-smoothscroll setup
      then reload Ghostty's config (⌘⇧,) and allow Accessibility when macOS asks.

      After `brew upgrade`, macOS may ask for Accessibility permission again.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghostty-smoothscroll version")
  end
end
