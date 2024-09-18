#!/usr/bin/env bats

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    
    # Create a temporary directory for testing
    TEST_DIR="$(mktemp -d)"
    
    # Copy the aipack script to the test directory
    cp ../bin/aipack "$TEST_DIR/"
    
    # Make the script executable
    chmod +x "$TEST_DIR/aipack"
    
    # Change to the test directory
    cd "$TEST_DIR"
}

teardown() {
    # Remove the temporary directory
    rm -rf "$TEST_DIR"
}

@test "aipack runs without errors" {
    run "$TEST_DIR/aipack"
    assert_success
    assert_output --partial "Starting aipack"
}

@test "aipack creates output file" {
    run "$TEST_DIR/aipack"
    assert [ -f "packaged_output.txt" ]
}

@test "aipack respects custom output file name" {
    run "$TEST_DIR/aipack" -o "custom_output.txt"
    assert [ -f "custom_output.txt" ]
}

@test "aipack includes specified file extensions" {
    echo "print('Hello')" > test.py
    echo "console.log('Hello')" > test.js
    run "$TEST_DIR/aipack" -e py -e js
    assert_output --partial "=== test.py ==="
    assert_output --partial "=== test.js ==="
}

@test "aipack excludes specified patterns" {
    echo "test content" > include.txt
    echo "test content" > exclude.txt
    run "$TEST_DIR/aipack" -x "exclude*"
    refute_output --partial "=== exclude.txt ==="
    assert_output --partial "=== include.txt ==="
}

@test "aipack removes comments when specified" {
    echo "# This is a comment" > test.py
    echo "print('Hello')" >> test.py
    run "$TEST_DIR/aipack" -r
    refute_output --partial "# This is a comment"
    assert_output --partial "print('Hello')"
}

@test "aipack includes hidden files when specified" {
    echo "hidden content" > .hidden_file
    run "$TEST_DIR/aipack" -H
    assert_output --partial "=== .hidden_file ==="
}

@test "aipack handles different log levels" {
    run "$TEST_DIR/aipack" -v DEBUG
    assert_output --partial "[DEBUG]"
}

@test "aipack generates project structure with directories and files" {
    mkdir -p dir1/subdir
    touch dir1/file1.txt
    touch dir1/subdir/file2.txt
    run "$TEST_DIR/aipack"
    assert_output --partial "=== Project Structure ==="
    assert_output --partial "|-dir1"
    assert_output --partial "  |-subdir"
    assert_output --partial "  |-file1.txt"
    assert_output --partial "    |-file2.txt"
}

@test "aipack handles files without extensions" {
    echo "no extension" > file_without_extension
    run "$TEST_DIR/aipack"
    assert_output --partial "=== file_without_extension ==="
}

@test "aipack respects include patterns" {
    echo "include me" > include_this.txt
    echo "don't include me" > exclude_this.txt
    run "$TEST_DIR/aipack" -i "*include*"
    assert_output --partial "=== include_this.txt ==="
    refute_output --partial "=== exclude_this.txt ==="
}