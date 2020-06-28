$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		$items:=New object:C1471("col";New collection:C1472;"sel";New collection:C1472;"item";Null:C1517;"pos";0)
		
		$metas:=New collection:C1472(New object:C1471;New object:C1471)
		$metas[0].stroke:="#F5EEF8"
		$metas[0].fill:="#633974"
		$metas[1].stroke:="#633974"
		$metas[1].fill:="#F5EEF8"
		
		$items.metas:=$metas
		Form:C1466.items:=$items
		
		$items.currentItemValue:=Formula:C1597(m_current_item_value (This:C1470.col;This:C1470.pos))
		
		FONT LIST:C460($fonts)  //sample data
		ARRAY TO COLLECTION:C1563($items.col;$fonts)  //flat collection (not collection of objects)
		
		$items.index:=Formula:C1597(This:C1470.col:=This:C1470.col.map("map_flat_collection";New object:C1471("pos";1)))
		
		$items.index()
		
End case 