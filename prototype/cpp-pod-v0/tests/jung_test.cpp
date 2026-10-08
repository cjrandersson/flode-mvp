#include "flode/Jung.hpp"

#include <cassert>
#include <cmath>
#include <iostream>
#include <stdexcept>
#include <vector>

namespace {

bool near(double actual, double expected, double epsilon = 1.0e-12) {
    return std::abs(actual - expected) <= epsilon;
}

} // namespace

int main() {
    const flode::JungConfig config;
    const flode::MasterClock clock(44100.0, config.clock);

    assert(clock.ticksPerBar() == 16);
    assert(clock.frameAtTick(0) == 0);
    assert(clock.frameAtTick(64) == 368139);
    assert(clock.frameAtTick(128) == 736278);

    flode::JungController jung(config);
    assert(jung.decisionCadenceTicks() == 64);
    assert(jung.cooldownTicks() == 64);

    std::vector<flode::JungTickEvent> notableEvents;
    for (std::uint64_t tick = 0; tick <= 192; ++tick) {
        const auto event = jung.onTick(tick);
        if (event.type != flode::JungEventType::None) {
            notableEvents.push_back(event);
        }
    }

    assert(notableEvents.size() == 7);
    assert(notableEvents[0].type == flode::JungEventType::InterventionStart);
    assert(notableEvents[0].tick == 64);
    assert(notableEvents[0].interventionStep == 0);
    assert(near(notableEvents[0].rate, 1.0));
    assert(near(notableEvents[0].decisionRoll, 0.13691238828509866));

    assert(notableEvents[1].type == flode::JungEventType::InterventionStep);
    assert(notableEvents[1].tick == 65);
    assert(notableEvents[1].interventionStep == 1);
    assert(near(notableEvents[1].rate, 1.5));

    assert(notableEvents[2].type == flode::JungEventType::InterventionStep);
    assert(notableEvents[2].tick == 66);
    assert(notableEvents[2].interventionStep == 2);
    assert(near(notableEvents[2].rate, 1.5));

    assert(notableEvents[3].type == flode::JungEventType::InterventionStep);
    assert(notableEvents[3].tick == 67);
    assert(notableEvents[3].interventionStep == 3);
    assert(near(notableEvents[3].rate, 1.0));

    assert(notableEvents[4].type == flode::JungEventType::ReturnHome);
    assert(notableEvents[4].tick == 68);

    assert(notableEvents[5].type == flode::JungEventType::DecisionCooldown);
    assert(notableEvents[5].tick == 128);

    assert(notableEvents[6].type == flode::JungEventType::DecisionHold);
    assert(notableEvents[6].tick == 192);
    assert(near(notableEvents[6].decisionRoll, 0.2322455211435256));
    assert(jung.interventionsCompleted() == 1);
    assert(!jung.interventionActive());

    flode::JungController replay(config);
    for (std::uint64_t tick = 0; tick <= 192; ++tick) {
        const auto replayed = replay.onTick(tick);
        if (tick == 64) {
            assert(replayed.type == flode::JungEventType::InterventionStart);
            assert(near(replayed.decisionRoll, notableEvents[0].decisionRoll));
            assert(replayed.rngState == notableEvents[0].rngState);
        }
    }

    bool rejectedNonSequentialTick = false;
    try {
        replay.onTick(194);
    } catch (const std::invalid_argument&) {
        rejectedNonSequentialTick = true;
    }
    assert(rejectedNonSequentialTick);

    std::cout << "flode JUNG v0.1 deterministic controller test: PASS\n";
    return 0;
}
