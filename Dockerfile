FROM conanio/clang12-ubuntu16.04:1.40.1 as builder
USER root
WORKDIR /project
COPY src ./src
COPY test ./test
COPY CMakeLists.txt ./CMakeLists.txt
# временный хак пока обертку не обновят
# RUN conan remote rename conancenter conan-center
RUN cmake -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" -B ./bin
RUN cmake --build ./bin --target all
RUN ./bin/test

FROM debian as backend
COPY --from=builder /project/bin/liblib /liblib
