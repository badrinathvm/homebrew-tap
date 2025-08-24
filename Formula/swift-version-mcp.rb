class SwiftVersionMcp < Formula
    desc "Swift version MCP"
    homepage "https://github.com/badrinathvm/SwiftVersionMCP"
    url "https://github.com/badrinathvm/SwiftVersionMCP/archive/refs/heads/main.tar.gz"
    version "1.2.0"
    sha256 "2764bc07cb037169c1180de354760d8c0f9548fe2f17fa0cb520ba6f7bb188c9"
  
    depends_on "swift"
  
    def install
      puts "=== Current directory contents ==="
      system "pwd"
      system "ls", "-la"
      
      puts "=== All files recursively ==="
      system "find", ".", "-type", "f"
      
      puts "=== Looking for Package.swift anywhere ==="
      system "find", ".", "-name", "Package.swift"
      
      puts "=== Looking for any .swift files ==="
      system "find", ".", "-name", "*.swift"
      
      # Check if Package.swift exists in current directory
      if File.exist?("Package.swift")
        puts "=== Package.swift found in current directory ==="
      else
        puts "=== Package.swift NOT found in current directory ==="
      end
      
      swift_bin = Formula["swift"].opt_bin/"swift"
      system swift_bin, "build", "--configuration", "release"
      bin.install ".build/release/SwiftVersionMCP" => "swift-version-mcp"
    end
  
    test do
      system "#{bin}/swift-version-mcp", "--help"
    end
  end