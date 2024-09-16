#!/usr/bin/env bats

# Load common helper functions, if necessary
load ../lib/utils.sh

# Test 1: Check if aipack shows the correct usage information
@test "aipack displays usage information" {
  run ../bin/aipack -h
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage: aipack"* ]]
}

# Test 2: Check if aipack outputs the correct version
@test "aipack displays version" {
  run ../bin/aipack -v
  [ "$status" -eq 0 ]
  [[ "$output" == *"Version 1.1.4"* ]]
}

# Test 3: Check if aipack can package a directory
@test "aipack packages directory correctly" {
  # Create a temporary directory to test
  mkdir tmp_dir
  touch tmp_dir/testfile.txt
  run ../bin/aipack -d tmp_dir -o output.txt
  [ "$status" -eq 0 ]
  [ -f tmp_dir/output.txt ]
  grep "testfile.txt" tmp_dir/output.txt
  rm -rf tmp_dir
}

# Test 4: Check if aipack handles invalid directories
@test "aipack fails on invalid directory" {
  run ../bin/aipack -d invalid_dir
  [ "$status" -eq 1 ]
  [[ "$output" == *"ERROR: Directory 'invalid_dir' not found."* ]]
}

# Test 5: Check if aipack excludes files with specific extensions
@test "aipack excludes files based on extension" {
  mkdir tmp_dir
  touch tmp_dir/file1.js tmp_dir/file2.py
  run ../bin/aipack -d tmp_dir -o output.txt -e js
  [ "$status" -eq 0 ]
  ! grep "file1.js" tmp_dir/output.txt
  grep "file2.py" tmp_dir/output.txt
  rm -rf tmp_dir
}

# Test 6: Check if aipack compresses output
@test "aipack compresses output correctly" {
  mkdir tmp_dir
  touch tmp_dir/testfile.txt
  run ../bin/aipack -d tmp_dir -o output.txt -c
  [ "$status" -eq 0 ]
  [ -f tmp_dir/output.txt.gz ]
  rm -rf tmp_dir
}

# Add more tests as needed
