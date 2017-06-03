class Anax < Formula
  desc "Open source C++ entity system designed to be portable, lightweight and easy to use"
  homepage "https://github.com/miguelmartin75/anax"
  url "https://github.com/miguelmartin75/anax/archive/v2.1.0.tar.gz"
  head "https://github.com/miguelmartin75/anax.git"

  option "with-tests", "Build tests"
  option "with-debug", "Build debug library"
  option "with-docs", "Build documentation"
  option "with-examples", "Build examples"
  option "with-static", "Build only static libraries"
  option "with-32bit-ids", "Build with 32bit entity IDs"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTS=ON" if build.with? "tests"
    args << "-DBUILD_DOCS=ON" if build.with? "docs"
    args << "-DBUILD_EXAMPLES=ON" if build.with? "examples"
    args << "-DBUILD_SHARED_LIBS=OFF" if build.with? "static"
    args << "-DANAX_32_BIT_ENTITY_IDS=ON" if build.with? "32bit-ids"

    system "cmake", ".", *args

    system "make", "install"

    if build.with? "debug"
      args = std_cmake_args
      args << "-DCMAKE_BUILD_TYPE=DEBUG"
      args << "-DCMAKE_C_FLAGS_RELEASE=-DDEBUG"
      args << "-DCMAKE_CXX_FLAGS_RELEASE=-DDEBUG"
      
      args << "-DBUILD_SHARED_LIBS=OFF" if build.with? "static"
      args << "-DANAX_32_BIT_ENTITY_IDS=ON" if build.with? "32bit-ids"

      system "cmake", ".", *args

      system "make", "install"
    end
  end
end
