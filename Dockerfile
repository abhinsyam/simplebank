# BUILD STAGE 
FROM golang:1.22-alpine3.21 AS builder
WORKDIR /app

# SOURCE . (current root director), DEST . (WORKDIR). Copy all from root to app
COPY . .  

# Build our app to single binary executable file. 
# main --> output binary file, main.go --> entry point.
RUN go build -o main main.go 


# RUN STAGE
FROM alpine:3.13
WORKDIR /app
# Copy builded binary executable from /app/main to current directory .
COPY --from=builder /app/main .
COPY app.env .

# The container listens on specified network port
EXPOSE 8080

# Default command to run when container starts
CMD [ "/app/main" ]


# Now run docker run command to build, single binary executable
# docker build -t name:tag Directory (docker build -t simplebank:latest .)