# Homebrew formula for WatchFace Generator
class WatchfaceGenerator < Formula
    desc "Generate .watchface files from a JSON config — no Apple Watch required"

    homepage "https://github.com/badrinathvm/WatchFaceGenerator.git"

    url "https://github.com/badrinathvm/WatchFaceGenerator/archive/refs/tags/v2.1.0.tar.gz"
    version "2.1.0"

    sha256 "de98ef9763824f58ec2d420bfe350a95b510552e0700b7ef9e78ae230da82525"

    def install
      # Install the Swift script as a standalone executable
      bin.install "WatchFaceGenerator.swift" => "watchface-generator"
    end

    test do
      assert_match "2.1.0", shell_output("#{bin}/watchface-generator --version")
    end
end
