# baze unit tests
function but() {
  if [ $# -ne 1 ]; then
    echo "Usage: but <fully_qualified_class_and_method>"
    return 1
  fi

  full_class_and_method="$1"

  # Extract the class name and method name
  class_name="${full_class_and_method%.*}"
  method_name="${full_class_and_method##*.}"

  # Construct the test filter
  test_filter="${class_name}#${method_name}"

  # Execute the Bazel test command
  bazel test //ingredient_generation_server:unit-tests \
    --java_debug \
    --test_filter="${test_filter}" \
    --test_arg=--debug
}
