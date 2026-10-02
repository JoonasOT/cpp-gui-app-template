#include "backend.hpp"

#include "spdlog/spdlog.h"

#include <iostream>

namespace backend
{

    void PrintHelloWorld()
    {
        spdlog::info("Hello from spdlog!");
        std::cout << "Hello World!" << std::endl;
    }

}