// SPDX-License-Identifier: HWAAM
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {VyperDeployer} from "lib/snekmate/lib/utils/VyperDeployer.sol";
import "src/IFMAMM_vault.sol";
import "src/IFMAMM_pair.sol";

contract FMAMM is Test {
    IFMAMM_vault public vault;
    IFMAMM_pair public pair_template;
    VyperDeployer public vyperDeployer;

    function setUp() public {
        // fork mainnet
        // deal ether

        console.log("tester address: ", address(this));

        vyperDeployer = new VyperDeployer();
        console.log("vyperDeployer: ", address(vyperDeployer));

        pair_template = IFMAMM_pair(vyperDeployer.deployContract("vyper_contracts/", "FMAMM_pair"));
        console.log("pair_template: ", address(pair_template));

        vault = IFMAMM_vault(
            vyperDeployer.deployContract("vyper_contracts/", "FMAMM_vault", abi.encode(address(pair_template)))
        );
        console.log("vault: ", address(vault));

        require(address(vault) != address(0));
        require(address(pair_template) != address(0));
    }

    function test_deposit() public {
        // deal st-yETH & sDAI
        // deposit st-yETH & sDAI
    }

    function test_create_pair() public {
        // deal st-yETH & sDAI
        // deposit st-yETH & sDAI
        // create pair
    }

    function test_swap() public {
        // deal st-yETH & sDAI
        // deposit st-yETH & sDAI
        // create pair
        // swap
    }

    function test_mint() public {
        // deal st-yETH & sDAI
        // deposit st-yETH & sDAI
        // create pair
        // swap
        // mint
    }

    function test_burn() public {
        // deal st-yETH & sDAI
        // deposit st-yETH & sDAI
        // create pair
        // swap
        // mint
        // burn
    }
}
