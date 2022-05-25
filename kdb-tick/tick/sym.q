// internal tables 
// with `time` and `sym` columns added by RT client for compatibility
(`$"_prtnEnd")set ([] time:"n"$(); sym:`$(); startTS:"p"$(); endTS:"p"$(); opts:())
(`$"_reload")set ([] time:"n"$(); sym:`$(); mount:`$(); params:())

//trade:([] time:"n"$(); sym:`$(); realTime:"p"$(); price:"f"$(); size:"j"$())
//quote:([] time:"n"$(); sym:`$(); realTime:"p"$(); 
//        bid:"f"$(); ask:"f"$(); bidSize:"j"$(); askSize:"j"$())
//ftags:([] time:"n"$(); sym:`$(); x:"f"$())

orderbook:([] time:"n"$();`g#sym:`$(); side:`$();price:"f"$();size:"f"$();id:"f"$();action:`$())
bitmexbook:([]`s#time:"p"$();`g#sym:`$(); bids:();bidsizes:();asks:();asksizes:())
trade: ([]`s#time:"p"$();`g#sym:`$(); side:`$();size:"f"$();price:"f"$();tickDirection:`$();trdMatchID:`$();grossValue:"f"$();homeNotional:"f"$();foreignNotional:"f"$())

