class DocoptCpp < Formula
  desc "C++11 port of docopt"
  homepage "http://docopt.org"
  head "https://github.com/docopt/docopt.cpp.git"

  option "without-static", "Build withut static libraries"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args

    args << "-DWITH_STATIC=OFF" if build.without? "static"

    system "cmake", ".", *args

    system "make", "install"
  end
end
