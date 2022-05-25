// internal tables 
// with `time` and `sym` columns added by RT client for compatibility
(`$"_prtnEnd")set ([] time:"n"$(); sym:`$(); startTS:"p"$(); endTS:"p"$(); opts:())
(`$"_reload")set ([] time:"n"$(); sym:`$(); mount:`$(); params:())

//trade:([] time:"n"$(); sym:`$(); realTime:"p"$(); price:"f"$(); size:"j"$())
//quote:([] time:"n"$(); sym:`$(); realTime:"p"$(); 
//        bid:"f"$(); ask:"f"$(); bidSize:"j"$(); askSize:"j"$())
//ftags:([] time:"n"$(); sym:`$(); x:"f"$())


//bitMEX tables 
orderbook:([]`s#time:"p"$();`g#sym:`$(); side:`$();price:"f"$();size:"f"$();id:"f"$();action:`$())
bitmexbook:([]`s#time:"p"$();`g#sym:`$(); bids:();bidsizes:();asks:();asksizes:())
trade: ([]`s#time:"p"$();`g#sym:`$(); side:`$();size:"f"$();price:"f"$();tickDirection:`$();trdMatchID:`$();grossValue:"f"$();homeNotional:"f"$();foreignNotional:"f"$())


//ETH tables
eth_txns_pending:([]time:"p"$();sym:`g#`$();blockHash:();blockNumber:();chainId:();condition:();creates:();from_address:();to_address:();gas:();gasPrice:();hash:();input:();nonce:();publicKey:();r:();raw:();s:();standardV:();transactionIndex:();type_txn:();v:();val:();accessList:();maxFeePerGas:();maxPriorityFeePerGas:())
