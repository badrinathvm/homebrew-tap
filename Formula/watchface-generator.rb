# Homebrew formula for WatchFace Generator
class WatchfaceGenerator < Formula
    desc "Generate .watchface files from a JSON config — no Apple Watch required"

    homepage "https://github.com/badrinathvm/WatchFaceGenerator"

    url "https://github.com/badrinathvm/WatchFaceGenerator/archive/refs/tags/v1.0.0.tar.gz"
    version "1.0.0"

    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

    def install
      # Install the Swift script as a standalone executable
      bin.install "WatchFaceGenerator.swift" => "watchface-generator"
    end

    test do
      assert_match "1.0.0", shell_output("#{bin}/watchface-generator --version")
    end
end
