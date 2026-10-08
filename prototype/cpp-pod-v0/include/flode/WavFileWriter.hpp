#pragma once

#include <cstdint>
#include <filesystem>
#include <vector>

namespace flode {

void writeStereoPcm16Wav(const std::filesystem::path& outputPath,
                         std::uint32_t sampleRate,
                         const std::vector<float>& left,
                         const std::vector<float>& right);

} // namespace flode
