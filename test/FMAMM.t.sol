// SPDX-License-Identifier: HWAAM
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {VyperDeployer} from "lib/snekmate/lib/utils/VyperDeployer.sol";
import "src/IFMAMM_vault.sol";
import "src/IFMAMM_pair.sol";

contract FMAMM is Test {
    IFMAMM_vault public vault;
    IFMAMM_pair public pair;
    VyperDeployer public vyperDeployer;

    function setUp() public {
        vyperDeployer = new VyperDeployer();
        vault = IFMAMM_vault(vyperDeployer.deployContract("vyper_contracts/", "FMAMM_vault"));
        pair = IFMAMM_pair(vyperDeployer.deployContract("vyper_contracts/", "FMAMM_pair"));
    }

    function test_vault() public {
        require(address(vault) != address(0));
    }

    function test_pair() public {
        require(address(pair) != address(0));
    }
}
