class GhosttySmoothscroll < Formula
  desc "Smooth, Vimium-style keyboard scrolling for Ghostty on macOS"
  homepage "https://github.com/tmphnt/ghostty-smoothscroll"
  url "https://github.com/tmphnt/ghostty-smoothscroll/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "4cfbddff777765b18d26c890e7ac29ef864dd4d89109b686df597cf5739b3be3"
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
      then reload Ghostty's config (⌘⇧,) and allow ghostty-smoothscroll when macOS
      asks (Device Control and Data Access on macOS 27+, Accessibility before).

      After `brew upgrade`, macOS may ask for the permission again:
      `ghostty-smoothscroll permissions` opens the pane.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghostty-smoothscroll version")
  end
end
