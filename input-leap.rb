ENV["B_BUILD_TYPE"] = "Release"
cask "input-leap" do
    version "2.4.0"
    url "https://github.com/input-leap/input-leap.git" revision: ad3c0e32672cc1916173ac5539bf80104d12c9f8
    name "Input Leap"
    desc "Open-source KVM software"
    homepage "https://github.com/input-leap/input-leap"
  
    depends_on formula: "qt5"
    depends_on formula: "openssl"
    depends_on formula: "pkg-config"
    depends_on formula: "cmake"
    depends_on macos: :ventura
    depends_on arch: :intel

    installer script: {
        executable: "clean_build.sh",
    }
    
    app "build/bundle/InputLeap.app"
end
