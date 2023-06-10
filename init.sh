#!/bin/bash

mkdir cache
mkdir lib
mkdir out
mkdir src

mkdir cache-0-4-26
mkdir lib-0-4-26
mkdir out-0-4-26
mkdir src-0-4-26

touch src/hello-0-8-0.sol
echo '// SPDX-License-Identifier: GPL-3.0'                >> src/hello-0-8-0.sol
echo 'pragma solidity 0.8.0;'                             >> src/hello-0-8-0.sol
echo ''                                                   >> src/hello-0-8-0.sol
echo 'contract Hello {'                                   >> src/hello-0-8-0.sol
echo '    string bar;'                                    >> src/hello-0-8-0.sol
echo '    '                                               >> src/hello-0-8-0.sol
echo '    function foo(string calldata input) public {'   >> src/hello-0-8-0.sol
echo '        bar = input;'                               >> src/hello-0-8-0.sol
echo '    }'                                              >> src/hello-0-8-0.sol
echo '}'                                                  >> src/hello-0-8-0.sol

touch src-0-4-26/hello-0-4-26.sol
echo '// SPDX-License-Identifier: GPL-3.0'        >> src-0-4-26/hello-0-4-26.sol
echo 'pragma solidity 0.4.26;'                    >> src-0-4-26/hello-0-4-26.sol
echo ''                                           >> src-0-4-26/hello-0-4-26.sol
echo 'contract Hello {'                           >> src-0-4-26/hello-0-4-26.sol
echo '    string bar;'                            >> src-0-4-26/hello-0-4-26.sol
echo '    '                                       >> src-0-4-26/hello-0-4-26.sol
echo '    function foo(string input) public {'    >> src-0-4-26/hello-0-4-26.sol
echo '        bar = input;'                       >> src-0-4-26/hello-0-4-26.sol
echo '    }'                                      >> src-0-4-26/hello-0-4-26.sol
echo '}'                                          >> src-0-4-26/hello-0-4-26.sol

touch foundry.toml
echo '[profile.default]'                                         >> foundry.toml
echo 'src = "src"'                                               >> foundry.toml
echo 'out = "out"'                                               >> foundry.toml
echo 'libs = ["lib"]'                                            >> foundry.toml
echo 'cache_path = "cache"'                                      >> foundry.toml
echo 'solc_version = "0.8.0"'                                    >> foundry.toml
echo 'auto_detect_solc = false'                                  >> foundry.toml
echo ''                                                          >> foundry.toml
echo '[profile.solc_0_4_26]'                                     >> foundry.toml
echo 'src = "src-0-4-26"'                                        >> foundry.toml
echo 'out = "out-0-4-26"'                                        >> foundry.toml
echo 'libs = ["lib-0-4-26"]'                                     >> foundry.toml
echo 'cache_path = "cache-0-4-26"'                               >> foundry.toml
echo 'solc_version = "0.4.26"'                                   >> foundry.toml
echo 'auto_detect_solc = false'                                  >> foundry.toml
echo ''                                                          >> foundry.toml
echo '# [Docs] https://github.com/foundry-rs/foundry/tree/master/config' >> foundry.toml
