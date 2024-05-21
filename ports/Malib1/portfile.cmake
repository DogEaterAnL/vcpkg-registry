vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/DogEaterAnL/vcpkg-registry
    REF 4a0167ba201c805255e544027dd274d04aa7677f
)
vcpkg_msbuild_install(
    SOURCE_PATH "${SOURCE_PATH}"
    PROJECT_SUBPATH "build/MaLib/MaLib.sln"
    TARGET MaLib
    PLATFORM ${VCPKG_TARGET_ARCHITECTURE}
)
file(GLOB HEADER_FILES LIST_DIRECTORIES false "${SOURCE_PATH}/include/*.h")
file(INSTALL
    ${HEADER_FILES}
    DESTINATION "${CURRENT_PACKAGES_DIR}/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")