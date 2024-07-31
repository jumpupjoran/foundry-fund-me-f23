// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // before startBroadcast --> not a 'real' transaction
        HelperConfig helperConfig = new HelperConfig();
        vm.startBroadcast();
        // after startBroadcast --> 'real' transaction
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
