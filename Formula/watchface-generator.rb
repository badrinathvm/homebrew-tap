# Homebrew formula for WatchFace Generator
class WatchfaceGenerator < Formula
    desc "Generate .watchface files from a JSON config — no Apple Watch required"

    homepage "https://github.com/badrinathvm/WatchFaceGenerator.git"

    url "https://github.com/badrinathvm/WatchFaceGenerator/archive/refs/tags/v1.0.0.tar.gz"
    version "1.0.0"

    sha256 "17d9999580e2ccabc0ae5491e79d201a1d2c78e899340eac26a45e4482385020"

    def install
      # Install the Swift script as a standalone executable
      bin.install "WatchFaceGenerator.swift" => "watchface-generator"
    end

    test do
      assert_match "1.0.0", shell_output("#{bin}/watchface-generator --version")
    end
end
