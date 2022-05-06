FROM rust:1.60 as builder
WORKDIR /root/hello-world
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
COPY --from=builder /usr/local/cargo/bin/hello-world /usr/local/bin/hello-world
EXPOSE 8080
WORKDIR /usr/local/cargo/bin
USER nobody
CMD ["hello-world"]