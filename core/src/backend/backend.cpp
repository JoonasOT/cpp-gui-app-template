#include "backend.hpp"

#include "spdlog/spdlog.h"

#define CPPHTTPLIB_OPENSSL_SUPPORT
#pragma warning(disable : 4127)
#include "httplib.h"
#pragma warning(default : 4127)

#include <iostream>

#include "shared/swappable.hpp"

namespace backend
{

    void test()
    {
        spdlog::info("backend val, {}", swappable::VAL);
        httplib::Client client("https://github.com/");
        const auto res = client.Get("/yhirose/cpp-httplib");

        if (res)
        {
            spdlog::info(res.value().body.substr(0, 10'000));
        }
        else
        {
            spdlog::error(httplib::to_string(res.error()));
        }

        std::cout << "Hello World!" << std::endl;
    }

}