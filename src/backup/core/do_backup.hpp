#pragma once

#include <string>

namespace core {

void DoFullBackup(const std::string& backup_from,
                  const std::string& backup_to);

void DoIncrementalBackup(const std::string& backup_from,
                        const std::string& backup_to);

}  // namespace core
