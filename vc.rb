class Vc < Formula
  desc "SIMD Vector Classes for C++"
  homepage "https://github.com/VcDevel/Vc"
  url "https://github.com/VcDevel/Vc/releases/download/1.1.0/Vc-1.1.0.tar.gz"
  sha256 "9772c27f3841b2c5435f1f587073904dbd1109e2313642dcc3315da6cffa6aed"
  head "https://github.com/VcDevel/Vc.git"

  depends_on "cmake" => :build

  def install
    mkdir "build"

    cd "build" do
      system "cmake", "..", *std_cmake_args

      system "make", "install"
    end
  end
end
