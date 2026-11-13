class GhosttySmoothscroll < Formula
  desc "Smooth, Vimium-style keyboard scrolling for Ghostty on macOS"
  homepage "https://github.com/tmphnt/ghostty-smoothscroll"
  url "https://github.com/tmphnt/ghostty-smoothscroll/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "3ec3f8a6c22023a271807e5bc0a00983963a0302d1aab914befb35c2bbe17ba0"
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
      (it asks before each change), then reload Ghostty's config (⌘⇧,) and allow ghostty-smoothscroll when macOS
      asks (Device Control and Data Access on macOS 27+, Accessibility before).

      After `brew upgrade`, macOS may ask for the permission again:
      `ghostty-smoothscroll permissions` opens the pane.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghostty-smoothscroll version")
  end
end
