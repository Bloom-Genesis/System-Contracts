// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Params {
    bool public initialized;

    // System contracts
    address
        public constant ValidatorContractAddr = 0x000000000000000000000000000000000000f000;
    address
        public constant PunishContractAddr = 0x000000000000000000000000000000000000F001;
    address
        public constant ProposalAddr = 0x000000000000000000000000000000000000F002;

    // System params
    uint16 public constant MaxValidators = 100;
    // Validator have to wait StakingLockPeriod blocks to withdraw staking
    uint64 public constant StakingLockPeriod = 28800;
    // Validator have to wait WithdrawProfitPeriod blocks to withdraw his profits
   // uint64 public constant WithdrawProfitPeriod = 28800;
    uint256 public constant MinimalStakingCoin = 32 ether;
    // minimum initial staking to become a validator
    uint256 public minimumValidatorStaking = 24752475 ether;
    address public constant treasuryWallet = 0x8b5DDDee10Df66D62AF636a6Bbe4A6f854eA5e8a;


    // percent distrubution of Gas Fee earned by validator 100000 = 100%
    uint public constant stakerPartPercent = 30000;          //30%
    uint public constant validatorPartPercent = 40000;        //40%
    uint public constant burnPartPercent = 10000;                //10%
    uint public constant contractPartPercent = 10000;        //10%
    uint public constant treasuryPartPercent = 10000;        //10%
    uint public constant burnStopAmount = 1000000000 ether;      // after 1,000,000,000 coins burn, it will stop burning
    uint public totalBurnt;



    modifier onlyMiner() {
        require(msg.sender == block.coinbase, "Miner only");
        _;
    }

    modifier onlyNotInitialized() {
        require(!initialized, "Already initialized");
        _;
    }

    modifier onlyInitialized() {
        require(initialized, "Not init yet");
        _;
    }

    modifier onlyPunishContract() {
        require(msg.sender == PunishContractAddr, "Punish contract only");
        _;
    }

    modifier onlyBlockEpoch(uint256 epoch) {
        require(block.number % epoch == 0, "Block epoch only");
        _;
    }

    modifier onlyValidatorsContract() {
        require(
            msg.sender == ValidatorContractAddr,
            "Validators contract only"
        );
        _;
    }

    modifier onlyProposalContract() {
        require(msg.sender == ProposalAddr, "Proposal contract only");
        _;
    }
}
