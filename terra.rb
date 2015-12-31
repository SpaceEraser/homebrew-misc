require "formula"

class Terra < Formula
  desc "A low-level system programming language that is designed to interoperate seamlessly with the Lua programming language"
  homepage "http://terralang.org/"
  url "https://github.com/zdevito/terra/archive/release-2015-08-03.tar.gz"
  version "2015-08-03"
  sha256 "13e7ecfa1ac5ab5cf932d1a481d604739bae6d2afdafd326c1678b648881548b"
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
