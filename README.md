# Alternative AMMs

This is a project that contains two alternative AMMs to reduce the LVR. One is function-maximizing AMM introduced in cowswap's paper, and the other is dual pool AMM, motivated by A.Nezlobin's thread and Muffin finance.

Both are written in vyper since the author hates curly brackets.

The simulation code for their performance is basically copy & paste of codes written by A.Nezlobin and Atis E., with very little adjustments.

The design of overall contract structure is heavily affected by that of muffin and balancer.

The code style and references are mostly from snekmate, uniswap-v2-vyper contracts, and curve.

Lastly the justification of on-chain batching is motivated by M.Resnick et al.'s paper on censorship-resistance of on-chain auction.

## Repository Structure

The repository is organized as follows: TBD
