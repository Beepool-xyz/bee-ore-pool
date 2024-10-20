# Bee-Ore-Pool 矿池


欢迎使用 Bee-Ore-Pool，一个专为 Ore 和 Coal 设计的高效双挖矿池。[English Version](https://github.com/orepool/bee-ore-pool/blob/master/README-EN.md)

## Bee-Ore-Pool 平均收益

- 2024年9月10号：43MH/S算力24小时产出110个ORE，平均每百万的算力产出为2.55个ORE。

根据最近的数据统计，矿池每百万的算力大概为2.2～3ORE之间(受ORE整体算力影响)。

## 快速启动指南

### 按照以下步骤快速启动您的矿机：

```bash
git clone https://github.com/Beepool-xyz/bee-ore-pool.git
cd bee-ore-pool
```

### 开始运行 （wallet_address 更改为你的钱包地址）

Linux启动启动方式
```bash
./start.sh wallet_address 
```

m系列芯片的mac启动
```bash
./start-mac.sh wallet_address 
```

Docker启动
```bash
sudo docker pull links789/beeoremine:2.0.7
sudo docker run -d --name orework -e WALLET_ADDRESS=3e4CUVZohTirWueZufZd2ec512km2BfekyxKrVai --restart unless-stopped beeoremine:2.0.7
```

windows环境推荐使用docker运行

windows因为机制原因超过64核需要多开才能跑满，相对会比较麻烦


### **重要提示**： 

#### 钱包准备：确保您的钱包已开通 Ore 和 Coal 的 SPL 账户，以接收挖矿收益。

#### 只要钱包里面拥有过ore/coal 就代表已经开通了帐户，如果不确定是否开通可以去 jup或者okex web3 钱包购买任意数量。

- ore 购买链接： https://jup.ag/swap/SOL-oreoU2P8bN6jkk3jbaiVxYnG1dCXcYxwhwyK9jSybcp

- coal 购买链接： https://jup.ag/swap/SOL-E3yUqBNTZxV8ELvW99oRLC7z4ddbJqqR4NphwrMug9zu


---
## 工作原理


Bee-Ore-Pool 运行矿池服务器并使用多个钱包来获取挖矿任务。Miner 每 10-20 秒从服务器获取难度最低的当前任务，进行 20 秒的计算，并提交获得的最高难度答案。

服务器记录难度最高的提交者的钱包。当任务需要在55秒内提交时，最高难度的答案将提交到区块链，并收取矿工费。

----

# 矿池特色功能

## 双倍快乐

同时挖 Ore 和 Coal，不影响 Ore 收益的同时增加 Coal 收益。

## 更高的计算效率 （多进程模型 + C实现的计算库）
- 支持100核心以上的 CPU，在双路9654上，单开算力可达 70,000 H/s。
- 在低核心的机器上也能实现5%-10%的性能提升。

## 灵活账号池

支持逐个账号的扩展，最低上链难度始终保持在约23，确保最大收益。

## 支持qubic与ore调度双挖

新增动态账号池功能，使qubic与ore调度更加流畅，最大化你的机器收益。

[简单的说明和示例](https://github.com/orepool/bee-ore-pool/blob/master/qubicOrOre.md)

---
# 和其他先进矿池一样拥有的功能


## 更好的公交选择


在矿石中，有 8 辆公共汽车（每辆都有 1/8 的奖励容量）。ore-cli 向随机选择的总线提交奖励，但总线之间存在不平衡。如果随机选择的公交车的奖励为零，则提交的奖励将为零。ore-miner选择最佳公交车进行提交（在链上查看最优公交车），确保全额奖励。效率的提高在这里没有量化。



## 奖励领取原则


在使用我们的矿池时，您只需提供已开户的 ORE 钱包，即可实时领取奖励。与传统矿池不同的是，传统矿池虽然可以实时分配币，但打款到账时间通常需要两个小时以上，而我们的矿池通过合约提交的方式，在提交的同时即可将奖励直接领取到您的钱包，实现真正的实时到账。

由于采用了合约的方式，每一笔交易都可以在链上进行查询，包括我们的抽成比例，确保了绝对的透明化。


## 更易于维护


我们处理区块链交互，Miner只需要获取任务、计算和提交答案，无需处理复杂的区块链交互，使其更易于维护。我们在服务端使用帐户池的方式进行proof的请求和任务下发，用户无需自己维护多个私钥钱包。

只需要启动一个Miner者即可，钱包地址都是可以使用同一个，我们还提供多平台的Miner和相关脚本。


## 安全


只需要钱包公钥，没有私钥泄露的风险。

---

## gas费用特别说明


在使用ore-cli提交奖励时，通常会产生 Gas 费用，这在许多情况下可能会消耗超过 50% 的奖励。相比之下，我们的矿池采用了创新的 ORE 抵扣 Gas 费用方案，大大减轻了用户的负担。

具体来说，当提交的难度较低时，如果 Gas 费用不足，由矿池会补足剩余部分。而在难度较高的情况下，系统会先从奖励中扣除 Gas 费用，剩余的奖励再按比例发放到用户账户。这种做法的主要优点包括：

1. **无需担心 Gas 费用问题**：用户不必为每次提交担心高额的 Gas 费用，因为矿池会处理这部分费用。
2. **防止被惩罚**：每笔提交都得到处理，确保提交不会因 Gas 费用问题而被惩罚。
3. **不影响未来奖励**：Gas 费用的处理不会影响后续提交的奖励，用户只有在实际盈利的情况下才需要承担 Gas 费用。

通过这种方案，我们确保了用户可以专注于挖矿，而无需过多关注 Gas 费用，提升了挖矿的整体体验和效率。

----

# 矿池费：
ore: 抵扣gas后，进行15%分成(服务器维护费 | 程序维护和更新费用 | 补贴部分低难度交易的gas亏空）。

coal: 全部给到用户，不收取抽成。

## 联系我们

 - ### [电报] https://t.me/minenodepool/5 - 加入我们的电报群获取更多信息和支持。

## 其他链接

- ### [合约地址](https://solscan.io/account/7izHHMQNrvCs1WKDn1YQvmd82smDmChzpB9pGynHmgtv)
- ### [数据面板](https://dune.com/links789/ore-mine-pool)
