# Raft

## 领导者选举

Raft中的服务器有三种状态：`Leader`、`Follower`、`Candidate`。

- Raft利用**心跳机制**来切换或者维持当前的状态

- leader: 周期性地向其他节点发送心跳包，来维持自己的地位。
- follower: 一直等待leader的心跳包，如果在一段时间内没有收到，那么它会变成candidate，然后发起选举并且给自己投票。
- candidate: 发起选举，如果它收到了大多数节点的投票，那么它就会变成leader。

### 选举结果

赢得选举的条件：在一个**随机**的限定时间内获得超过**半数**选票

1. 一个candidate赢得选举并成为leader。如果有其他candidate，那他们必然选举失败，会在接收到新leader的心跳会恢复follower状态
2. 得票分散，没有candidate赢得选举，部分candidate就会在超时之后进入下一个term，开启新的选举。这里**随机**的选举超时时间能够保证很快就会有一个新leader出现。
