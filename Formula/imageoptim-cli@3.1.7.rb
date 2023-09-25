require "language/node"

class ImageoptimCliAT317 < Formula
  desc "CLI for ImageOptim, ImageAlpha and JPEGmini"
  homepage "https://jamiemason.github.io/ImageOptim-CLI/"
  url "https://github.com/JamieMason/ImageOptim-CLI/archive/3.1.7.tar.gz"
  sha256 "e2bff77c2cace9d28deb464c92dcf393b98baab30439541e2dc073ad1c0b9caf"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "node@18" => :build
  depends_on "yarn" => :build
  depends_on arch: :x86_64 # Installs pre-built x86-64 binaries
  depends_on :macos

  def install
    Language::Node.setup_npm_environment
    system "yarn"
    system "npm", "run", "build"
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/imageoptim -V").chomp
  end
end
