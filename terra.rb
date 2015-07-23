require "formula"

class Terra < Formula
  desc "A low-level system programming language that is designed to interoperate seamlessly with the Lua programming language"
  homepage "http://terralang.org/"
  url "https://github.com/zdevito/terra/archive/release-2015-07-21.tar.gz"
  version "2015-07-21"
  sha256 "459117eb424e34d8fd7ab9c794b3f3679449ff211997af801e68ab00b201ee91"
  head "https://github.com/zdevito/terra.git"

  depends_on "llvm35" => :build

  def install
    File.open("Makefile.inc", "w") { |f| f.write("LLVM_CONFIG = #{Formula["llvm35"].opt_prefix}/bin/llvm-config-3.5") }

    bin.mkpath

    system "make"

    bin.install "release/bin/terra"
    mv "release/lib", lib
    mv "release/include", include
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/terra", "-") do |stdin, stdout, _|
      stdin.write('print("Hi!")')
      stdin.close
      assert_equal "Hi!\n", stdout.read
    end
  end
end
