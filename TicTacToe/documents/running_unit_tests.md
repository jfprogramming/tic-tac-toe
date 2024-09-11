# To run the projects unit tests follow these steps:

## Navigate to your build directory:
- cd build

## Run the GoogleTest executable:
- ./GoogleTests

## Run the QTest executable:
- ./QTests

- **Use CTest to run all tests**: 
  - CTest is a testing tool that comes with CMake and can be used to run all tests defined in your project. 

  - **Simply run**:
    - ctest
    - This will execute all the tests discovered by CMake, including both GoogleTest and QTest tests.
