# 在同一個 Foundry 資料夾編譯不同版本的 Solidity 合約

## TD;LR

### 方法一

在 `foundry.toml` 裡加上 `auto_detect_solc = true`（ foundry 的預設值就為真）。依此設定，即可不用建立多重版本 `Profile`。


### 方法二
**建立多重版本的 [`Profile`](https://book.getfoundry.sh/reference/config/overview#profiles)** \
只需要在每個指令前加上 `FOUNDRY_PROFILE=` 關鍵字，即可讓 foundry 套用不同設定檔運作。

## 方法二的實際範例

假設我們需要撰寫兩份 solidity 合約：一份使用 `solc` v0.4.26，另一份使用 `solc` v0.8.0。

依此情況，如果讀者使用 hardhat 套件，則只需在 `hardhat.config.js` 進行一些[必要配置](https://hardhat.org/hardhat-runner/docs/advanced/multiple-solidity-versions)即可無縫編譯兩個檔案。然而，目前 foundry 尚未支援多版本 `solc` 編譯；因此，我們只能設計兩份 `Profile` 配置來達成類似的效果。

1. 請建立以下資料夾結構（或執行 `init.sh` 腳本來自動建立）

```Shell
📂
 ├── 📂 cache
 ├── 📂 cache-0-4-26
 ├── 📂 lib
 ├── 📂 lib-0-4-26
 ├── 📂 out
 ├── 📂 out-0-4-26
 ├── 📂 src
 │    └── 📄 hello-0-8-0.sol
 ├── 📂 src-0-4-26
 │    └── 📄 hello-0-4-26.sol
 └── 📄 foundry.toml
```

2. 在 `src` 底下放置將以 `solc` v0.8.0 編譯的合約（或執行 `init.sh` 腳本來自動建立）
3. 在 `src-0-4-26` 底下放置將以 `solc` v0.4.26 編譯的合約（或執行 `init.sh` 腳本來自動建立）
4. `foundry.toml` 的檔案內容如下（或執行 `init.sh` 腳本來自動建立）

```Toml
[profile.default]
src = "src"
out = "out"
libs = ["lib"]
cache_path = "cache"
solc_version = "0.8.0"
auto_detect_solc = false

[profile.solc_0_4_26]
src = "src-0-4-26"
out = "out-0-4-26"
libs = ["lib-0-4-26"]
cache_path = "cache-0-4-26"
solc_version = "0.4.26"
auto_detect_solc = false

# [Docs] https://github.com/foundry-rs/foundry/tree/master/config
```

5. 只要在每次執行任何指令之前，加上 `FOUNDRY_PROFILE=default` 或 `FOUNDRY_PROFILE=solc_0_4_26`，就能切換運行不同版本的 `solc`
   - 例如：編譯 `hello-0-4-26.sol` 合約
     - `$ FOUNDRY_PROFILE=solc_0_4_26 forge build`
   - 例如：（在 `solc` v0.4.26 環境）安裝 `forge-std` 套件（請確保已為 git repository）
     - `$ FOUNDRY_PROFILE=solc_0_4_26 forge install foundry-rs/forge-std`
