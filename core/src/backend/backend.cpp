#include "backend.hpp"

#include "nlohmann/json.hpp"
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
        httplib::Client client("https://jsonplaceholder.typicode.com");
        const auto res = client.Get("/posts/1");

        if (res)
        {
            spdlog::info(nlohmann::json(res.value().body).dump(4));
        }
        else
        {
            spdlog::error(httplib::to_string(res.error()));
        }

        std::cout << "Hello World!" << std::endl;
    }

}