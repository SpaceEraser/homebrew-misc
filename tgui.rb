class Tgui < Formula
  desc "Easy to use cross-platform c++ GUI for SFML"
  homepage "https://github.com/texus/TGUI"
  url "https://github.com/texus/TGUI/archive/v0.6.9.tar.gz"
  sha256 "9bbde01e918e950e484d75b3eaeb0c77f38180865f3cfcb188a56e77a62db8bb"
  head "https://github.com/texus/TGUI.git"

  devel do
    url "https://github.com/texus/TGUI/archive/v0.7-alpha2.tar.gz"
    version "0.7-alpha2"
    sha256 "12da819d3e396a3d3369051e3b40eb1c8f660a13dd5648706235aa282f415e4a"
  end

  option "with-static", "Build as static library"
  option "with-framework", "Build framework instead of unix style libraries"
  option "with-doc", "Build with docs"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args
    args << "-DTGUI_SHARED_LIBS=FALSE" if build.with? "static"
    args << "-DTGUI_BUILD_FRAMEWORK=TRUE" if build.with? "framework"
    args << "-DTGUI_BUILD_DOC=TRUE" if build.with? "doc"

    system "cmake", ".", *args
    system "make", "install"
  end
end
