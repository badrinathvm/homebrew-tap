# Homebrew formula for WatchFace Generator
class WatchfaceGenerator < Formula
    desc "Generate .watchface files from a JSON config — no Apple Watch required"

    homepage "https://github.com/badrinathvm/WatchFaceGenerator.git"

    url "https://github.com/badrinathvm/WatchFaceGenerator/archive/refs/tags/v2.0.0.tar.gz"
    version "2.0.0"

    sha256 "c5ac86c586f70ba29f90267c99b8d56afbcdf8f325db5156da89651da50fc139"

    def install
      # Install the Swift script as a standalone executable
      bin.install "WatchFaceGenerator.swift" => "watchface-generator"
    end

    test do
      assert_match "2.0.0", shell_output("#{bin}/watchface-generator --version")
    end
end
