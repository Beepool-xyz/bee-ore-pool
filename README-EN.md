# Bee-Ore-Pool Mining Pool


Welcome to Bee-Ore-Pool, a high-efficiency dual mining pool designed specifically for Ore and Coal. [中文版本](https://github.com/orepool/bee-ore-pool/blob/master/README.md)

## Bee-Ore-Pool Average Earnings

- September 10, 2024: With a hashrate of 43MH/s, the 24-hour output was 110 ORE, with an average yield of 2.55 ORE per 1MH/s.

Based on recent data, the pool’s yield per 1MH/s is approximately 2.2 to 3 ORE, depending on the total ORE network hashrate.

## Quick Start Guide

### Follow these steps to quickly start your mining

```bash
git clone https://github.com/Beepool-xyz/bee-ore-pool.git
cd bee-ore-pool
```

### Start running (replace wallet_address with your wallet address)

Startup for Linux
```bash
./start.sh wallet_address 
```

Startup for Macs with M-series chips
```bash
./start-mac.sh wallet_address 
```


### **Important Tips**： 

#### Wallet Preparation: Ensure your wallet is activated for Ore and Coal SPL accounts to receive mining profits.

#### If your wallet has ever held ore/coal, it indicates the account is activated. If unsure, you can purchase any amount from the jup or okex web3 wallet.

- ore purchase link: https://jup.ag/swap/SOL-oreoU2P8bN6jkk3jbaiVxYnG1dCXcYxwhwyK9jSybcp

- coal purchase link: https://jup.ag/swap/SOL-E3yUqBNTZxV8ELvW99oRLC7z4ddbJqqR4NphwrMug9zu


---
## How It Works


Bee-Ore-Pool runs mining pool servers and uses multiple wallets to obtain mining tasks. Miners fetch the current task with the lowest difficulty every 10-20 seconds from the server, compute for 20 seconds, and submit the highest difficulty answer they obtain.

The server records the wallet of the submitter with the highest difficulty. When a submission is required within 55 seconds, the highest difficulty answer is submitted to the blockchain and a mining fee is charged.

----

# Unique Features of the Mining Pool

## Double Happiness

Mine both Ore and Coal simultaneously without affecting Ore profits while increasing Coal earnings.

## Higher Computing Efficiency (Multi-process model + C-implemented computation library)
- Supports CPUs with over 100 cores, reaching up to 70,000 H/s on a dual 9654 setup.
- Achieves a 5%-10% performance improvement on lower-core machines.

## Flexible Account Pool

Supports expansion per account, always maintaining a minimum blockchain difficulty of about 23 to ensure maximum profits.

---
# Features Common with Other Advanced Mining Pools


## Better Bus Selection


In the mine, there are 8 buses (each with 1/8 reward capacity). ore-cli submits rewards to a randomly selected bus, but there’s imbalance among the buses. If the chosen bus’s reward is zero, the submitted reward will be zero. ore-miner selects the best bus for submission (checking the best bus on-chain), ensuring full rewards. The efficiency gain here is not quantified.



## Reward Collection Principles


When using our mining pool, you only need to provide an activated ORE wallet to receive rewards in real-time. Unlike traditional mining pools, which can distribute coins in real-time but take over two hours to process payments, our pool submits rewards via contract, allowing rewards to be received directly in your wallet immediately.

By using contracts, every transaction can be verified on-chain, including our commission ratio, ensuring absolute transparency.


## Easier Maintenance


We handle blockchain interactions. Miners only need to obtain tasks, compute, and submit answers, without dealing with complex blockchain interactions. We use an account pool on the server side for proof requests and task distribution, so users do not need to maintain multiple private wallet keys.

Just start a Miner, and the same wallet address can be used. We also provide multi-platform Miners and related scripts.


## Security


Only the wallet public key is needed, with no risk of private key disclosure.

---

## Special Note on Gas Fees


Using ore-cli to submit rewards usually incurs Gas fees, which can consume more than 50% of the rewards in many cases. In contrast, our mining pool employs an innovative ORE deduction scheme for Gas fees, significantly reducing the burden on users.

Specifically, if the submission difficulty is low and Gas fees are insufficient, the mining pool will cover the remaining part. In cases of high difficulty, the system deducts Gas fees from the rewards first, and the remaining rewards are then distributed to user accounts proportionally. The main advantages of this approach include:

1. **No worries about Gas fees**: Users do not need to worry about high Gas fees for each submission, as the mining pool handles these costs.
2. **Prevention of penalties**: Each submission is processed, ensuring that submissions are not penalized due to Gas fee issues.。
3. **No impact on future rewards**: Handling Gas fees does not affect subsequent submissions’ rewards, and users only bear Gas costs when they are actually profitable.

Through this scheme, we ensure that users can focus on mining without overly concerning themselves with Gas costs, enhancing the overall mining experience and efficiency.

----

# Mining Pool Fees: 
ore: After deducting gas, a 15% split is taken (Server Maintenance Fee | Software Maintenance and Update Fee | Subsidizing Gas Deficits for Low-Difficulty Transactions).

coal: All proceeds go to the user, with no deductions.

## Contact Us

 - ### [Telegram] https://t.me/minenodepool/5 - Join our Telegram group for more information and support.

## Other Links

- ### [Contract Address](https://solscan.io/account/7izHHMQNrvCs1WKDn1YQvmd82smDmChzpB9pGynHmgtv)
- ### [Data Dashboard](https://dune.com/links789/ore-mine-pool)
