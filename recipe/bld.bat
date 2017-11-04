copy %RECIPE_DIR%\CMakeLists.txt .
mkdir build
cd build
cmake -G"NMake Makefiles" ..
cmake --build .
cmake --build . --target install
