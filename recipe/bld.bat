copy %RECIPE_DIR%\CMakeLists.txt .
copy %RECIPE_DIR%\isl_config.h.cmake .
copy %RECIPE_DIR%\isl_srcdir.c.cmake .
mkdir build
cd build
cmake -G"NMake Makefiles" ..
cmake --build .
cmake --build . --target install
