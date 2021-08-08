// SPDX-License-Identifier: MIT
pragma solidity =0.8.6;

interface AggregatorV3Interface {
    function decimals() external view returns (uint8);

    function description() external view returns (string memory);

    function version() external view returns (uint256);

    // getRoundData and latestRoundData should both raise "No data present"
    // if they do not have data to report, instead of returning unset values
    // which could be misinterpreted as actual reported values.
    function getRoundData(uint80 _roundId)
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );
}

contract MockUSDETH is AggregatorV3Interface {
    function decimals() external override pure returns (uint8) {
        return 2;
    }

    function description() external override pure returns (string memory) {
        return "Mock USD ETH";
    }

    function version() external override pure returns (uint256) {
        return 3;
    }

    function getRoundData(uint80 _roundId)
        external
        override
        pure
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        )
    {
        return (_roundId, 3000, 0, 0, 0);
    }

    function latestRoundData()
        external
        override
        pure
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        )
    {
        return (1, 3000, 0, 0, 0);
    }
}
