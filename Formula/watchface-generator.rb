# Homebrew formula for WatchFace Generator
class WatchfaceGenerator < Formula
    desc "Generate .watchface files from a JSON config — no Apple Watch required"

    homepage "https://github.com/badrinathvm/WatchFaceGenerator.git"

    url "https://github.com/badrinathvm/WatchFaceGenerator/archive/refs/tags/v2.0.0.tar.gz"
    version "2.0.0"

    sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"

    def install
      # Install the Swift script as a standalone executable
      bin.install "WatchFaceGenerator.swift" => "watchface-generator"
    end

    test do
      assert_match "1.0.0", shell_output("#{bin}/watchface-generator --version")
    end
end
