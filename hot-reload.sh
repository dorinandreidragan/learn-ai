#!/bin/bash

# Path to your Jupyter Book directory
BOOK_DIR="./my-book"

# Directory to serve the statically generated site
BUILD_DIR="$BOOK_DIR/_build/html"

# PID of the web server
SERVER_PID=""

# Function to build the Jupyter Book
build_book() {
    jupyter-book build "$BOOK_DIR"
}

# Function to start the web server
start_server() {
    cd "$BUILD_DIR"
    python3 -m http.server 8080 &
    # Save the PID of the web server
    SERVER_PID=$!
}

# Function to stop the web server
stop_server() {
    if [ -n "$SERVER_PID" ]; then
        kill "$SERVER_PID"
        wait "$SERVER_PID"
        SERVER_PID=""
    fi
}

# Initial build
build_book

# Start the web server after the initial build
start_server &

# Watch for changes and trigger build and server restart on file modification
while true; do
    # Wait for changes in the book directory
    inotifywait -r -e modify,move,create,delete "$BOOK_DIR"

    # Stop the web server before the build
    # stop_server

    # Build the Jupyter Book on changes
    build_book

    # Restart the web server after the build
    # start_server &
done
