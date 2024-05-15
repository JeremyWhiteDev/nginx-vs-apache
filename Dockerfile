FROM golang:1.22

# Creates an app directory to hold the app's source code
WORKDIR /app
 
# Copies all files from the root directory into /app
COPY . ./
 
# Installs Go dependencies
RUN go mod download

# Builds the app with optional configuration
RUN CGO_ENABLED=0 GOOS=linux go build -o webapp
 
# Tells Docker which network port the container listens on
EXPOSE 8080 

 # Specifies the executable command that runs when the container starts
ENTRYPOINT ["/app/webapp"]
