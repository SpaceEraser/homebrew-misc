class Sfgui < Formula
  desc "Easy to use cross-platform c++ GUI for SFML"
  homepage "https://github.com/TankOs/SFGUI"
  url "https://github.com/TankOs/SFGUI/archive/0.3.0.tar.gz"
  sha256 "400658c2c5bd37c535bd04f1c94f2c1b99d902248ea3b58bf7a2b2d44062fd77"
  head "https://github.com/TankOs/SFGUI.git"

  option "with-static", "Build as static library"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args
    args << "-DSFGUI_BUILD_SHARED_LIBS=FALSE" if build.with? "static"

    system "cmake", ".", *args
    system "make", "install"
  end
end
