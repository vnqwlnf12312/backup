#pragma once

#include <boost/filesystem.hpp>

namespace utils {

boost::filesystem::path Canonize(const boost::filesystem::path& path);

}  // namespace utils
