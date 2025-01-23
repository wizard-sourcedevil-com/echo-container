# Use a Red Hat UBI-based Go image for building
FROM registry.access.redhat.com/ubi8/go-toolset:1.19 as builder

# Switch to root to avoid write permission issues
USER 0

# Set the working directory
WORKDIR /app

# Copy Go module and source files
COPY go.mod .
COPY main.go .

# Build the Go application
RUN go build -o main .

# Use a minimal Red Hat UBI base image
FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

# Set the working directory
WORKDIR /root/

# Copy the built Go application from the builder
COPY --from=builder /app/main .

# Set the entrypoint to the Go application
ENTRYPOINT ["./main"]
