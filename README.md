# Native Library

A cross-platform `C++20` native library template with dependency manager, powered by integration
of [`CMake`](https://cmake.org/)
with [`Conan`](https://github.com/conan-io/cmake-conan).

## Usage

Make sure you are signed in to your GitHub account, then just
click [`here`](https://github.com/demidko/native-library/generate) to use template.

## Features and benefits

* Full compatibility with existing technologies. No build configuration files are added except for the
  traditional `CMakeLists.txt`.
* Created projects are supported in `CLion`,` Visual Studio`, `VS Code` IDEs.
* Dockerfile of executable container and GitHub actions CI already exists by default.
* Easy deploy to Digital Ocean.
* Adding dependencies [right in CMakeLists.txt](https://github.com/conan-io/cmake-conan) only.
* A project with all dependencies can be built on different OS without configuration changes.

## Build

We need [`CMake`](https://cmake.org/download) build system and [`Conan`](https://conan.io) manager libraries.

Prepare the project for building in release mode:

```shell
cmake -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" -B bin
```

Building together the application and tests:

```shell
cmake --build bin --target all
```  

After that, the utility will appear in the `bin` directory under the name `lib`. The tests can be run by launching
the `test` file located nearby.

## Interop with Java

See [JNR project](https://github.com/jnr/jnr-ffi)

## Containerization

We need [`Docker`](https://www.docker.com/) installed:

```shell
docker build . -t utility
```

After that, we can run the utility in the container (if needed):

```shell
docker run -it utility
```

## Deploy

The sample configuration already exists in the `.do` directory. To deploy the application, just click the button.

[![Deploy to DigitalOcean](https://www.deploytodo.com/do-btn-blue-ghost.svg)](https://cloud.digitalocean.com/apps/new?repo=https://github.com/demidko/timecobot2/tree/main)

## Conventions

* The entry point must be located in the `Main.cpp` file for correct build script work.
* To initialize resources, we using [modern parameter passing by value](https://habr.com/ru/post/460955/), rather than a
  constant link.
* Only the result of the compilation of `* .cpp` files in the` src` folder is included in the release assembly.
* The `src` folder contains the` *.cpp` and `*.h` project files together.
* The `test` folder contains the` *.cpp` and `*.h` project test files together.
* Each `*.h` file must define only one entity in the global namespace, whose name must match the file name.
* The contents of `*.cpp` files not declared in` *.h` file must be protected from `external linkage` from others
  compilation units by adding them to the anonymous namespace or adding the keyword `static`.
