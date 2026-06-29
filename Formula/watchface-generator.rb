# Homebrew formula for WatchFace Generator
class WatchfaceGenerator < Formula
    desc "Generate .watchface files from a JSON config — no Apple Watch required"

    homepage "https://github.com/badrinathvm/WatchFaceGenerator.git"

    url "https://github.com/badrinathvm/WatchFaceGenerator/archive/refs/tags/v2.0.0.tar.gz"
    version "2.0.0"

    sha256 "aec91238eb267d8b98e2bbda7cff5a200e2f218c4627ab69b1a88a5bbce28f82"

    def install
      # Install the Swift script as a standalone executable
      bin.install "WatchFaceGenerator.swift" => "watchface-generator"
    end

    test do
      assert_match "1.0.0", shell_output("#{bin}/watchface-generator --version")
    end
end
