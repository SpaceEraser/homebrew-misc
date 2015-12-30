class Vexcl < Formula
  desc "C++ vector expression template library for OpenCL/CUDA"
  homepage "https://ddemidov.github.io/vexcl"
  url "https://github.com/ddemidov/vexcl/archive/1.3.3.tar.gz"
  sha256 "f07bc27700500a0236055528475bf932d3f815dbbb6c0cc65165ab644de50cba"
  head "https://github.com/ddemidov/vexcl.git"

  option "with-logging", "Log vector copies to stdout for debugging purposes"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args
    args << "-DVEXCL_SHOW_COPIES=ON" if build.with? "logging"

    system "cmake", ".", *args

    system "make", "install"
  end
end
