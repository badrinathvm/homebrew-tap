class SwiftVersionMcp < Formula
    desc "Swift version MCP"
    homepage "https://github.com/badrinathvm/SwiftVersionMCP"
    url "https://github.com/badrinathvm/SwiftVersionMCP/archive/refs/heads/main.tar.gz"
    version "1.2.0"
    sha256 "2764bc07cb037169c1180de354760d8c0f9548fe2f17fa0cb520ba6f7bb188c9"
  
    depends_on "swift"
  
    def install
      # Debug: Show what's actually in the extracted directory
      puts "=== Current directory contents ==="
      system "pwd"
      system "ls", "-la"
      
      puts "=== Looking for directories ==="
      system "find", ".", "-type", "d", "-maxdepth", "2"
      
      puts "=== Looking for Package.swift ==="
      system "find", ".", "-name", "Package.swift"
      
      # Try to find any directory that might be the extracted one
      extracted_dirs = Dir.glob("SwiftVersionMCP*")
      puts "=== Found SwiftVersionMCP directories: #{extracted_dirs} ==="
      
      if extracted_dirs.empty?
        # If no SwiftVersionMCP directory, maybe it's extracted directly
        swift_bin = Formula["swift"].opt_bin/"swift"
        system swift_bin, "build", "--configuration", "release"
        bin.install ".build/release/SwiftVersionMCP" => "swift-version-mcp"
      else
        # Use the first found directory
        cd extracted_dirs.first do
          swift_bin = Formula["swift"].opt_bin/"swift"
          system swift_bin, "build", "--configuration", "release"
          bin.install ".build/release/SwiftVersionMCP" => "swift-version-mcp"
        end
      end
    end
  
    test do
      system "#{bin}/swift-version-mcp", "--help"
    end
  end